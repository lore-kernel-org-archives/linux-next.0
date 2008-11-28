From: "Alexander Beregalov" <a.beregalov@gmail.com>
Subject: Re: next-20081126: x86_64: kernel BUG at kernel/params.c:637
Date: Fri, 28 Nov 2008 15:58:54 +0300
Message-ID: <a4423d670811280458r6e905433xa31d8d67741d8406@mail.gmail.com>
References: <a4423d670811260830w19a67faak38b09f6153579af3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752689AbYK1M7U@vger.kernel.org>
In-Reply-To: <a4423d670811260830w19a67faak38b09f6153579af3@mail.gmail.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>
List-Id: linux-next.vger.kernel.org

2008/11/26 Alexander Beregalov <a.beregalov@gmail.com>:
> Brought up 4 CPUs
> Total of 4 processors activated (23949.39 BogoMIPS).
> khelper used greatest stack depth: 5712 bytes left
> net_namespace: 752 bytes
> NET: Registered protocol family 16
> ACPI FADT declares the system doesn't support PCIe ASPM, so disab
>
> ACPI: bus type pci registered
> PCI: MCFG configuration 0: base e0000000 segment 0 buses 0 - 255
> PCI: MCFG area at e0000000 reserved in E820
> PCI: Using MMCONFIG at e0000000 - efffffff
> PCI: Using configuration type 1 for base access
> PCI: Dell PowerEdge 1950 detected, enabling pci=bfsort.
> ------------[ cut here ]------------
> kernel BUG at kernel/params.c:637!
> invalid opcode: 0000 [#1] PREEMPT SMP DEBUG_PAGEALLOC
> last sysfs file:
> CPU 0
> Modules linked in:
> Pid: 1, comm: swapper Not tainted 2.6.28-rc6-next-20081126 #24
> RIP: 0010:[<ffffffff806d7b25>]  [<ffffffff806d7b25>] param_sysfs_init+0x86/0xf3

Works again on next-20081128
