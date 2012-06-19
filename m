From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] Makefile: fix up CROSS_COMPILE and READABLE_ASM interaction.
Date: Tue, 19 Jun 2012 11:17:59 +0200
Message-ID: <CAMuHMdU5juQMyzoTV62-hwzKW980fkQNDBKGP8i5WfDcsf95jQ@mail.gmail.com>
References: <20120618045500.GC19803@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gh0-f174.google.com ([209.85.160.174]:35846 "EHLO
	mail-gh0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751002Ab2FSJSA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 19 Jun 2012 05:18:00 -0400
In-Reply-To: <20120618045500.GC19803@linux-sh.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mundt <lethal@linux-sh.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, Linux-Next <linux-next@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>

On Mon, Jun 18, 2012 at 6:55 AM, Paul Mundt <lethal@linux-sh.org> wrote=
:
> (Apologies for the re-send, forgot to Cc linux-kernel)
>
> When the READABLE_ASM cc-option tests were added they were done so pr=
ior
> to the arch Makefile include, resulting in cc-option being run on the
> host cc instead of the factoring in the cross prefix set up by the
> architecture.
>
> This bumps the include back up so that cc-option actually runs on the
> compiler that we're building with.

I find it a real pity these reported, hard to investigate, and fixed
build issues keep
flowing into mainline, without the corresponding fix...

https://lkml.org/lkml/2012/5/12/36

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
