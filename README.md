# IRMP Mini Board

This repository contains both PCB and case for IRMP project.
IRMP stands for "**I**nfra**R**ed **M**ulti**P**rotocol decoder".
This board is for STM32 port, which is developed by [Jörg Riechardt][1] and slightly modified (mostly pin assignments) by me.

## Assembly

![Assembly preview][pic_assembly]

## Schematic

![Schematic][pic_schematic]

## Components

As you see, there are not too much components. In fact, the board can be assembled in about half an hour or less, depending on your soldering skills. Please be aware that the smallest components are in size 0402, which is still perfectly solderable, although may require some practice and patience. This is done intentionally to keep the size small.

Here is a list of components to order:

|Reference        | Quantity | Value           | Footprint    | Remark                                                                                  |
| --------------- | -------- | --------------- | ------------ | --------------------------------------------------------------------------------------- |
| C1              | 1        | 100.0µ          | Case B       | Tantalum capacitor                                                                      |
| C2 C5           | 2        | 15p             | 0402         |                                                                                         |
| C3 C6           | 2        | 1.0u            | 0603         |                                                                                         |
| C4 C7 C8 C9 C10 | 5        | 0.1u            | 0402         |                                                                                         |
| D1              | 1        | GREEN           | 0603         |                                                                                         |
| D2              | 1        | RED             | 0603         |                                                                                         |
| R1 R2           | 2        | 20              | 0402         |                                                                                         |
| R3              | 1        | 4k7             | 0402         |                                                                                         |
| R4              | 1        | 100             | 0402         |                                                                                         |
| R5 R6           | 2        | 1k              | 0402         |                                                                                         |
| U1              | 1        | TSOP77338       | Heimdall     | Vishay Heimdall package                                                                 |
| U2              | 1        | MIC5504-3.3YM5  | SOT-23-5     |                                                                                         |
| U3              | 1        | STM32F103T8U6   | VFQFPN-36    |                                                                                         |
| X1              | 1        | 10118192-0001LF | USB2_MICRO_B | Most common USB micro B package. 10118192-0001LF from Amphenol ICC (FCI) fits perfectly |
| XC1             | 1        | 8MHz            | 3225         | 4 pin passive crystal in SMD 3225 package                                               |

## HowTo

- Order all components or make sure they are available
- Order the board. Gerbers are [here][2]
- Solder the board. I'd suggest soldering USB connector and power supply part first, checking if it works and then soldering the rest
- Download DFU bootloader [here][3]
- Flash the DFU bootloader using your favourite SWD adapter. Pin assignments are in the [assembly section](#assembly).
- Connect the board. It will be recognized as "STM32 Bootloader"
- Take the fw [here][4] (the most recent ```*IrmpMini_BL*.bin```)
- Run ```dfu-util -w -D <path_to_the_fw>```. DFU utility can be taken [here][5]
- Wait until the new FW is downloaded
- Reconnect the board

[pic_assembly]: images/pcb.png
[pic_schematic]: images/schematic.png

[1]: https://github.com/j1rie
[2]: https://github.com/Sl-Alex/IRMP_STM32_MINI/tree/main/plots
[3]: https://github.com/Sl-Alex/STM32F103-bootloader/raw/master/binaries/boot.IrmpMini.bin
[4]: https://github.com/Sl-Alex/IRMP_STM32/tree/master/binaries/firmware_for_bootloader
[5]: https://github.com/Sl-Alex/IRMP_STM32/tree/master/binaries/bootloader