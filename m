From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 3/3 V13] RO/NX protection for loadable kernel
Date: Wed, 22 Dec 2010 22:57:25 +0100
Message-ID: <20101222215725.GB5585@elte.hu>
References: <4CE2F914.9070106@free.fr>
 <24422.1290656467@localhost>
 <20101126182355.62615dff@mat-laptop>
 <20101208221951.GO5750@outflux.net>
 <20101211001857.4c5e0794@mat-laptop>
 <20101222124019.GG10809@elte.hu>
 <34428.1293053719@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-security-module-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <34428.1293053719@localhost>
Sender: linux-security-module-owner@vger.kernel.org
To: Valdis.Kletnieks@vt.edu
Cc: mat <castet.matthieu@free.fr>, Kees Cook <kees.cook@canonical.com>, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, Arjan van de Ven <arjan@infradead.org>, James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Rusty Russell <rusty@rustcorp.com.au>, Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>, Siarhei Liakh <sliakh.lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>
List-Id: linux-next.vger.kernel.org


* Valdis.Kletnieks@vt.edu <Valdis.Kletnieks@vt.edu> wrote:

> On Wed, 22 Dec 2010 13:40:19 +0100, Ingo Molnar said:
> >=20
> > * mat <castet.matthieu@free.fr> wrote:
> >=20
> > > Le Wed, 8 Dec 2010 14:19:51 -0800,
> > > Kees Cook <kees.cook@canonical.com> a =E9crit :
> > >=20
> > > > On Fri, Nov 26, 2010 at 06:23:55PM +0100, mat wrote:
> > > > > could you try the attached patch ?
> > > > >=20
> > > > > on module load, we sort the __jump_table section. So we shoul=
d make
> > > > > it writable.
> > > > >=20
> > > > >=20
> > > > > Matthieu
> > > >=20
> > > > > diff --git a/arch/x86/include/asm/jump_label.h
> > > > > b/arch/x86/include/asm/jump_label.h index f52d42e..574dbc2 10=
0644
> > > > > --- a/arch/x86/include/asm/jump_label.h
> > > > > +++ b/arch/x86/include/asm/jump_label.h
> > > > > @@ -14,7 +14,7 @@
> > > > >  	do
> > > > > {							\ asm
> > > > > goto("1:"					\
> > > > > JUMP_LABEL_INITIAL_NOP			\
> > > > > -			".pushsection __jump_table,  \"a\" \n\t"\
> > > > > +			".pushsection __jump_table,  \"aw\" \n\t"\
> > > > >  			_ASM_PTR "1b, %l[" #label "], %c0 \n\t" \
> > > > >  			".popsection \n\t"			\
> > > > >  			: :  "i" (key) :  : label);
> > > > > \
> > > >=20
> > > > Acked-by: Kees Cook <kees.cook@canonical.com>
> > > >=20
> > > > Can this please get committed to tip?
> > > I think it is not need anymore with  Steven Rostedt patch [1]
> > >=20
> > > Matthieu
> > >=20
> > > [1]
> > > > > Here we set the text read only before we call the notifiers. =
The
> > > > > function tracer changes the calls to mcount into nops via a n=
otifier
> > > > > call so this must be done after the module notifiers.
> >=20
> > What's the status of this bug?
> >=20
> > If we still need the patch then please submit it standalone with a =
proper subject=20
> > line, with acks/signoffs added, etc.
>=20
> Steve Rostedt's patch that moves the setting of the page permissions =
seems to make=20
> this patch no longer necessary.  I tripped over this same issue, but =
the version=20
> in the latest -mmotm does not need it, as it includes Steve's fix.

It would be nice to see that fix submitted so that it gets into the tre=
e that=20
introduced the bug.

Steve, Andrew?

Thanks,

	Ingo
--
To unsubscribe from this list: send the line "unsubscribe linux-securit=
y-module" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
