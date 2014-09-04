From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the leds tree with the  tree
Date: Thu, 4 Sep 2014 16:00:00 +0100
Message-ID: <20140904160000.259096a5087702c142ddd601@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__4_Sep_2014_16_00_00_+0100_OlnzVr=34v35gTwt"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:50000 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750803AbaIDPAN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Sep 2014 11:00:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bryan Wu <cooloney@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Thu__4_Sep_2014_16_00_00_+0100_OlnzVr=34v35gTwt
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bryan,

Today's linux-next merge of the leds tree got a conflict in the core files =
between commit 9067359faf890b3a18ab ("Revert "leds: convert blink timer to =
workqueue"") from Linus' tree and commit 665e72332a41b5 ("leds: Reorder inc=
lude directives") from the leds tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

diff --cc drivers/leds/led-class.c
index aa29198fca3e,f4e5bb476b82..000000000000
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@@ -9,16 -9,16 +9,17 @@@
   * published by the Free Software Foundation.
   */
 =20
- #include <linux/module.h>
- #include <linux/kernel.h>
- #include <linux/init.h>
- #include <linux/list.h>
- #include <linux/spinlock.h>
+ #include <linux/ctype.h>
  #include <linux/device.h>
 +#include <linux/timer.h>
  #include <linux/err.h>
- #include <linux/ctype.h>
+ #include <linux/init.h>
+ #include <linux/kernel.h>
  #include <linux/leds.h>
+ #include <linux/list.h>
+ #include <linux/module.h>
+ #include <linux/spinlock.h>
+ #include <linux/workqueue.h>
  #include "leds.h"
 =20
  static struct class *leds_class;
diff --cc drivers/leds/led-core.c
index 71b40d3bf776,8380eb709377..000000000000
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@@ -15,7 -16,7 +16,8 @@@
  #include <linux/list.h>
  #include <linux/module.h>
  #include <linux/rwsem.h>
 +#include <linux/leds.h>
+ #include <linux/workqueue.h>
  #include "leds.h"
 =20
  DECLARE_RWSEM(leds_list_lock);
diff --cc include/linux/leds.h
index e43686472197,bc221d110f5a..000000000000
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@@ -13,9 -13,8 +13,9 @@@
  #define __LINUX_LEDS_H_INCLUDED
 =20
  #include <linux/list.h>
- #include <linux/spinlock.h>
  #include <linux/rwsem.h>
 +#include <linux/timer.h>
+ #include <linux/spinlock.h>
  #include <linux/workqueue.h>
 =20
  struct device;

--Signature=_Thu__4_Sep_2014_16_00_00_+0100_OlnzVr=34v35gTwt
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUCH5wAAoJELSic+t+oim93cMQAIltwlvuQ8PnK5dWht+90rEX
pUj0xzCYsRZDuVMrKOYl/CKT5P/6Alnb/hzQ5tT3uMIgteBoSGy3r/jd+nM0zdJJ
TCJzPPguj48tTLewhroaX/5DpcTVq1F/lfOnwnn4+zPvZmGDHl9ShsGaDmPgHY7U
R/DBw5kfdP4Ci2ow52izF+ISvrEkKHAY9vghQohafZ/h6hxXAYBGZKf+mUQRljAy
uwYNaJoXBg9JpCpTan/Edxws+I0F8jJMIFOI2M8CpmJHFoHUhYvIf3S8Ed4hSQ8a
Bdf91cnfVcSCOGysdqBkjt9IvD++ZzG2pNomVhMHYbRSlGebt1BZtRV1blJlVflj
x2Ch4vWjYbtHGUzyZjM2YJ8fYpkMiEhWgRwQgtSwtaldelRH7Ongu8TeHtzbJiF3
fcdkQTSvtpntiTwl2werr8s310AQbYahGpMyCY1YRAmGsUBQdY/pNSf95uBm3FL4
O5hpSuE1HXn79g2/S805escZXDVaNQimH398SdrBR4BzylA/vrYyQptSMzifmnIS
DF1Qn6sSHCTSX9TD+pzEauqkw79mqaeQnKnEdX0PdEsI7OvO/ky9kTcpE2urggdJ
l3cgbM0f2/lblD7cYZqJF6M5h0XGJpEuS/2/FeYuv3Ad4b7ruSjcfwO+NxMjmLVb
KU6bxWBz/IUIbxmwoOT3
=KjYX
-----END PGP SIGNATURE-----

--Signature=_Thu__4_Sep_2014_16_00_00_+0100_OlnzVr=34v35gTwt--
