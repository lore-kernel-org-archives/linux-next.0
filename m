From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: infiniband tree build failure
Date: Wed, 29 Apr 2009 14:01:01 +1000
Message-ID: <20090429140101.d9c7467c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__29_Apr_2009_14_01_01_+1000_A.BV9Nx_SbtJqkNh"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36956 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750795AbZD2EBN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Apr 2009 00:01:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Roland Dreier <rdreier@cisco.com>, general@lists.openfabrics.org
Cc: linux-next@vger.kernel.org, Stefan Roscher <ossrosch@linux.vnet.ibm.com>

--Signature=_Wed__29_Apr_2009_14_01_01_+1000_A.BV9Nx_SbtJqkNh
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Roland,

Today's linux-next build (powerpc ppc64_defconfig) produced this new
warning:

drivers/infiniband/hw/ehca/hcp_phyp.c: In function 'hcp_galpas_ctor':
drivers/infiniband/hw/ehca/hcp_phyp.c:65: warning: assignment makes integer=
 from pointer without a cast

Caused by commit 2bd93ed8b59d9bf8b918a0fa04be50482906c16b ("IB/ehca:
Remove unnecessary memory operations for userspace queue pairs").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__29_Apr_2009_14_01_01_+1000_A.BV9Nx_SbtJqkNh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkn30P0ACgkQjjKRsyhoI8yTQgCfVdJDQejAXXYnkl+q5eFG9ja8
BB8AoKw9MdJ76ajGtUEdzlBH5BuLF0oY
=+snv
-----END PGP SIGNATURE-----

--Signature=_Wed__29_Apr_2009_14_01_01_+1000_A.BV9Nx_SbtJqkNh--
