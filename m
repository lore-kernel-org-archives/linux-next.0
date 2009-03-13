From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: make headers_install broken for ARCH=m68k in 2.6.29-rc7.
Date: Fri, 13 Mar 2009 09:25:15 +0100
Message-ID: <10f740e80903130125u39abf6c2h2a61f6bb18e7500e@mail.gmail.com>
References: <200903120437.03837.rob@landley.net>
	 <20090312210216.GB14205@uranus.ravnborg.org>
	 <10f740e80903121540i30fdaddr600ce21f4159530a@mail.gmail.com>
	 <200903122225.04560.rob@landley.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f175.google.com ([209.85.218.175]:51473 "EHLO
	mail-bw0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752714AbZCMIZV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Mar 2009 04:25:21 -0400
In-Reply-To: <200903122225.04560.rob@landley.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Landley <rob@landley.net>
Cc: Sam Ravnborg <sam@ravnborg.org>, Greg Ungerer <gerg@snapgear.com>, linux-kernel@vger.kernel.org, dwmw2@infradead.org, linux-next@vger.kernel.org

On Fri, Mar 13, 2009 at 04:25, Rob Landley <rob@landley.net> wrote:
> Keep in mind I still haven't found an emulator for m68k that actually=
 boots a
> linux kernel, so my m68k support is purely theoretical. =C2=A0(I poke=
d at mess and
> uae a bit today, but they don't do the "qemu -kernel" thing I'm using=
 for the
> other targets, and qemu itself only seems to support coldfire and not=
 a full-
> blown m68k.) =C2=A0I'm following up on this because it's a regression=
=2E =C2=A0Under
> 2.6.28 the m68k target was building a kernel and root filesystem, but=
 I don't
> have hardware to run it and have never been able to test it, so isn't=
 really
> very useful for me. =C2=A0It's really just there so that if qemu grow=
s the rest of
> m68k support (patches have been submitted but not merged), I'll be re=
ady.

An atari_defconfig kernel (at least the one from Linus-yesterday) boots=
 fine on
aranym (http://aranym.org).

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
