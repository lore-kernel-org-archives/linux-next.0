From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Build regressions/improvements in v3.0-rc3
Date: Wed, 15 Jun 2011 11:19:48 +0200
Message-ID: <BANLkTikBDVR=S5J-=Kjq1QW3OU64WzHYRg@mail.gmail.com>
References: <alpine.DEB.2.00.1106151111200.18110@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:56626 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754215Ab1FOJTt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 15 Jun 2011 05:19:49 -0400
In-Reply-To: <alpine.DEB.2.00.1106151111200.18110@ayla.of.borg>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Michael Ellerman <michael@ellerman.id.au>
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>, Linux-Next <linux-next@vger.kernel.org>

On Wed, Jun 15, 2011 at 11:11, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> Below is the list of build error/warning regressions/improvements in
> v3.0-rc3[1] compared to v2.6.39[2].
>
> Summarized:
> =C2=A0- build errors: +21/-66
> =C2=A0- build warnings: +202/-421
>
> JFYI, when comparing v3.0-rc3 to v3.0-rc2[3], the summaries are:
> =C2=A0- build errors: +20/-45
> =C2=A0- build warnings: +92/-101

While looking what kind of fix got applied for one of the
improvements, I noticed it
didn't get fixed at all. But m68k/allmodconfig is broken due to an
unrelated change, after
which the build stops, so it never got to compile the file I was lookin=
g into.

Would it be possible to build with `make -k', so it continues in case
of an error, and
tries to build as much as possible?
Yes, I know this may increase build time considerably, but in an ideal
world, there
are no compile errors and everything is built anyway ;-)

Thanks!

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
