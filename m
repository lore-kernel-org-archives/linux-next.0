From: Xiaotian Feng <xtfeng@gmail.com>
Subject: Re: [PATCH 3/3 V13] RO/NX protection for loadable kernel
Date: Fri, 7 Jan 2011 17:34:01 +0800
Message-ID: <AANLkTin55DXcQnK3NY7y-v8TXj5w-XT2rTJo9p90tj4g@mail.gmail.com>
References: <4CE2F914.9070106@free.fr>
	<24422.1290656467@localhost>
	<20101126182355.62615dff@mat-laptop>
	<20101208221951.GO5750@outflux.net>
	<20101211001857.4c5e0794@mat-laptop>
	<20101222124019.GG10809@elte.hu>
	<34428.1293053719@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <34428.1293053719@localhost>
Sender: linux-security-module-owner@vger.kernel.org
To: Valdis.Kletnieks@vt.edu
Cc: Ingo Molnar <mingo@elte.hu>, mat <castet.matthieu@free.fr>, Kees Cook <kees.cook@canonical.com>, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, Arjan van de Ven <arjan@infradead.org>, James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Rusty Russell <rusty@rustcorp.com.au>, Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>, Siarhei Liakh <sliakh.lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>
List-Id: linux-next.vger.kernel.org

On Thu, Dec 23, 2010 at 5:35 AM,  <Valdis.Kletnieks@vt.edu> wrote:
> On Wed, 22 Dec 2010 13:40:19 +0100, Ingo Molnar said:
>>
>> * mat <castet.matthieu@free.fr> wrote:
>>
>> > Le Wed, 8 Dec 2010 14:19:51 -0800,
>> > Kees Cook <kees.cook@canonical.com> a =C3=A9crit :
>> >
>> > > On Fri, Nov 26, 2010 at 06:23:55PM +0100, mat wrote:
>> > > > could you try the attached patch ?
>> > > >
>> > > > on module load, we sort the __jump_table section. So we should=
 make
>> > > > it writable.
>> > > >
>> > > >
>> > > > Matthieu
>> > >
>> > > > diff --git a/arch/x86/include/asm/jump_label.h
>> > > > b/arch/x86/include/asm/jump_label.h index f52d42e..574dbc2 100=
644
>> > > > --- a/arch/x86/include/asm/jump_label.h
>> > > > +++ b/arch/x86/include/asm/jump_label.h
>> > > > @@ -14,7 +14,7 @@
>> > > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 do
>> > > > { =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \ asm
>> > > > goto("1:" =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 \
>> > > > JUMP_LABEL_INITIAL_NOP =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0\
>> > > > - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ".pushsection __jump_table, =C2=A0\"a\" \n\t"\
>> > > > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ".pushsection __jump_table, =C2=A0\"aw\" \n\t"\
>> > > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 _ASM_PTR "1b, %l[" #label "], %c0 \n\t" \
>> > > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ".popsection \n\t" =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> > > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 : : =C2=A0"i" (key) : =C2=A0: label);
>> > > > \
>> > >
>> > > Acked-by: Kees Cook <kees.cook@canonical.com>
>> > >
>> > > Can this please get committed to tip?
>> > I think it is not need anymore with =C2=A0Steven Rostedt patch [1]
>> >
>> > Matthieu
>> >
>> > [1]
>> > > > Here we set the text read only before we call the notifiers. T=
he
>> > > > function tracer changes the calls to mcount into nops via a no=
tifier
>> > > > call so this must be done after the module notifiers.
>>
>> What's the status of this bug?
>>
>> If we still need the patch then please submit it standalone with a p=
roper subject
>> line, with acks/signoffs added, etc.
>
> Steve Rostedt's patch that moves the setting of the page permissions =
seems to
> make this patch no longer necessary. =C2=A0I tripped over this same i=
ssue, but the
> version in the latest -mmotm does not need it, as it includes Steve's=
 fix.
>

I'm facing a boot failure (panic'ed on remove_jump_label_module_init)
on 2.6.37 (latest commit 3c0cb7c), which is 100% reproducible.
With this patch applied, I can boot my machine successfully, so I do
think this patch is needed.

Thanks
Xiaotian
--
To unsubscribe from this list: send the line "unsubscribe linux-securit=
y-module" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
