From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: Tree for December 19
Date: Sat, 19 Dec 2009 09:42:19 +0100
Message-ID: <10f740e80912190042o474b6188ga32fcc4ff0846531@mail.gmail.com>
References: <20091219110457.d6c5de1f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.25]:50690 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752764AbZLSImV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 19 Dec 2009 03:42:21 -0500
In-Reply-To: <20091219110457.d6c5de1f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sat, Dec 19, 2009 at 01:04, Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
> I said:
>> News: =C2=A0there will be no linux-next releases until at least Dec =
24 and,
>> more likely, Dec 29. =C2=A0Have a Merry Christmas and take a break. =
=C2=A0:-)
>
> Well, I decided I had time for one more so it will be based in -rc1).

Hurray!

But http://kisskb.ellerman.id.au/kisskb/buildresult/1852835/ shows
linux-next/m68k-allmodconfig fails
in security/keys/keyctl.c, while this got fixed in 2.6.33-rc1?? It
compiled fine in linus/m68k-allmodconfig,
as expected

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
