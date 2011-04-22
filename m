From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for April 14 (Call-traces: RCU/ACPI/WQ related?)
Date: Fri, 22 Apr 2011 19:36:58 +0200
Message-ID: <BANLkTind84Gf8JA9Fa4QL2GbaF8nMNhDzw@mail.gmail.com>
References: <BANLkTikVW9Z=WxD7=w9c=Z6kHO-Za2ru8A@mail.gmail.com>
	<20110414224411.GF2141@linux.vnet.ibm.com>
	<20110421050823.GA4487@linux.vnet.ibm.com>
	<BANLkTinFmG5GVq6D8+wq_89OPF8snsQ=Jw@mail.gmail.com>
	<BANLkTi=c=+JnU9dQsVhgjZbOtArhHQz+EQ@mail.gmail.com>
	<BANLkTimEWqBVdq8MWbjAAfXCLPQdiHkuNg@mail.gmail.com>
	<20110421142853.GA2235@linux.vnet.ibm.com>
	<BANLkTineNYTXffcNT59STsk5nkLhi=o-kA@mail.gmail.com>
	<20110422005046.GQ2235@linux.vnet.ibm.com>
	<BANLkTi=W=s876U===LVfp59Nnfui8d-1RQ@mail.gmail.com>
	<20110422150222.GA2300@linux.vnet.ibm.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:52282 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756210Ab1DVRg7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 22 Apr 2011 13:36:59 -0400
In-Reply-To: <20110422150222.GA2300@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Apr 22, 2011 at 5:02 PM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> On Fri, Apr 22, 2011 at 11:40:54AM +0200, Sedat Dilek wrote:
>> On Fri, Apr 22, 2011 at 2:50 AM, Paul E. McKenney
>> <paulmck@linux.vnet.ibm.com> wrote:
>> > On Thu, Apr 21, 2011 at 04:47:31PM +0200, Sedat Dilek wrote:
>> >> On Thu, Apr 21, 2011 at 4:28 PM, Paul E. McKenney
>> >> <paulmck@linux.vnet.ibm.com> wrote:
>> >> > On Thu, Apr 21, 2011 at 02:49:37PM +0200, Sedat Dilek wrote:
>> >> >> On Thu, Apr 21, 2011 at 12:24 PM, Sedat Dilek
>> >> >> <sedat.dilek@googlemail.com> wrote:
>> >
>> > [ . . . ]
>> >
>> >> >> Here the results from the 2nd-run (PREEMPT_RCU enabled).
>> >> >
>> >> > OK, and the grace periods clearly stopped advancing early on.
>> >> >
>> >> > Beyond that point, the per-CPU kthread is blocked, but RCU has =
some
>> >> > work for it to do. =C2=A0So someone has called invoke_rcu_cpu_k=
thread(),
>> >> > but rcu_cpu_kthread() is still blocked. =C2=A0I don't see a bug=
 right
>> >> > off-hand, but it is early in the morning for me, so I might eas=
ily
>> >> > be missing something.
>> >> >
>> >> > Hmmm...
>> >> >
>> >> > The synchronization between these two assumes that the per-CPU
>> >> > kthread is always bound to the respective CPU, so if was someho=
w
>> >> > being migrated off, that might explain these results.
>> >> >
>> >> > I will add some more diagnostics, test them locally, then push
>> >> > out an update. =C2=A0Seem reasonable?
>> >> >
>> >> > And thank you again for the testing!!!
>> >>
>> >> Ping me when you have new stuff for testing.
>> >> Tomorrow (friday), here is public holiday and monday, too.
>> >> So a looong weekend.
>> >
>> > ;-)
>> >
>> > OK, I have a new sedat.2011.04.21a branch in the -rcu git tree:
>> >
>> > git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-2.6-rc=
u.git
>> >
>> > This is against 2.6.39-rc3, as before. =C2=A0(Yes, I do need to re=
base to
>> > 2.6.39-rc4, but didn't want to change any more than I had to.)
>> >
>> > I also have an updated script, which is attached. =C2=A0The output=
 is similar
>> > to the earlier one, and it operated is pretty much the same way.
>> >
>> > Have a great weekend, and I look forward to seeing what shows up o=
n
>> > this round. =C2=A0I confess to still being quite puzzled!
>> >
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thanx, Paul
>> >
>>
>> Here are the results of the Sedat's vote (European song contest :-))=
=2E
>
> ;-)
>
> Very strange. =C2=A0RCU has told the per-CPU kthread that it needs to=
 get
> to work, but this kthread is still waiting from RCU's viewpoint.
> Yet the "ps" command believes that this kthread is in fact runnable
> at SCHED_FIFO priority 1.
>
> I can tell that this one will require some thought... =C2=A0And more
> diagnostics...
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thanx, Paul
>

"We are with you in spirit."

( Level XX from Hybris shooter-game on Amiga (1989) )

- Sedat -
