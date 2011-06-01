From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mmc tree with Linus' tree
Date: Wed, 1 Jun 2011 11:13:20 +1000
Message-ID: <20110601111320.07b07b7f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__1_Jun_2011_11_13_20_+1000_J7AGBdET1Xn5F9EW"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46338 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933005Ab1FABNc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 31 May 2011 21:13:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chris Ball <cjb@laptop.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>, Anton Vorontsov <cbouatmailru@gmail.com>, Grant Likely <grant.likely@secretlab.ca>

--Signature=_Wed__1_Jun_2011_11_13_20_+1000_J7AGBdET1Xn5F9EW
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chris,

Today's linux-next merge of the mmc tree got a conflict in
drivers/mmc/host/sdhci-of-core.c between commit b1608d69cb80
("drivercore: revert addition of of_match to struct device") from Linus'
tree and commit e2d0d7dc5542 ("mmc: sdhci: make sdhci-of device drivers
self registered") from the mmc tree.

The latter removes the file, so I did that (I *think* that the change
from the former is no longer needed, but someone should check).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__1_Jun_2011_11_13_20_+1000_J7AGBdET1Xn5F9EW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJN5ZIwAAoJEDMEi1NhKgbs7UIH/RmjlRj3dKaJaecVeC/9QMM9
LVWlGwuimZ3jcoEpATkouyQBoeE/c+0IlIsomw6qwZbr+L0zyZ+IBkhcFJVGLisV
eF5WBdMJPjO8qcTq5DIJdo5Ucsr1xWUe97CSMhkEPtoyGYzpZxnso1WD3wYnumaj
4wCW6I+l+9xEVId4XIpRjlZE4BevQ6j/F+Hc9PSj8cufm4uXCF38xI+jpCvWbhbB
xUv2/o98C1/GhXbT+HvEzJd68KhTnZa2nCeDlIJ13nFtvccA/sXJO8pUvqsBJBuh
x9A9rs001/T43ViQxOWOGLw2bzLdVOYyOOG6QWc888DCAj4u2qIH+VTZeCKKDfA=
=Z1Lv
-----END PGP SIGNATURE-----

--Signature=_Wed__1_Jun_2011_11_13_20_+1000_J7AGBdET1Xn5F9EW--
