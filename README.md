#stm32-robotics

This is the template project for student semestral projects in classes MRBT
and BROB.

Author:
 
> Ing. Frantisek Burian
> Laboratory of Robotics,
> Department of Control and Instrumentation
> Faculty of electrical engineering and communication
> Brno University of Technology

- - -

# Èesky:

Tento repozitáø slouží jako vzorový projekt pro vytváøení projektù v pøedmìtech
Základy Robotiky (BROB) a Robotika (MRBT).

# Návod k použití:

## Stažení repozitáøe

1. Zaregistrujte se na http://www.github.com a pøihlaste se. Pro úèely postupu
   budu pøedpokládat váš login <login>.

2. Proveïte "fork" na tomto repozitáøi (ikona vpravo nahoøe), tím si vytvoøíte
   vlastní kopii, do které mùžete odesílat své zmìny a mùžete tímto zpùsobem
   též projekt odevzdat na konci semestru. 
   Adresa bude https://github.com/<login>/stm32-robotics.git

3. Nainstalujte aktuální verzi TortoiseGIT (ze sourceforge). Nedoporuèuji èeský
   pøeklad, protože pøi pøípadné konzultaci Vám budu radit anglickou verzí názvu.

4. Na disku v adresáøi, kde chcete spravovat zdrojáky kliknìte pravým tlaèítkem,
   a vyberte "Git clone"
   
   - Do políèka URL zadejte adresu Vašeho veøejného repozitáøe - 
       "https://github.com/<login>/stm32-robotics.git".

   - Do políèka Directory zadejte cestu konèící názvem složky jak chcete aby se
     jmenovala na Vašem disku. (napø. projekt)
     
   Vše ostatní nechte výchozí a kliknìte na OK. Nyní by se vám mìl obsah
   veøejného repozitáøe pøesunout k Vám na disk.
   
5. Nyní musíte aktualizovat submoduly tøetích stran:

   Klik pravým tlaèítkem na složce s projektem, menu "TortoiseGIT" položka 
   "Submodule update". Je potøeba vybrat "init" a "update", klik na OK, a
   všechny závislé repozitáøe se Vám pøesunou na disk (zejména ovladaèe k
   mikrokontroleru - libopencm3). 

   HOTOVO.

   Pokud máte nainstalovaný správnì kompilátor gcc (postup dále v tomto souboru),
   již staèí otevøít projekt v Code::Blocks a pøekompilovat projekt, pøípadnì
   rovnou spustit ladìní.
   
## Odesílání zmìn na server

TODO

## Stahování zmìn ze serveru

TODO

## Instalace kompilátoru (Code::Blocks)

TODO

## Instalace kompilátoru (Eclipse)

TODO
