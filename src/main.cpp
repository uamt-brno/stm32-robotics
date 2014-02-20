/*
 * This file is part of the stm32-template project.
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef STM32F4
#define STM32F4
#endif

#include <optl/optl.hpp>
#include <optl/part/stm32f40x.hpp>
#include <optl/console.hpp>
#include <optl/stream.hpp>

using namespace OPTL;

typedef PD12 LED0;
typedef Serial<USART1, PB7, PB6> SERIAL;
typedef Console<BlockingStream<SERIAL> > CONSOLE;

int main(void)
{
	LED0::clock::enable();
	LED0::init_output();
	LED0::driver_pushpull();

	SERIAL::init<16000000, 9600>();
	SERIAL::enable();

	uint32_t i = 0;

	while (1) {
		LED0::toggle();

		Delay<16000000>::delay_ms<500>();

		CONSOLE::puts("Hello, world !\r\nNumber=");
		CONSOLE::putdec32(i++);
		CONSOLE::puts("\r\n");
	}

	return 0;
}
