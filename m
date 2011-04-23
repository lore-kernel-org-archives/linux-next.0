From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for April 14 (Call-traces: RCU/ACPI/WQ related?)
Date: Sat, 23 Apr 2011 23:16:29 +0200
Message-ID: <BANLkTimXW2=PYOXkKjnLuH+eN2TjZBqAxw@mail.gmail.com>
References: <20110421050823.GA4487@linux.vnet.ibm.com>
	<BANLkTinFmG5GVq6D8+wq_89OPF8snsQ=Jw@mail.gmail.com>
	<BANLkTi=c=+JnU9dQsVhgjZbOtArhHQz+EQ@mail.gmail.com>
	<BANLkTimEWqBVdq8MWbjAAfXCLPQdiHkuNg@mail.gmail.com>
	<20110421142853.GA2235@linux.vnet.ibm.com>
	<BANLkTineNYTXffcNT59STsk5nkLhi=o-kA@mail.gmail.com>
	<20110422005046.GQ2235@linux.vnet.ibm.com>
	<BANLkTi=W=s876U===LVfp59Nnfui8d-1RQ@mail.gmail.com>
	<20110422150222.GA2300@linux.vnet.ibm.com>
	<BANLkTind84Gf8JA9Fa4QL2GbaF8nMNhDzw@mail.gmail.com>
	<20110423210539.GI2628@linux.vnet.ibm.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110423210539.GI2628@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: paulmck@linux.vnet.ibm.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Sat, Apr 23, 2011 at 11:05 PM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> On Fri, Apr 22, 2011 at 07:36:58PM +0200, Sedat Dilek wrote:
>> On Fri, Apr 22, 2011 at 5:02 PM, Paul E. McKenney
>> <paulmck@linux.vnet.ibm.com> wrote:
>> > On Fri, Apr 22, 2011 at 11:40:54AM +0200, Sedat Dilek wrote:
>> >> On Fri, Apr 22, 2011 at 2:50 AM, Paul E. McKenney
>> >> <paulmck@linux.vnet.ibm.com> wrote:
>> >> > On Thu, Apr 21, 2011 at 04:47:31PM +0200, Sedat Dilek wrote:
>> >> >> On Thu, Apr 21, 2011 at 4:28 PM, Paul E. McKenney
>> >> >> <paulmck@linux.vnet.ibm.com> wrote:
>> >> >> > On Thu, Apr 21, 2011 at 02:49:37PM +0200, Sedat Dilek wrote:
>> >> >> >> On Thu, Apr 21, 2011 at 12:24 PM, Sedat Dilek
>> >> >> >> <sedat.dilek@googlemail.com> wrote:
>> >> >
>> >> > [ . . . ]
>> >> >
>> >> >> >> Here the results from the 2nd-run (PREEMPT_RCU enabled).
>> >> >> >
>> >> >> > OK, and the grace periods clearly stopped advancing early on=
=2E
>> >> >> >
>> >> >> > Beyond that point, the per-CPU kthread is blocked, but RCU h=
as some
>> >> >> > work for it to do. =C2=A0So someone has called invoke_rcu_cp=
u_kthread(),
>> >> >> > but rcu_cpu_kthread() is still blocked. =C2=A0I don't see a =
bug right
>> >> >> > off-hand, but it is early in the morning for me, so I might =
easily
>> >> >> > be missing something.
>> >> >> >
>> >> >> > Hmmm...
>> >> >> >
>> >> >> > The synchronization between these two assumes that the per-C=
PU
>> >> >> > kthread is always bound to the respective CPU, so if was som=
ehow
>> >> >> > being migrated off, that might explain these results.
>> >> >> >
>> >> >> > I will add some more diagnostics, test them locally, then pu=
sh
>> >> >> > out an update. =C2=A0Seem reasonable?
>> >> >> >
>> >> >> > And thank you again for the testing!!!
>> >> >>
>> >> >> Ping me when you have new stuff for testing.
>> >> >> Tomorrow (friday), here is public holiday and monday, too.
>> >> >> So a looong weekend.
>> >> >
>> >> > ;-)
>> >> >
>> >> > OK, I have a new sedat.2011.04.21a branch in the -rcu git tree:
>> >> >
>> >> > git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-2.6=
-rcu.git
>> >> >
>> >> > This is against 2.6.39-rc3, as before. =C2=A0(Yes, I do need to=
 rebase to
>> >> > 2.6.39-rc4, but didn't want to change any more than I had to.)
>> >> >
>> >> > I also have an updated script, which is attached. =C2=A0The out=
put is similar
>> >> > to the earlier one, and it operated is pretty much the same way=
=2E
>> >> >
>> >> > Have a great weekend, and I look forward to seeing what shows u=
p on
>> >> > this round. =C2=A0I confess to still being quite puzzled!
>> >> >
>> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thanx, Paul
>> >> >
>> >>
>> >> Here are the results of the Sedat's vote (European song contest :=
-)).
>> >
>> > ;-)
>> >
>> > Very strange. =C2=A0RCU has told the per-CPU kthread that it needs=
 to get
>> > to work, but this kthread is still waiting from RCU's viewpoint.
>> > Yet the "ps" command believes that this kthread is in fact runnabl=
e
>> > at SCHED_FIFO priority 1.
>> >
>> > I can tell that this one will require some thought... =C2=A0And mo=
re
>> > diagnostics...
>> >
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thanx, Paul
>> >
>>
>> "We are with you in spirit."
>>
>> ( Level XX from Hybris shooter-game on Amiga (1989) )
>
> OK, I added a few more diagnostics: sedat.2011.04.23a in -rcu:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-2.6-rcu.g=
it
>
> When you get a chance, could you please give it a try?
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thanx, Paul
>

As soon as I can clone/pull from new GIT repo/branch.
Currently, I don't see it only, but kernel-mirrors are sometimes slow.

I will report later.

- Sedat -
