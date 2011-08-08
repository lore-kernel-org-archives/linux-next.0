From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: Tree for September 27 (staging: ath6kl, spectra, & vt6655)
Date: Mon, 8 Aug 2011 14:01:03 +0200
Message-ID: <CAMuHMdUMhwiXwc4X9umrEwtFsKacmPPvzxZ3UoOY8_iLQ57hqQ@mail.gmail.com>
References: <20100927162143.3a9c1efe.sfr@canb.auug.org.au>
	<20100927113829.2928636a.rdunlap@xenotime.net>
	<35B17FE5076C7040809188FBE7913F983F23AFDDA6@SC1EXMB-MBCL.global.atheros.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iy0-f170.google.com ([209.85.210.170]:54975 "EHLO
	mail-iy0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752069Ab1HHMBE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 8 Aug 2011 08:01:04 -0400
In-Reply-To: <35B17FE5076C7040809188FBE7913F983F23AFDDA6@SC1EXMB-MBCL.global.atheros.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vipin Mehta <Vipin.Mehta@atheros.com>
Cc: Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, driverdevel <devel@driverdev.osuosl.org>, "gregkh@suse.de" <gregkh@suse.de>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "forest@alittletooquiet.net" <forest@alittletooquiet.net>, "yunpeng.gao@intel.com" <yunpeng.gao@intel.com>

On Mon, Sep 27, 2010 at 21:28, Vipin Mehta <Vipin.Mehta@atheros.com> wr=
ote:
>> Changes since 20100924:
>
> drivers/staging/ath6kl/os/linux/ar6000_drv.c:1370:1: warning: "CONFIG=
_AR600x_BT_RESET_PIN" redefined
> ./include/generated/autoconf.h:419:1: warning: this is the location o=
f the previous definition
> drivers/staging/ath6kl/os/linux/ioctl.c:4673: warning: the frame size=
 of 2052 bytes is larger than 1024 bytes
> drivers/staging/ath6kl/hif/sdio/linux_sdio/src/hif_scatter.c:288: err=
or: 'struct mmc_host' has no member named 'max_hw_segs'
> drivers/staging/ath6kl/hif/sdio/linux_sdio/src/hif_scatter.c:289: err=
or: 'struct mmc_host' has no member named 'max_hw_segs'
>
> The problem is because the mmc stack is out of sync in Greg's staging=
 tree and Stephen's linux-next tree. Greg asked me to generate a patch =
which I did and emailed to Greg.

And the 'warning: "CONFIG_AR600x_BT_RESET_PIN" redefined' is still ther=
e...

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
