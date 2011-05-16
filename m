From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the tip tree with the arm tree
Date: Mon, 16 May 2011 13:06:52 +0200
Message-ID: <20110516110652.GC19837@elte.hu>
References: <20110513080634.GA13647@elte.hu>
 <20110513083738.GA19733@n2100.arm.linux.org.uk>
 <20110513092646.GK13647@elte.hu>
 <20110513213640.GB30539@n2100.arm.linux.org.uk>
 <20110516073144.GF24836@elte.hu>
 <20110516074230.GI30539@n2100.arm.linux.org.uk>
 <20110516091744.GB12325@elte.hu>
 <20110516091927.GK30539@n2100.arm.linux.org.uk>
 <20110516094056.GA25039@elte.hu>
 <20110516100750.GN30539@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:54982 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754869Ab1EPLHX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 May 2011 07:07:23 -0400
Content-Disposition: inline
In-Reply-To: <20110516100750.GN30539@n2100.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>, Jacob Pan <jacob.jun.pan@intel.com>, Glauber Costa <glommer@redhat.com>, Dimitri Sivanich <sivanich@sgi.com>, Rusty Russell <rusty@rustcorp.com.au>, Jeremy Fitzhardinge <jeremy@xensource.com>, Chris McDermott <lcm@us.ibm.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>


* Russell King - ARM Linux <linux@arm.linux.org.uk> wrote:

> On Mon, May 16, 2011 at 11:40:56AM +0200, Ingo Molnar wrote:
> >    maintainers (and not assume lack of ack after 24 hours means acc=
eptance), or=20
>=20
> Wrong, 72 to 96 hours.  Sunday to Wednesday/Thursday.

Not that this is really material (the argument is pretty much the same =
even had=20
you waited 3 days), but you are already wrong about the 'Sunday' part, =
because=20
you posted it to lkml on *Monday* 13:27 GMT:

        Message-ID: <20110509132738.GB16919@n2100.arm.linux.org.uk>
        Mon, 9 May 2011 09:27:52 -0400

How hard can it be for you to look up the dates of the events before yo=
u accuse=20
others of not listening?

Then you committed/amdended it on Tuesday 7:20 GMT:

 commit 3490f584b9ba5a0b6f63832fbc9c5ec72506697b
 Author:     Russell King <rmk+kernel@arm.linux.org.uk>
 AuthorDate: Sun May 8 18:55:19 2011 +0100
 Commit:     Russell King <rmk+kernel@arm.linux.org.uk>
 CommitDate: Tue May 10 08:20:54 2011 +0100

which is a mere 18 hours after it was mailed to lkml - and then you pus=
hed it=20
out to linux-next some time after that, probably on the next day, Wedne=
sday,=20
right?

It does not matter one little bit that you'd have been 'ready to rebase=
' once=20
more had some objection come in that short 2 days time window from Mond=
ay to=20
Wednesday, or any of the dates after that.

What i'm saying for the fourth time is that what you did here is not a =
proper=20
Git workflow: we only push bits out into permanent branches (and expose=
 them to=20
conflicts, etc.) once they are final, and we only do that after making =
sure=20
that maintainers who maintain the trees of the affected files are fine =
with it=20
and make sure that there are no conflicts.

Or, failing all that, if you are such a superhero kernel hacker who nev=
er makes=20
any mistakes and never apologizes and can freely ignore well-establishe=
d Git=20
workflow best practices you should *at least* make sure you do not mess=
 up and=20
make sure the file you modify still builds on the architecture you are=20
modifying:

  $ git checkout 3490f584b9ba # clocksource: convert x86 to generic i82=
53 clocksource
  $ make defconfig
  $ make -j2 bzImage

  arch/x86/kernel/i8253.c: In function =E2=80=98init_pit_clocksource=E2=
=80=99:
  arch/x86/kernel/i8253.c:133: error: implicit declaration of function =
=E2=80=98clocksource_pit_init=E2=80=99
  make[2]: *** [arch/x86/kernel/i8253.o] Error 1
  make[1]: *** [arch/x86/kernel] Error 2
  make: *** [arch/x86] Error 2
  make: *** Waiting for unfinished jobs....

Or is that too much to ask for?

Thanks,

	Ingo
