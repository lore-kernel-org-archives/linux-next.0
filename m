From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the gpio tree with the watchdog tree
Date: Wed, 2 Mar 2016 15:22:30 +1100
Message-ID: <20160302152230.3f699334@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42502 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751127AbcCBEWe convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Mar 2016 23:22:34 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, Wim Van Sebroeck <wim@iguana.be>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>

Hi Linus,

Today's linux-next merge of the gpio tree got a conflict in:

  MAINTAINERS

between commit:

  c36a483d8007 ("watchdog: Add watchdog timer support for the WinSystem=
s EBC-C384")

from the watchdog tree and commit:

  9c26df9b27b6 ("gpio: Add GPIO support for the WinSystems WS16C48")

from the gpio tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index e3bb7755763a,6ec2be8ff68d..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -11972,12 -11870,12 +11982,18 @@@ M:	David H=C3=A4rdeman <david@har=
deman.nu
  S:	Maintained
  F:	drivers/media/rc/winbond-cir.c
 =20
 +WINSYSTEMS EBC-C384 WATCHDOG DRIVER
 +M:	William Breathitt Gray <vilhelm.gray@gmail.com>
 +L:	linux-watchdog@vger.kernel.org
 +S:	Maintained
 +F:	drivers/watchdog/ebc-c384_wdt.c
 +
+ WINSYSTEMS WS16C48 GPIO DRIVER
+ M:	William Breathitt Gray <vilhelm.gray@gmail.com>
+ L:	linux-gpio@vger.kernel.org
+ S:	Maintained
+ F:	drivers/gpio/gpio-ws16c48.c
+=20
  WIMAX STACK
  M:	Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>
  M:	linux-wimax@intel.com
