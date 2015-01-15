From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: manual merge of the renesas tree with the arm-soc tree
Date: Thu, 15 Jan 2015 09:44:24 +0100
Message-ID: <CAMuHMdVjtVfTQyqMZYeXiPCMoeyxxUv-ikxRvM3uw9FCGTQ+BA@mail.gmail.com>
References: <20150115113840.71ab0a39@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:62813 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751437AbbAOIo0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 Jan 2015 03:44:26 -0500
In-Reply-To: <20150115113840.71ab0a39@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Simon Horman <horms@verge.net.au>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Magnus Damm <damm+renesas@opensource.se>, Geert Uytterhoeven <geert+renesas@glider.be>, Peter Robinson <pbrobinson@gmail.com>

On Thu, Jan 15, 2015 at 1:38 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Today's linux-next merge of the renesas tree got a conflict in
> arch/arm/boot/dts/Makefile between commit cb612390e546 ("ARM: dts: Only
> build dtb if associated Arch and/or SoC is enabled") from the arm-soc
> tree and commits 9ccba8abd0a7 ("ARM: shmobile: kzm9g: Build DTS for
> Multiplatform") and 93c9f0228a3d ("ARM: shmobile: kzm9g-reference:
> Remove board C code and DT file") from the renesas tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Your resolution is correct.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
