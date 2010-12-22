From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 3/3 V13] RO/NX protection for loadable kernel
Date: Wed, 22 Dec 2010 13:40:19 +0100
Message-ID: <20101222124019.GG10809@elte.hu>
References: <4CE2F914.9070106@free.fr>
 <24422.1290656467@localhost>
 <20101126182355.62615dff@mat-laptop>
 <20101208221951.GO5750@outflux.net>
 <20101211001857.4c5e0794@mat-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:55591 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751417Ab0LVMko (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Dec 2010 07:40:44 -0500
Content-Disposition: inline
In-Reply-To: <20101211001857.4c5e0794@mat-laptop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: mat <castet.matthieu@free.fr>
Cc: Kees Cook <kees.cook@canonical.com>, Valdis.Kletnieks@vt.edu, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, Arjan van de Ven <arjan@infradead.org>, James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Rusty Russell <rusty@rustcorp.com.au>, Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>, Siarhei Liakh <sliakh.lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>


* mat <castet.matthieu@free.fr> wrote:

> Le Wed, 8 Dec 2010 14:19:51 -0800,
> Kees Cook <kees.cook@canonical.com> a =E9crit :
>=20
> > On Fri, Nov 26, 2010 at 06:23:55PM +0100, mat wrote:
> > > could you try the attached patch ?
> > >=20
> > > on module load, we sort the __jump_table section. So we should ma=
ke
> > > it writable.
> > >=20
> > >=20
> > > Matthieu
> >=20
> > > diff --git a/arch/x86/include/asm/jump_label.h
> > > b/arch/x86/include/asm/jump_label.h index f52d42e..574dbc2 100644
> > > --- a/arch/x86/include/asm/jump_label.h
> > > +++ b/arch/x86/include/asm/jump_label.h
> > > @@ -14,7 +14,7 @@
> > >  	do
> > > {							\ asm
> > > goto("1:"					\
> > > JUMP_LABEL_INITIAL_NOP			\
> > > -			".pushsection __jump_table,  \"a\" \n\t"\
> > > +			".pushsection __jump_table,  \"aw\" \n\t"\
> > >  			_ASM_PTR "1b, %l[" #label "], %c0 \n\t" \
> > >  			".popsection \n\t"			\
> > >  			: :  "i" (key) :  : label);
> > > \
> >=20
> > Acked-by: Kees Cook <kees.cook@canonical.com>
> >=20
> > Can this please get committed to tip?
> I think it is not need anymore with  Steven Rostedt patch [1]
>=20
> Matthieu
>=20
> [1]
> > > Here we set the text read only before we call the notifiers. The
> > > function tracer changes the calls to mcount into nops via a notif=
ier
> > > call so this must be done after the module notifiers.

What's the status of this bug?

If we still need the patch then please submit it standalone with a prop=
er subject=20
line, with acks/signoffs added, etc.

Thanks,

	Ingo
