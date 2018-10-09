From: Bjorn Helgaas <bhelgaas@google.com>
Subject: =?UTF-8?B?UmU6IFtsaW51eC1uZXh0XVtiaXNlY3RlZCBlM2ZiY2M3Y10gYnVpbGQgZXJyb3IgYXQgZA==?=
        =?UTF-8?B?cml2ZXJzL3BjaS9wY2llL2Flcl9pbmplY3QuYzo0NDQ6NjogZXJyb3I6IOKAmHN0cnVjdCBwdF9yZWdz?=
        =?UTF-8?B?4oCZIGhhcyBubyBtZW1iZXIgbmFtZWQg4oCYaXA=?=
Date: Tue, 9 Oct 2018 07:17:14 -0500
Message-ID: <CAErSpo5RGSdX_g36KSBE1er_bmKpHih=X7DoTtTwos5PW4qn7w@mail.gmail.com>
References: <1539069292.17569.7.camel@abdul.in.ibm.com> <87woqr1mfr.fsf@concordia.ellerman.id.au>
 <1539081603.17569.10.camel@abdul.in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1539081603.17569.10.camel@abdul.in.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: abdhalee@linux.vnet.ibm.com
Cc: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, sachinp@linux.vnet.ibm.com, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Keith Busch <keith.busch@intel.com>, linux-next list <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Oct 9, 2018 at 5:40 AM Abdul Haleem <abdhalee@linux.vnet.ibm.com> w=
rote:
>
> On Tue, 2018-10-09 at 20:47 +1100, Michael Ellerman wrote:
> > Abdul Haleem <abdhalee@linux.vnet.ibm.com> writes:
> > > Greeting's
> > >
> > > Today's linux-next fails to build on ppc with below error
> > >
> > > drivers/pci/pcie/aer_inject.c: In function =E2=80=98aer_inject_ftrace=
_thunk=E2=80=99:
> > > drivers/pci/pcie/aer_inject.c:444:6: error: =E2=80=98struct pt_regs=
=E2=80=99 has no
> > > member named =E2=80=98ip=E2=80=99
> > >   regs->ip =3D (unsigned long) hook->function;
> > >       ^
> > > make[3]: *** [drivers/pci/pcie/aer_inject.o] Error 1
> > > make[2]: *** [drivers/pci/pcie] Error 2
> > > make[1]: *** [drivers/pci] Error 2
> > >
> > > Machine: Power 9
> > > kernel version: 4.19.0-rc7-next-20181008
> > > gcc version: 4.8.5 20150623
> > > config attached
> > >
> > > Recent code changes from these commits:
> > >
> > > c79ad38b36dd4967d67f83fc48bade37ee041a47 PCI/AER: Abstract AER interr=
upt handling
> > > 7b23285f930a8dedcbf749661cd0f2cc27f79be6 PCI/AER: Reuse existing pcie=
_port_find_device() interface
> > > e3fbcc7c4b130f81ea586183db561fa3ce9c6447 PCI/AER: Covertly inject err=
ors with ftrace hooks
> >
> > I don't see this commit in today's linux next (20181009) so presumably
> > someone else has noticed and dropped the commit?
>
> Yes, the commit is dropped from next-20181009, and now build is fine.

I dropped those commits yesterday.
