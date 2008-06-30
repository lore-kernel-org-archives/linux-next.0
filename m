From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ide tree build failure
Date: Mon, 30 Jun 2008 15:28:54 +1000
Message-ID: <20080630152854.7474ec30.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__30_Jun_2008_15_28_54_+1000_+s7RRSzHWPaA0+KL"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54328 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751599AbYF3F27 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Jun 2008 01:28:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__30_Jun_2008_15_28_54_+1000_+s7RRSzHWPaA0+KL
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bart,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/ide/ppc/pmac.c: In function 'pmac_ide_setup_device':
drivers/ide/ppc/pmac.c:1115: error: implicit declaration of function 'ide_a=
lloc_host'
drivers/ide/ppc/pmac.c:1115: warning: assignment makes pointer from integer=
 without a cast

Caused by commit 9cfe46a0547b6a1481e773785bceb6a319963b49 ("ide: add
struct ide_host (take 2)") from the ide tree which I have reverted.

Then the x86_64 allmodconfig build fails with:

ERROR: "ide_init_port_hw" [drivers/ide/legacy/ide-cs.ko] undefined!

For which I applied the patch below.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 1bdb17cc47df67e2ca9137ca80d23cc3ac6c61cc Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 30 Jun 2008 15:26:59 +1000
Subject: [PATCH] ide: export ide_init_port_hw to modules

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/ide/ide.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/ide/ide.c b/drivers/ide/ide.c
index d7ae256..7e905cc 100644
--- a/drivers/ide/ide.c
+++ b/drivers/ide/ide.c
@@ -288,6 +288,7 @@ void ide_init_port_hw(ide_hwif_t *hwif, hw_regs_t *hw)
 	hwif->ack_intr =3D hw->ack_intr;
 	hwif->config_data =3D hw->config;
 }
+EXPORT_SYMBOL_GPL(ide_init_port_hw);
=20
 /*
  *	Locks for IDE setting functionality
--=20
1.5.6


--Signature=_Mon__30_Jun_2008_15_28_54_+1000_+s7RRSzHWPaA0+KL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhobxYACgkQjjKRsyhoI8wq0gCffysVvm/lbx3Out7Hk1FR0ZED
7JkAmwYj49/zK5oD9RrO541FE0T3EFtQ
=xNqM
-----END PGP SIGNATURE-----

--Signature=_Mon__30_Jun_2008_15_28_54_+1000_+s7RRSzHWPaA0+KL--
