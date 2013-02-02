From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the watchdog
 tree
Date: Sun, 3 Feb 2013 00:01:12 +1100
Message-ID: <20130203000112.5ddf1fa2d0ba46089dcb9c29@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Sun__3_Feb_2013_00_01_12_+1100_ZRdtFV/LrXP5Q+BZ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:40017 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756883Ab3BBNBQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 2 Feb 2013 08:01:16 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sachin Kamat <sachin.kamat@linaro.org>, Wolfram Sang <w.sang@pengutronix.de>, Wim Van Sebroeck <wim@iguana.be>

--Signature=_Sun__3_Feb_2013_00_01_12_+1100_ZRdtFV/LrXP5Q+BZ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in
drivers/rtc/rtc-stmp3xxx.c between commit e02f5cf6b648 ("rtc: stmp3xxx:
add wdt-accessor function") from the watchdog tree and commit
"drivers/rtc: use of_match_ptr() macro" from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/rtc/rtc-stmp3xxx.c
index cc9a9b6,b2a8ed9..0000000
--- a/drivers/rtc/rtc-stmp3xxx.c
+++ b/drivers/rtc/rtc-stmp3xxx.c
@@@ -26,8 -26,7 +26,9 @@@
  #include <linux/rtc.h>
  #include <linux/slab.h>
  #include <linux/of_device.h>
 +#include <linux/stmp_device.h>
 +#include <linux/stmp3xxx_rtc_wdt.h>
+ #include <linux/of.h>
 =20
  #include <mach/common.h>
 =20

--Signature=_Sun__3_Feb_2013_00_01_12_+1100_ZRdtFV/LrXP5Q+BZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJRDQ4YAAoJEECxmPOUX5FElKQP/i+9qeGWYKUnpBIlX+Ygp++2
UfCulwHWHEReCtqPQOQbGEYTJhRiRl5OS8PnTS29qfHuXmYMve+yGUxcCAY2ue4D
e/rfsu5TDhMZn9/AKZ7EQz0CgReYUi5uBsQCk2ZqKZVeD67eaqbRS715ohseel15
vWLrWjVjHfLHHMSrP8Rqf+DUfCVWYsdHfpkgQcCQ5XKTIG7zWyraBcahqI/D5IC7
91OkFdIqhS1ZFJNH/MrWuKNKtbHjAaQM1p0Xea19A42HQh7bPc3WaX4s2rpWvX9y
QoSaITPY3WpaXXM2GPz3e9YW6yW+qmfRyM92s238MfsxfMGHJo6gvFYFfcuxUc2k
ghVkP3pg3PHWgjYfx7KMHgvYmwo3adz80v8cCTs2JTQxeeQx/s0FjZ+JSav7RFRM
5nOMyeikeH/rqA3LFpFuGbpANU48nfbqloX7YYlw3PBS9A5mIOKflk2Ip6bda9lT
U+qhMiSqJe/vTbyZcDRRXysmThMfqxSoVOupSpSBt/wuB3bY7qOaszOWH3MOxykG
8r2ctlXWb8nya7w+bbbOM2JXB7nU4spWM/GatmrfLxYHb5X2+c4YENE5ZxtL8Xa2
op86ZDVRNjOkBpmSQ+5lPZ0Uk1WKDri5uX4rkroZlnbALI6nOtnCYLE2JHN0kvTS
f7NBG00zJhy8wITE2n2O
=IqVh
-----END PGP SIGNATURE-----

--Signature=_Sun__3_Feb_2013_00_01_12_+1100_ZRdtFV/LrXP5Q+BZ--
