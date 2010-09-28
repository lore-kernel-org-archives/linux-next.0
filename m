From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: + arch-m68k-include-asm-irqflagsh-fix-build.patch added to -mm tree
Date: Tue, 28 Sep 2010 17:27:48 +0200
Message-ID: <AANLkTikjQsJMHhaYTSg5hq+4Po-WL3WXjqdy6OSiW1Jf@mail.gmail.com>
References: <201009222232.o8MMWHgu020762@imap1.linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:57259 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751724Ab0I1P2B convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 28 Sep 2010 11:28:01 -0400
In-Reply-To: <201009222232.o8MMWHgu020762@imap1.linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: akpm@linux-foundation.org, David Howells <dhowells@redhat.com>
Cc: mm-commits@vger.kernel.org, Linux-Next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>

On Thu, Sep 23, 2010 at 00:01,  <akpm@linux-foundation.org> wrote:
>
> The patch titled
> =C2=A0 =C2=A0 arch/m68k/include/asm/irqflags.h: fix build
> has been added to the -mm tree. =C2=A0Its filename is
> =C2=A0 =C2=A0 arch-m68k-include-asm-irqflagsh-fix-build.patch
>
> Before you just go and hit "reply", please:
> =C2=A0 a) Consider who else should be cc'ed
> =C2=A0 b) Prefer to cc a suitable mailing list as well
> =C2=A0 c) Ideally: find the original patch on the mailing list and do=
 a
> =C2=A0 =C2=A0 =C2=A0reply-to-all to that, adding suitable additional =
cc's
>
> *** Remember to use Documentation/SubmitChecklist when testing your c=
ode ***
>
> See http://userweb.kernel.org/~akpm/stuff/added-to-mm.txt to find
> out what to do about this
>
> The current -mm tree may be found at http://userweb.kernel.org/~akpm/=
mmotm/
>
> ------------------------------------------------------
> Subject: arch/m68k/include/asm/irqflags.h: fix build
> From: Andrew Morton <akpm@linux-foundation.org>
>
> arch/m68k/include/asm/irqflags.h: In function 'arch_local_irq_enable'=
:
> arch/m68k/include/asm/irqflags.h:52: error: expected ';' before '}' t=
oken
>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thank you so much, Andrew!

David, can you please add this to irqflags/master?

> ---
>
> =C2=A0arch/m68k/include/asm/irqflags.h | =C2=A0 =C2=A02 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>
> diff -puN arch/m68k/include/asm/irqflags.h~arch-m68k-include-asm-irqf=
lagsh-fix-build arch/m68k/include/asm/irqflags.h
> --- a/arch/m68k/include/asm/irqflags.h~arch-m68k-include-asm-irqflags=
h-fix-build
> +++ a/arch/m68k/include/asm/irqflags.h
> @@ -47,7 +47,7 @@ static inline void arch_local_irq_enable
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0"andiw %0,%%sr"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0: "i" (ALLOWINT)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 : "memory")
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 : "memory");
> =C2=A0#endif
> =C2=A0}

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
