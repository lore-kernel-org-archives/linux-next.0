From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sparc64 build failure
Date: Thu, 29 May 2008 17:53:32 +1000
Message-ID: <20080529175332.a12ad65d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__29_May_2008_17_53_32_+1000_XD1wJaMippOr9ifI"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37106 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751646AbYE2Hxk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 29 May 2008 03:53:40 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>

--Signature=_Thu__29_May_2008_17_53_32_+1000_XD1wJaMippOr9ifI
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Greg,

Today's build of linux-next (sparc64 defconfig) failed like this:

arch/sparc64/kernel/pci.c: In function `of_create_pci_dev':
arch/sparc64/kernel/pci.c:412: warning: passing arg 1 of `sprintf' discards=
 qualifiers from pointer target type
make[2]: *** [arch/sparc64/kernel/pci.o] Error 1

This was caused by commit bd24b944eb93549b1ca5becbf27c7373504f7eed
("driver-core: prepare for removal of 20 char limit from struct device")
from the driver-core tree which made pci_name() return a "const char *".

I have applied the following patch.

Greg, it would really help if a version of dev_set_name() was created
early ... like in Linus' tree now?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From eee5cd99ea3b4e93f41e7f6486d799d198c87750 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 29 May 2008 17:51:05 +1000
Subject: [PATCH] sparc: fallout from pci_name() constifying

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/sparc64/kernel/pci.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/sparc64/kernel/pci.c b/arch/sparc64/kernel/pci.c
index 112b09f..5509619 100644
--- a/arch/sparc64/kernel/pci.c
+++ b/arch/sparc64/kernel/pci.c
@@ -408,7 +408,7 @@ struct pci_dev *of_create_pci_dev(struct pci_pbm_info *=
pbm,
 	dev->class =3D class >> 8;
 	dev->revision =3D class & 0xff;
=20
-	sprintf(pci_name(dev), "%04x:%02x:%02x.%d", pci_domain_nr(bus),
+	dev_set_name(&dev->dev, "%04x:%02x:%02x.%d", pci_domain_nr(bus),
 		dev->bus->number, PCI_SLOT(devfn), PCI_FUNC(devfn));
=20
 	if (ofpci_verbose)
--=20
1.5.5.2


--Signature=_Thu__29_May_2008_17_53_32_+1000_XD1wJaMippOr9ifI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIPmEATgG2atn1QN8RArQMAJ4saxMZm3UC5DIHhv2kWpBLn02cywCffcSR
ID8vhRH+OGTV8fdPWELw3JQ=
=TC2K
-----END PGP SIGNATURE-----

--Signature=_Thu__29_May_2008_17_53_32_+1000_XD1wJaMippOr9ifI--
