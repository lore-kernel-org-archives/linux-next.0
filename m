From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: qemu boot failures with today's linux-next
Date: Mon, 15 Oct 2018 23:45:10 +1100
Message-ID: <87murfz8dl.fsf@concordia.ellerman.id.au>
References: <20181015191859.2f600de5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181015191859.2f600de5@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> Today's linux-next tree does not boot in qemu (with kvm or without).
> Here is the (non-kvm) boot log (the kvm one is basically the same):
>
> ------------------------------------------------------
...
>   Welcome to Open Firmware
>
>   Copyright (c) 2004, 2017 IBM Corporation All rights reserved.
>   This program and the accompanying materials are made available
>   under the terms of the BSD License available at
>   http://www.opensource.org/licenses/bsd-license.php
>
> Booting from memory...
> OF stdout device is: /vdevice/vty@71000000
> Preparing to boot Linux version 4.19.0-rc7 (sfr@ash) (gcc version 8.2.0 (Debian 8.2.0-4)) #2 SMP Mon Oct 15 18:53:28 AEDT 2018
                                  ^^^^^^^^^^
                                  I assume that's wrong, this is actually linux-next you're booting?


> Detected machine type: 0000000000000101
> command line: 
> Max number of cores passed to firmware: 2048 (NR_CPUS = 2048)
> Calling ibm,client-architecture-support... done
> memory layout at init:
>   memory_limit : 0000000000000000 (16 MB aligned)
>   alloc_bottom : 0000000001640000
>   alloc_top    : 0000000030000000
>   alloc_top_hi : 0000000080000000
>   rmo_top      : 0000000030000000
>   ram_top      : 0000000080000000
> instantiating rtas at 0x000000002fff0000... done
> prom_hold_cpus: skipped
> copying OF device tree...
> Building dt strings...
> Building dt structure...
> Device tree strings 0x0000000001850000 -> 0x0000000001850a02
> Device tree struct  0x0000000001860000 -> 0x0000000001870000
> Quiescing Open Firmware ...
> Booting Linux via __start() @ 0x0000000000400000 ...
> ------------------------------------------------------
>
> I have no idea what may have caused this.

If you git Ctrl-a-c you should get the qemu prompt. Then you can run
'info registers' to print the regs and maybe see where it's stuck.

And/or build with EARLY_DEBUG_LPAR to get early console output.

cheers
