From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: triage for April 17, 2012
Date: Wed, 18 Apr 2012 09:48:46 +0200
Message-ID: <CAMuHMdU2LR2xKNsdq6mPENSZsWU0MxExwbL9NK2x=6eTMr+k+w@mail.gmail.com>
References: <20120418030524.GD21302@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:43188 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751202Ab2DRHsq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 18 Apr 2012 03:48:46 -0400
In-Reply-To: <20120418030524.GD21302@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Apr 18, 2012 at 05:05, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> m68k:allmodconfig
> =C2=A0 =C2=A0 =C2=A0 =C2=A0when: =C2=A0 Mar 16
> =C2=A0 =C2=A0 =C2=A0 =C2=A0why: =C2=A0 =C2=A0persistent_ram.c: implic=
it declaration of 'memblock_reserve'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0status:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fix:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ref: =C2=A0 =C2=A0http://kisskb.ellerman.i=
d.au/kisskb/buildresult/5884324/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ref: =C2=A0 =C2=A0http://www.spinics.net/l=
ists/linux-next/msg19343.html

This has been fixed since a while.

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
