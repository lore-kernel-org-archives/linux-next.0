From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (usb tree
 related)
Date: Thu, 17 Jun 2010 14:53:31 +1000
Message-ID: <20100617145331.7bbefc4a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__17_Jun_2010_14_53_31_+1000_d.GxvfaWHfxzpQHC"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35747 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751215Ab0FQExi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Jun 2010 00:53:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alek Du <alek.du@intel.com>, Jacob Pan <jacob.jun.pan@intel.com>

--Signature=_Thu__17_Jun_2010_14_53_31_+1000_d.GxvfaWHfxzpQHC
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the final tree, today's linux-next build (powerpc
allyesconfig) failed like this:

In file included from drivers/usb/host/ehci-hcd.c:113:
drivers/usb/host/ehci-dbg.c: In function 'debug_lpm_write':
drivers/usb/host/ehci-dbg.c:992: error: implicit declaration of function 'c=
opy_from_user'

Caused by commit a3c0b4b257eeaefe4e6c8fbf5ddfe674242f1b9e ("USB: EHCI:
EHCI 1.1 addendum: preparation").  Presumably a missing include of
linux/uaccess.h ...

I applied this patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 17 Jun 2010 14:49:09 +1000
Subject: [PATCH] usb: using copy_from_user in ehci-hcd requies the include =
of uaccess.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/usb/host/ehci-hcd.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index 40928fe..8697ad1 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -36,6 +36,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/debugfs.h>
 #include <linux/slab.h>
+#include <linux/uaccess.h>
=20
 #include <asm/byteorder.h>
 #include <asm/io.h>
--=20
1.7.1


--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__17_Jun_2010_14_53_31_+1000_d.GxvfaWHfxzpQHC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkwZqksACgkQjjKRsyhoI8z17ACePtau/qh+3MSrzikTI2zlE441
kv8AnjDHpITJB/WeZc3TXNyKwqEWE4Hj
=QXAc
-----END PGP SIGNATURE-----

--Signature=_Thu__17_Jun_2010_14_53_31_+1000_d.GxvfaWHfxzpQHC--
