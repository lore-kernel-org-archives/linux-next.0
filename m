From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pci-current tree with Linus'  tree
Date: Thu, 28 May 2015 11:36:26 +1000
Message-ID: <20150528113626.58758931@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/RldSXnKmsdCutiBqpEM0Zzo"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51476 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752473AbbE1Bgc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 27 May 2015 21:36:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pratyush Anand <pratyush.anand@gmail.com>, Jingoo Han <jingoohan1@gmail.com>

--Sig_/RldSXnKmsdCutiBqpEM0Zzo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Bjorn,

Today's linux-next merge of the pci-current tree got a conflict in
MAINTAINERS between commit b77017555ce5 ("MAINTAINERS: update Jingoo
Han's email address") from Linus' tree and commit 110baab1d128
("MAINTAINERS: Add Pratyush Anand as SPEAr13xx and DesignWare PCIe
maintainer") from the pci-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc MAINTAINERS
index 474bcb6c0bac,72674ba8cca5..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -7575,7 -7546,8 +7575,8 @@@ S:	Maintaine
  F:	drivers/pci/host/pci-exynos.c
 =20
  PCI DRIVER FOR SYNOPSIS DESIGNWARE
 -M:	Jingoo Han <jg1.han@samsung.com>
 +M:	Jingoo Han <jingoohan1@gmail.com>
+ M:	Pratyush Anand <pratyush.anand@gmail.com>
  L:	linux-pci@vger.kernel.org
  S:	Maintained
  F:	drivers/pci/host/*designware*

--Sig_/RldSXnKmsdCutiBqpEM0Zzo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVZnEeAAoJEMDTa8Ir7ZwVt10P+gIwg9IJhGm4GpT4L4UlbYYH
tuKceNAhLSaumP1L6Old0TyTUDrl+OpmRrXDUIMhtXRg4bvdQtO9hs0h+qY92x75
Yjt2wlsbyOt5Yi9bZM2aeJ5Jti1gKijqRxn2WzmSzIs4mD6o08hvVfogMODvZePh
qCeZwn/R6XV9xJfM0jl+3foVW1VLB86rCQoocOGZkKkWh6aGL7ipymDIjyHrFKaF
9xacgREsLdaG71IPLX65/En4f5xd8wjD2apqXWxC1d6jVsYYgLIasymwAnBBtkLH
64ZM1+lGwL7Tcu6yNtM2eZNwfscFh61J3afTjQtrKdzogZx6WVKL+5aiHUI11o77
Tt9JzN9cqXJAdAtI/RlNY+KY8Z4WtOI9bQZQNS2S8IgQhVr64PrClPWfV1pK+wc1
EeaG90QFOlFFC32jybXys4z6IbnaSMR/mxvaIp59A/1qYyZNAscmcmB2oJkwJAYO
7x8ZKNHTV1NuEUWWAm30vOguY5Pehsv204mWN4n5ciQmGgi6xYnj5m9Bv4I79AgT
mk0OfMDJElZI8YiOWtVqvW8PwK1BftJ0nXJaZ7wIcjg37jyL+1z2OU3JcB5Ib9rn
vcVO+V+15A+F0qZ58YSipuGZJqDOFSCt0t2227DHm6KijD3hfZqr96FevVI8auQP
Zuytm1+bVNtwAnIP9wNt
=qx7K
-----END PGP SIGNATURE-----

--Sig_/RldSXnKmsdCutiBqpEM0Zzo--
