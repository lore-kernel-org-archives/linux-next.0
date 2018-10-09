From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [linux-next][bisected e3fbcc7c] build error at
 drivers/pci/pcie/aer_inject.c:444:6: error: =?utf-8?Q?=E2=80=98struct_pt?=
 =?utf-8?Q?=5Fregs=E2=80=99?= has no member named =?utf-8?Q?=E2=80=98ip?=
Date: Tue, 09 Oct 2018 20:47:20 +1100
Message-ID: <87woqr1mfr.fsf@concordia.ellerman.id.au>
References: <1539069292.17569.7.camel@abdul.in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1539069292.17569.7.camel@abdul.in.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Abdul Haleem <abdhalee@linux.vnet.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, sachinp <sachinp@linux.vnet.ibm.com>, keith.busch@intel.com, bhelgaas@google.com
List-Id: linux-next.vger.kernel.org

Abdul Haleem <abdhalee@linux.vnet.ibm.com> writes:
> Greeting's
>
> Today's linux-next fails to build on ppc with below error
>
> drivers/pci/pcie/aer_inject.c: In function ‘aer_inject_ftrace_thunk’:
> drivers/pci/pcie/aer_inject.c:444:6: error: ‘struct pt_regs’ has no
> member named ‘ip’
>   regs->ip = (unsigned long) hook->function;
>       ^
> make[3]: *** [drivers/pci/pcie/aer_inject.o] Error 1
> make[2]: *** [drivers/pci/pcie] Error 2
> make[1]: *** [drivers/pci] Error 2
>
> Machine: Power 9
> kernel version: 4.19.0-rc7-next-20181008
> gcc version: 4.8.5 20150623
> config attached
>
> Recent code changes from these commits:
>
> c79ad38b36dd4967d67f83fc48bade37ee041a47 PCI/AER: Abstract AER interrupt handling
> 7b23285f930a8dedcbf749661cd0f2cc27f79be6 PCI/AER: Reuse existing pcie_port_find_device() interface
> e3fbcc7c4b130f81ea586183db561fa3ce9c6447 PCI/AER: Covertly inject errors with ftrace hooks

I don't see this commit in today's linux next (20181009) so presumably
someone else has noticed and dropped the commit?

cheers
