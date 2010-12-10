From: mat <castet.matthieu@free.fr>
Subject: Re: [PATCH 3/3 V13] RO/NX protection for loadable kernel
Date: Sat, 11 Dec 2010 00:18:57 +0100
Message-ID: <20101211001857.4c5e0794@mat-laptop>
References: <4CE2F914.9070106@free.fr>
	<24422.1290656467@localhost>
	<20101126182355.62615dff@mat-laptop>
	<20101208221951.GO5750@outflux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20101208221951.GO5750@outflux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <kees.cook@canonical.com>
Cc: Valdis.Kletnieks@vt.edu, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, Arjan van de Ven <arjan@infradead.org>, James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@elte.hu>, Rusty Russell <rusty@rustcorp.com.au>, Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>, Siarhei Liakh <sliakh.lkml@gmail.com>
List-Id: linux-next.vger.kernel.org

Le Wed, 8 Dec 2010 14:19:51 -0800,
Kees Cook <kees.cook@canonical.com> a =E9crit :

> On Fri, Nov 26, 2010 at 06:23:55PM +0100, mat wrote:
> > could you try the attached patch ?
> >=20
> > on module load, we sort the __jump_table section. So we should make
> > it writable.
> >=20
> >=20
> > Matthieu
>=20
> > diff --git a/arch/x86/include/asm/jump_label.h
> > b/arch/x86/include/asm/jump_label.h index f52d42e..574dbc2 100644
> > --- a/arch/x86/include/asm/jump_label.h
> > +++ b/arch/x86/include/asm/jump_label.h
> > @@ -14,7 +14,7 @@
> >  	do
> > {							\ asm
> > goto("1:"					\
> > JUMP_LABEL_INITIAL_NOP			\
> > -			".pushsection __jump_table,  \"a\" \n\t"\
> > +			".pushsection __jump_table,  \"aw\" \n\t"\
> >  			_ASM_PTR "1b, %l[" #label "], %c0 \n\t" \
> >  			".popsection \n\t"			\
> >  			: :  "i" (key) :  : label);
> > \
>=20
> Acked-by: Kees Cook <kees.cook@canonical.com>
>=20
> Can this please get committed to tip?
I think it is not need anymore with  Steven Rostedt patch [1]

Matthieu

[1]
> > Here we set the text read only before we call the notifiers. The
> > function tracer changes the calls to mcount into nops via a notifie=
r
> > call so this must be done after the module notifiers.
