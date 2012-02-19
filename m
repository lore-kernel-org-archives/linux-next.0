From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] mm: add config NUMA stub to all architectures
Date: Sun, 19 Feb 2012 18:01:33 +0100
Message-ID: <CAMuHMdUYCGoZoUHWMtMCwAJ2ofweaeLF3U89P5EvrNGcn=6apw@mail.gmail.com>
References: <4F3E42E0.4030108@openvz.org>
	<20120217120815.25909.15632.stgit@zurg>
	<20120217123037.ecfc5dd9.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120217123037.ecfc5dd9.akpm@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Konstantin Khlebnikov <khlebnikov@openvz.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>
List-Id: linux-next.vger.kernel.org

On Fri, Feb 17, 2012 at 21:30, Andrew Morton <akpm@linux-foundation.org=
> wrote:
> On Fri, 17 Feb 2012 16:08:15 +0400
> Konstantin Khlebnikov <khlebnikov@openvz.org> wrote:
>
>> Config NUMA must be defined for all architectures,
>> otherwise IS_ENABLED(CONFIG_NUMA) does not work.
>> Some arch-specific Kconfig already has this stub.
>> This patch adds it to all remaining.
>
> It would be better to teach IS_ENABLED() to handle this situation. =C2=
=A0I
> don't think there's a way of doing this with cpp :(
>
> This limitation makes IS_ENABLED pretty dangerous, doesn't it? =C2=A0=
It
> makes it very easy to introduce build breakage with unexpected Kconfi=
g
> combinations.

Indeed. Recently I discovered IS_ENABLED() and started recommending it
to people for new code. But now I've seen the CONFIG_NUMA breakage,
I no longer think this is a good recommendation.

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
