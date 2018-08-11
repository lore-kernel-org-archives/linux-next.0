From: Guenter Roeck <linux@roeck-us.net>
Subject: next-20180810: Traceback observed at at arch/x86/mm/pageattr.c:1211
 __cpa_process_fault
Date: Sat, 11 Aug 2018 14:23:38 -0700
Message-ID: <18c3e11c-10a3-e404-3ca7-3bf1ef8cb96b@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86 <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi,

I noticed the following spurious traceback in next-20180810 when booting an i386 image in qemu.

[    0.000000] ------------[ cut here ]------------
[    0.000000] CPA: called for zero pte. vaddr = cffe0000 cpa->vaddr = cffe0000
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/x86/mm/pageattr.c:1211 __cpa_process_fault+0x327/0x350
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 4.18.0-rc8-next-20180810 #1
[    0.000000] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.11.1-0-g0551a4be2c-prebuilt.qemu-project.org 04/01/2014
[    0.000000] EIP: __cpa_process_fault+0x327/0x350
[    0.000000] Code: 10 c1 e0 0c 03 45 e0 89 45 f0 8b 45 d0 85 c0 75 28 8b 75 d4 e9 12 ff ff ff 8b 07 ff 30 ff 75 e0 68 c0 fc a7 cf e8 99 a1 00 00 <0f> 0b bb f2 ff ff ff 83 c4 0c e9 1c fe ff ff 8b 45 e0 8d b0 00 00
[    0.000000] EAX: 00000040 EBX: 0000ffdf ECX: cfba6a3c EDX: cfba6a3c
[    0.000000] ESI: cffe0000 EDI: cfb81f20 EBP: cfb81e6c ESP: cfb81e30
[    0.000000] DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068 EFLAGS: 00200096
[    0.000000] CR0: 80050033 CR2: ffda3000 CR3: 0fd10000 CR4: 00000690
[    0.000000] Call Trace:
[    0.000000]  __change_page_attr_set_clr+0x2e3/0x790
[    0.000000]  ? serial_putc+0x26/0x40
[    0.000000]  ? uart_console_write+0x48/0x60
[    0.000000]  ? 0xcf000000
[    0.000000]  ? 0xcf000000
[    0.000000]  ? 0xcf000000
[    0.000000]  change_page_attr_set_clr+0x109/0x3a0
[    0.000000]  set_memory_nonglobal+0x1e/0x20
[    0.000000]  pti_init+0xc7/0xdd
[    0.000000]  start_kernel+0x1ca/0x3c0
[    0.000000]  i386_start_kernel+0x94/0x98
[    0.000000]  startup_32_smp+0x164/0x168
[    0.000000] ---[ end trace 638bf57ca2d37b0e ]---

I have seen this only once; I did not see it when repeating the test.

Qemu command line:

qemu-system-i386 -kernel arch/x86/boot/bzImage -M pc -cpu Conroe \
	-no-reboot -m 256 -drive file=rootfs.ext2,if=ide,format=raw \
	--append 'earlycon=uart8250,io,0x3f8,9600n8 root=/dev/sda rw mem=256M vga=0 uvesafb.mode_option=640x480-32 oprofile.timer=1 console=ttyS0 console=tty'
	-nographic

Configuration is i386:defconfig+CONFIG_SMP=n.

Guenter
