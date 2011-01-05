From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the devicetree tree with the sparc tree
Date: Wed, 5 Jan 2011 13:35:57 +1100
Message-ID: <20110105133557.dae27abf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__5_Jan_2011_13_35_57_+1100_yuatZMu4RLABM2Nn"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45628 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751064Ab1AECgM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 4 Jan 2011 21:36:12 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, David Miller <davem@davemloft.net>, Andres Salomon <dilinger@queued.net>

--Signature=_Wed__5_Jan_2011_13_35_57_+1100_yuatZMu4RLABM2Nn
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Grant,

Today's linux-next merge of the devicetree tree got a conflict in
arch/sparc/prom/tree_32.c between commit
1f42be484ffc5559a29466c82adac7dd472d4439 ("sparc: remove unused prom tree
functions") from the sparc tree and commit
4a3a255289e7e322b8044286cce85031990f888a ("sparc: explicitly cast
negative phandle checks to s32") from the devicetree tree.

The former removes the code modified by the latter, so I just removed it.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__5_Jan_2011_13_35_57_+1100_yuatZMu4RLABM2Nn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJNI9kOAAoJEDMEi1NhKgbse8MH/0X4lcpEfHn56M/dSSIYirnd
YchFCcgoXAyy0gLYqS1oI72G92B4AIbrUutArA/B6+8oSA/U6LAQrz+GnoA48h36
iioRc8w+enVqBAJx8zQ0cYcVpCqQf4w/rA8beKrLOM3s/peoVTf4U8TKiUWDnBxM
+iAYnpl+Bbk6rLjoISPasKrNA8K2M0f6mHQ/3TL/z9deT8BVJ3jHWjdtSIwtuGWB
llSsM3Hon1kSpdzAblmTsN+zFZ2dGa0QVcZgjeMWAoqAfudj4QA1dc+vuFL4MRfP
ULHriRrw+SwgXNugwPIrdpDqEYYtIcDna/THhnejDLxBqTkh3QiifrEQOxY4hUo=
=nx2f
-----END PGP SIGNATURE-----

--Signature=_Wed__5_Jan_2011_13_35_57_+1100_yuatZMu4RLABM2Nn--
