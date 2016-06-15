Memory Blocks
In computer systems it is necessary to provide a substantial amount of memory. If a system is implemented
using FPGA technology it is possible to provide some amount of memory by using the memory resources that exist
in the FPGA device. If additional memory is needed, it has to be implemented by connecting external memory
chips to the FPGA. In this exercise we will examine the general issues involved in implementing such memory.
A diagram of the random access memory (RAM) module that we will implement is shown in Figure 1a. It
contains 32 eight-bit words (rows), which are accessed using a five-bit address port, an eight-bit data port, and a
write control input. We will consider two different ways of implementing this memory: using dedicated memory
blocks in an FPGA device, and using a separate memory chip.
The Cyclone II 2C35 FPGA that is included on the DE2 board provides dedicated memory resources called
M4K blocks. Each M4K block contains 4096 memory bits, which can be configured to implement memories of
various sizes. A common term used to specify the size of a memory is its aspect ratio, which gives the depth in
words and the width in bits (depth x width). Some aspect ratios supported by the M4K block are 4K x 1, 2K x
2, 1K x 4, and 512 x 8. We will utilize the 512 x 8 mode in this exercise, using only the first 32 words in the
memory. We should also mention that many other modes of operation are supported in an M4K block, but we will
not discuss them here.


![RAM][ram]

	Fig 1. RAM implementation

[ram]: https://github.com/MarianyFerreira/INE5406-SD/blob/master/PLabs/PLab3/RAM.png

![DE2 Imagem][de2]

	Fig 2. DE2 FPGA

[de2]: https://github.com/MarianyFerreira/FPGA-audio-looper/blob/master/DE2/DE2layout.JPG?raw=true
