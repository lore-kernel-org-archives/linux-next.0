From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the driver-core tree
Date: Thu, 21 May 2015 17:52:06 +1000
Message-ID: <20150521175206.4659cbad@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2_/9eT+ewoEV9B9_yaSwz/J"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51221 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753669AbbEUHwN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 May 2015 03:52:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Luis R. Rodriguez" <mcgrof@suse.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>

--Sig_/2_/9eT+ewoEV9B9_yaSwz/J
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the driver-core tree, today's linux-next build (powerpc
allnoconfig) failed like this:

drivers/base/dd.c: In function 'driver_allows_async_probing':
drivers/base/dd.c:430:31: error: dereferencing pointer to incomplete type
   if (drv->owner && drv->owner->async_probe_requested)
                               ^

Caused by commit f2411da74698 ("driver-core: add driver module
asynchronous probe support").

I have applied the following fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 21 May 2015 17:44:10 +1000
Subject: [PATCH] driver-core: add driver module asynchronous probe support =
fix

struct module is not defined if CONFIG_MODULES is not set.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/base/dd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 39292535c74e..12e120ddbc34 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -427,8 +427,10 @@ bool driver_allows_async_probing(struct device_driver =
*drv)
 		return false;
=20
 	default:
+#ifdef CONFIG_MODULES
 		if (drv->owner && drv->owner->async_probe_requested)
 			return true;
+#endif
=20
 		return false;
 	}
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/2_/9eT+ewoEV9B9_yaSwz/J
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVXY6rAAoJEMDTa8Ir7ZwVCkcP/jQzB0h3n8GRXIYEA/gF0WZK
JPX2cA76NftM5w0MxXgfjvjFrCGlQZ5UutDhStc2myK+PpI5CJnxrDTz1+26tOd4
LpjM81bcTckJKAYElQMHx62QzojroBq+2lfjHe1eyd6VTLji9ZWzi+3bmvO/bgOT
LAVM1MziWTsn2e4mUXjsWzH//eHQ4WvK9+6tY9KJ/uAspLCZ2uGIt+B5mOFpnHgv
W3dnQAAqDZoaFwQlufwFhsnSOeVUdsJ0J94k9/rqEdSxFOPbCUdXuF4h42z7kHBK
HPgODWDgTaL/6lw7bqBBXZQdcWZozOK4odCvmH2ZO6NMHLL1ExoGqaGGpiXZrpeW
8jzX13mio/l+M0S+UALhZZEX04TGFzOpejSpCVIIPd41JKSA/rTyKEiLmeTAEiJ6
k+IC7IoPWjVGEIakMu3IEu8IJYMxtAG+X8FF/a0/T0YRUoz9EBHTs3BWMpCugpY3
P/dnOjig/QSJbBNG2WEq6Cf2zNYNXqomTbpa0LwTFIMeXlFToqk9AU8vq+6AeBpQ
y7xVM7/W3mfr9ht9QplajgEjB5TnQ+kKuihmhKqQXN8DkqM4ogNdo3exaN8eb5dq
PAI5/7JYwMFnUxLqXpQDTBVruTS2EMg4a9bQtQlvRocVV/hs/emE8h5vgTjd4x7a
LHp70e/1xu/qbii//43G
=fuiR
-----END PGP SIGNATURE-----

--Sig_/2_/9eT+ewoEV9B9_yaSwz/J--
