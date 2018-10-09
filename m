From: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Subject: Re: [linux-next][bisected e3fbcc7c] build error at
 drivers/pci/pcie/aer_inject.c:444:6: error: =?UTF-8?Q?=E2=80=98struct?=
 =?UTF-8?Q?_pt=5Fregs=E2=80=99?= has no member named =?UTF-8?Q?=E2=80=98ip?=
Date: Tue, 09 Oct 2018 16:10:03 +0530
Message-ID: <1539081603.17569.10.camel@abdul.in.ibm.com>
References: <1539069292.17569.7.camel@abdul.in.ibm.com>
         <87woqr1mfr.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87woqr1mfr.fsf@concordia.ellerman.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, sachinp <sachinp@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel <linux-kernel@vger.kernel.org>, keith.busch@intel.com, linux-next <linux-next@vger.kernel.org>, bhelgaas@google.com
List-Id: linux-next.vger.kernel.org

On Tue, 2018-10-09 at 20:47 +1100, Michael Ellerman wrote:
> Abdul Haleem <abdhalee@linux.vnet.ibm.com> writes:
> > Greeting's
> >
> > Today's linux-next fails to build on ppc with below error
> >
> > drivers/pci/pcie/aer_inject.c: In function ‘aer_inject_ftrace_thunk’:
> > drivers/pci/pcie/aer_inject.c:444:6: error: ‘struct pt_regs’ has no
> > member named ‘ip’
> >   regs->ip = (unsigned long) hook->function;
> >       ^
> > make[3]: *** [drivers/pci/pcie/aer_inject.o] Error 1
> > make[2]: *** [drivers/pci/pcie] Error 2
> > make[1]: *** [drivers/pci] Error 2
> >
> > Machine: Power 9
> > kernel version: 4.19.0-rc7-next-20181008
> > gcc version: 4.8.5 20150623
> > config attached
> >
> > Recent code changes from these commits:
> >
> > c79ad38b36dd4967d67f83fc48bade37ee041a47 PCI/AER: Abstract AER interrupt handling
> > 7b23285f930a8dedcbf749661cd0f2cc27f79be6 PCI/AER: Reuse existing pcie_port_find_device() interface
> > e3fbcc7c4b130f81ea586183db561fa3ce9c6447 PCI/AER: Covertly inject errors with ftrace hooks
> 
> I don't see this commit in today's linux next (20181009) so presumably
> someone else has noticed and dropped the commit?

Yes, the commit is dropped from next-20181009, and now build is fine.

-- 
Regard's

Abdul Haleem
IBM Linux Technology Centre
