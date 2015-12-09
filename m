From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Crash caused by "EDAC: Rip out the edac_subsys reference counting"
 (was Re: linux-next: Tree for Dec 8)
Date: Wed, 09 Dec 2015 21:32:47 +1100
Message-ID: <1449657167.17265.4.camel@ellerman.id.au>
References: <20151208154910.78d27c03@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151208154910.78d27c03@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: bp@suse.de
Cc: linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Scott Wood <scottwood@freescale.com>
List-Id: linux-next.vger.kernel.org

On my p5020ds (powerpc e5500) I'm seeing the following oops with next-20151208:

  Unable to handle kernel paging request for data at address 0x00000048
  Faulting instruction address: 0xc000000000366f78
  Oops: Kernel access of bad area, sig: 11 [#1]
  SMP NR_CPUS=24 CoreNet Generic
  Modules linked in:
  CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.4.0-rc4-next-20151208-60840-g856ed20-dirty #110
  task: c0000000f7088000 ti: c0000000f7090000 task.ti: c0000000f7090000
  NIP: c000000000366f78 LR: c00000000036787c CTR: 0000000000000000
  REGS: c0000000f7092e70 TRAP: 0300   Not tainted  (4.4.0-rc4-next-20151208-60840-g856ed20-dirty)
  MSR: 0000000080029000 <CE,EE,ME>  CR: 44a28884  XER: 00000000
  DEAR: 0000000000000048 ESR: 0000000000000000 SOFTE: 1
  GPR00: c00000000036787c c0000000f70930f0 c000000000c5bc00 0000000000000010
  GPR04: 000000000000002f c0000000f70932f0 c0000000009eaa90 000000000000010c
  GPR08: c000000000acbc00 0000000000000070 c0000000007dbc00 c0000000f714a799
  GPR12: 0000000024a28848 c00000003fff5000 c000000000001fe8 0000000000000000
  GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR20: 0000000000000000 0000000000000000 0000000000000000 c000000000bb5798
  GPR24: 0000000000000000 c000000000c2be30 c000000000b68570 c000000000b68d78
  GPR28: ffffffffffffffed 0000000000000010 0000000000000000 0000000000000010
  NIP [c000000000366f78] .kobject_get+0x18/0xa4
  LR [c00000000036787c] .kobject_add_internal+0x4c/0x374
  Call Trace:
  [c0000000f70930f0] [c0000000f7093200] 0xc0000000f7093200 (unreliable)
  [c0000000f7093170] [c00000000036787c] .kobject_add_internal+0x4c/0x374
  [c0000000f7093210] [c000000000367ee0] .kobject_init_and_add+0x5c/0x90
  [c0000000f70932a0] [c0000000005c5460] .edac_pci_create_sysfs+0x1e8/0x230
  [c0000000f7093340] [c0000000005c470c] .edac_pci_add_device+0xe0/0x2e4
  [c0000000f70933e0] [c0000000005c6058] .mpc85xx_pci_err_probe+0x22c/0x4a4
  [c0000000f70934d0] [c0000000000315a8] .fsl_pci_probe+0x38/0x54
  [c0000000f7093550] [c00000000041ec90] .platform_drv_probe+0x58/0xc4
  [c0000000f70935d0] [c00000000041cbb8] .really_probe+0x258/0x328
  [c0000000f7093670] [c00000000041a24c] .bus_for_each_drv+0x7c/0xdc
  [c0000000f7093710] [c00000000041c908] .__device_attach+0xfc/0x14c
  [c0000000f70937b0] [c00000000041b9e8] .bus_probe_device+0xcc/0xd8
  [c0000000f7093840] [c000000000418e78] .device_add+0x42c/0x668
  [c0000000f7093900] [c000000000613664] .of_device_add+0x68/0x7c
  [c0000000f7093970] [c0000000006141a8] .of_platform_device_create_pdata+0xbc/0x134
  [c0000000f7093a10] [c000000000614360] .of_platform_bus_create+0x134/0x224
  [c0000000f7093b00] [c000000000614510] .of_platform_bus_probe+0xc0/0x128
  [c0000000f7093b90] [c000000000ae5934] .corenet_gen_publish_devices+0x20/0x34
  [c0000000f7093c00] [c000000000001794] .do_one_initcall+0xbc/0x23c
  [c0000000f7093cf0] [c000000000ad9f98] .kernel_init_freeable+0x254/0x33c
  [c0000000f7093db0] [c000000000002004] .kernel_init+0x1c/0x1018
  [c0000000f7093e30] [c000000000000898] .ret_from_kernel_thread+0x58/0xc0
  Instruction dump:
  38210080 e8010010 7fe3fb78 ebe1fff8 7c0803a6 4bfffd84 fbe1fff8 7c7f1b79
  7c0802a6 f8010010 f821ff81 41820034 <e93f0038> 792a0fe3 41820064 395f0038
  ---[ end trace 82e0ee2bfb8cb748 ]---


Git bisect says it's caused by:

commit 8d8fcba6d1eabcb11ea0a6027d150a7f2cd0e019
Author: Borislav Petkov <bp@suse.de>
Date:   Fri Nov 27 11:40:43 2015 +0100

    EDAC: Rip out the edac_subsys reference counting

    This was really dumb - reference counting for the main EDAC sysfs
    object. While we could've simply registered it as the first thing in the
    module init path and then hand it around to what needs it.

    Do that and rip out all the code around it, thus simplifying the whole
    handling significantly.

    Move the edac_subsys node back to edac_module.c.

    Signed-off-by: Borislav Petkov <bp@suse.ede>



Presumably caused by the fact that edac_init() is subsys_initcall(), whereas
corenet_gen_publish_devices() is arch_initcall().

cheers
