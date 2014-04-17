From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the crypto tree with Linus' tree
Date: Thu, 17 Apr 2014 12:49:12 +1000
Message-ID: <20140417124912.bb29f78d07565de5b5bef8e6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__17_Apr_2014_12_49_12_+1000_HO51zKt_gUfbFZl6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46563 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754235AbaDQCtV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Apr 2014 22:49:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Jean Delvare <jdelvare@suse.de>

--Signature=_Thu__17_Apr_2014_12_49_12_+1000_HO51zKt_gUfbFZl6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Herbert,

Today's linux-next merge of the crypto tree got a conflict in
drivers/char/hw_random/Kconfig between commit 2257ffbca73c ("hwrng: msm:
switch Kconfig to ARCH_QCOM depends") from Linus' tree and commits
020016183453 ("hwrng: Turn HW_RANDOM into a menuconfig") and 2d9cab5194c8
("hwrng: Fix a few driver dependencies and defaults") from the crypto
tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/char/hw_random/Kconfig
index 244759bbd7b7,38cfae686cc4..000000000000
--- a/drivers/char/hw_random/Kconfig
+++ b/drivers/char/hw_random/Kconfig
@@@ -342,11 -321,12 +321,12 @@@ config HW_RANDOM_TP
  	  If unsure, say Y.
 =20
  config HW_RANDOM_MSM
 -	tristate "Qualcomm MSM Random Number Generator support"
 -	depends on ARCH_MSM
 +	tristate "Qualcomm SoCs Random Number Generator support"
- 	depends on HW_RANDOM && ARCH_QCOM
++	depends on ARCH_QCOM
+ 	default HW_RANDOM
  	---help---
  	  This driver provides kernel-side support for the Random Number
 -	  Generator hardware found on Qualcomm MSM SoCs.
 +	  Generator hardware found on Qualcomm SoCs.
 =20
  	  To compile this driver as a module, choose M here. the
  	  module will be called msm-rng.

--Signature=_Thu__17_Apr_2014_12_49_12_+1000_HO51zKt_gUfbFZl6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJTT0EtAAoJEMDTa8Ir7ZwV3lgP/jBz2AzuUmcdVExx0BFQ41AE
0q7pmgD3q3ge8G/HAz9kuU4hu0T700rS1Fhd4v9uRsYWcgejshPWGhuFqQSsDjTy
8//PzGeIQ5RjZYgu0JCcRMqujcHI5NjH3P+g0IaBh2AT87tfsQsRziEYsVPhlRwL
4qJp+jvfPIpcpFSE/mbgSzHskZADgnDY5gOCvJzxnf4Ffsn3PEYdkXwUsblA4HyH
wsGYNsl2Y+OsnhxB34tyQHCEhgTI+PERiETAPvM9wT5+2zLgpi23LOp+fxtgVJH2
zfgTzqn4gMemYUdmYNc08Pu4heJ3jlUUOncUDlmILf5mmN+BwPbjO1s8e+ea1pP/
Gce+aVFrX+7puTiCyEFWfwVu0nZnJO23G7vQqx+mHrAjeyC7r/I/esOUn8du+W+9
hZvQv5HdgA7PLysP0xTzjecex+qr3BQLOQF9ECahWh3gvfSSyMrbn8BMQRxxePyB
nj/7zEkaJDV2YlAmc0X/ZXswxo4c/20oxdfuY7caKrSN8Cgt5WFnptsKgjK3YA5p
Id394rr1DmmXKnuJTN5v1g0TPLQM37GLrkecsH2U1+GydsZk8IehPqtPkhyckhI/
gVeXpKvpFC6vzF/dp5eHqYWWyAtufyQycOsxZtW05yj2h/4DIQOke+VmXjyrnMMW
/PlOcraFXBR8IOBtKgBU
=0FfR
-----END PGP SIGNATURE-----

--Signature=_Thu__17_Apr_2014_12_49_12_+1000_HO51zKt_gUfbFZl6--
