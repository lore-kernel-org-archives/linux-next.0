From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the userns tree
Date: Thu, 2 Jul 2015 14:26:17 +1000
Message-ID: <20150702142617.4e6cec01@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/sd67fj4RYXLtkc3TtFNPOqx"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56955 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751035AbbGBE0Z (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 2 Jul 2015 00:26:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, "Eric W. Biederman" <ebiederm@xmission.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/sd67fj4RYXLtkc3TtFNPOqx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in:

  fs/nsfs.c

between the userns tree and patch

  "nsfs: fix for seq_printf() API change"

from the akpm tree.

The commit ed2ffc74eee8 ("nsfs: Add a show_path method to fix mountinfo")
that was being fixed by the akpm tree patch was dropped from the usernsn
tree, so I dropped the akpm tree patch as well.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/sd67fj4RYXLtkc3TtFNPOqx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVlL1uAAoJEMDTa8Ir7ZwVAaYQAJIisG4RkWc7kjMMscsV3RxO
K9zYMh9dF8ShMmbwhUTdEssW9Iq5gx3Ud0ouqO1U0XoBiK9cE+9YsYOGt+yQ5GEb
6phiCLoIsByhXgiyj/qWSC4BO9zDUgCtGbn4tQGPyrY36qV4wCE3OQppkyMCNdAT
aUJpJleP5W5MXSYS8q4TcTiq3HMj1t0hQtXLzL8dqOHBMMUJPoHpFEny0tNXtmAs
neyxg8s3+wXSpl5Zg8kNWZRXyj6e9mHjZfDC+QF20xErn79TFqXW4lgneWYmY/mY
Hit4V5c1Jxt2VL9YoRu8fA3UITAEP1xL6E4QUaug7ffUcOwCXks5n5juNqjeoc4Y
Xy2Qc00TMMxZHhB062qg3dDgQT+bbyZWJk47mR2xwUVTM4bdBaO+4kJpPoRRvvvb
eKSERyZZctN9BPY1nW1OrwZcWg9ClVaeKxA8LJc6c8N7V8SAnf2M5vbG1Cly6kBk
PX1OfsFtHBTHMwoUlCqPoceWfayaKKI2QgA7Ewq9oawt3nK9zOHJNnO4A10+K/WG
MZAVDiSXUGMzDPN6rfXju11HWDjxkmbdHpdlhtcu+thO8GiRb7QRMHHwP6Dn06Uq
xDEIFBcsjkUV4a1f9oi+dNIDOpDLuaRhYyw/KfVH138Zmhs5F7BEhAZAUmJFihNv
+TRaG790tDcEGINXGfrH
=XiH6
-----END PGP SIGNATURE-----

--Sig_/sd67fj4RYXLtkc3TtFNPOqx--
