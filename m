From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: wlcore.ko undefined symbols
Date: Mon, 28 May 2012 19:54:56 +0200
Message-ID: <CAMuHMdVv+g=+A1HHNmWWcsFBQjRXNNA437V6-g80cYq7zRJ78g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gh0-f174.google.com ([209.85.160.174]:57416 "EHLO
	mail-gh0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752692Ab2E1Ry6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 28 May 2012 13:54:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eyal Shapira <eyal@wizery.com>, Luciano Coelho <coelho@ti.com>, "John W. Linville" <linville@tuxdriver.com>
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, Linux-Next <linux-next@vger.kernel.org>

m68k allmodconfig:

ERROR: "wl1271_rx_filter_get_fields_size"
[drivers/net/wireless/ti/wlcore/wlcore.ko] undefined!
ERROR: "wl1271_rx_filter_flatten_fields"
[drivers/net/wireless/ti/wlcore/wlcore.ko] undefined!

drivers/net/wireless/ti/wlcore/acx.c needs both functions unconditional=
ly, but
drivers/net/wireless/ti/wlcore/main.c has both functions inside #ifdef
CONFIG_PM.

This is in -next, but I believe all relevant code was merged in
mainline in the mean time.
Sorry for not noticing earlier, due to a longstanding unrelated build
issue in -next.

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
