From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the arm64 tree with Linus' tree
Date: Thu, 19 Oct 2017 12:28:33 +0100
Message-ID: <20171019112833.2h5ah7tidjnkvo7o@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ygctbebxrd5nygy3"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:59320 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752052AbdJSL2l (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Oct 2017 07:28:41 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Hanjun Guo <hanjun.guo@linaro.org>, Robin Murphy <robin.murphy@arm.com>, Nate Watterson <nwatters@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


--ygctbebxrd5nygy3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Catalin,

Today's linux-next merge of the arm64 tree got a conflict in:

  drivers/acpi/arm64/iort.c

between commit:

  37f6b42e9c296 ("ACPI/IORT: Fix PCI ACS enablement")

=66rom Linus' tree and commit:

  896dd2c324842 ("ACPI/IORT: Make platform devices initialization code SMMU=
 agnostic")

=66rom the arm64 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/acpi/arm64/iort.c
index de56394dd161,7dc964f4d8f1..000000000000
--- a/drivers/acpi/arm64/iort.c
+++ b/drivers/acpi/arm64/iort.c
@@@ -1215,7 -1326,7 +1357,8 @@@ static void __init iort_init_platform_d
  	struct acpi_table_iort *iort;
  	struct fwnode_handle *fwnode;
  	int i, ret;
 +	bool acs_enabled =3D false;
+ 	const struct iort_dev_config *ops;
 =20
  	/*
  	 * iort_table and iort both point to the start of IORT table, but
@@@ -1235,12 -1346,8 +1378,11 @@@
  			return;
  		}
 =20
 +		if (!acs_enabled)
 +			acs_enabled =3D iort_enable_acs(iort_node);
 +
- 		if ((iort_node->type =3D=3D ACPI_IORT_NODE_SMMU) ||
- 			(iort_node->type =3D=3D ACPI_IORT_NODE_SMMU_V3)) {
-=20
+ 		ops =3D iort_get_dev_cfg(iort_node);
+ 		if (ops) {
  			fwnode =3D acpi_alloc_fwnode_static();
  			if (!fwnode)
  				return;

--ygctbebxrd5nygy3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnojGAACgkQJNaLcl1U
h9B5igf/TrybR0CfgFAbhg+V7QtByQ7BHeSwnfMUP37jZjGYUlzjFzp/rFFWGRG5
Chi6n7z/hTiHLQVxHgU1X7cP2coa3yc151el0g5RzvTYF5vYWFkUAnpJboEzTKQk
e4AyhPbkJjrKsC+YGVUOCAOwqXJIzzAEyHUP7GfZobKz30Rcqrvr5R6xMuTAeQue
txh5oCu1SySfhI/vpPfleXWe09e4fSAYo2Kdt2nW8xSTk3WU6d1GlmN2GqhP0F+1
9pjmMKk/jnC8R059icXWNsgVTZ9nQWSszUE53DnKYCZgO5gkU1qYgx61wnFXxt0C
oCvic8ERKD3xrRRx68Slrwy9D2fqNw==
=jwWk
-----END PGP SIGNATURE-----

--ygctbebxrd5nygy3--
