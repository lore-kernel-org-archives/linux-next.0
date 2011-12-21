From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: sparc: __mcount_loc already exists (was: Re: Build
 regressions/improvements in v3.2-rc6)
Date: Wed, 21 Dec 2011 08:59:03 +0100
Message-ID: <CAMuHMdUvnTWvaTndObFjA_pJXNWVpDBqxviyDpYvihc7pDiV3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sparclinux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Linux-Next <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Dec 21, 2011 at 08:51, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> Note that I deleted 5238 lines about "__mcount_loc already exists", t=
o avoid
> my email being rejected.

I anyone planning to fix this? It only happens for sparc64/sparc-allmod=
config,
and appeared in v3.2-rc3.

linus: http://kisskb.ellerman.id.au/kisskb/buildresult/5167232/
linux-next: http://kisskb.ellerman.id.au/kisskb/buildresult/5166753/

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
