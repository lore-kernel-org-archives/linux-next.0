From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the f2fs tree
Date: Thu, 7 May 2015 12:05:07 +1000
Message-ID: <20150507120507.53079643@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/=n6U5nGJUV.PJI_hoQh5S_m"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58007 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750975AbbEGCFO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 May 2015 22:05:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/=n6U5nGJUV.PJI_hoQh5S_m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in
fs/f2fs/namei.c between commit 04002bddf33a ("f2fs: fix wrong error hanlder=
 in f2fs_follow_link") from the f2fs tree and commits
32a09a012611 ("new ->follow_link() and ->put_link() calling
conventions") and e1a9e9dd8594 ("don't pass nameidata to
->follow_link()") from the vfs tree.

I fixed it up (the vfs tree changes are a superset of the f2fs tree
changes, so I just used them) and can carry the fix as necessary (no
action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/=n6U5nGJUV.PJI_hoQh5S_m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVSshYAAoJEMDTa8Ir7ZwV/Y4P/24nUpy2+17S7rfK/K/DTVvH
o16/a5LzAeemt7P7Qhrbr0yWg/1rOyopDpUGSlAgxqVD+iI1SXKz04M2Osm7iIL1
USHug0TJmkz/JQb4GZPerj5Wla0/srVwPYX4KK7Jb30UxZcecsXOVYme46lFULGT
HkNzUmY0gQKhVkwnlE204Obi1aObcnVTZvP6Fk7NGMpjJsO8EnyD4pP4k10XvVQo
V0DpIvDRJLWESWykEf7T15pgLL84nhR8oFCDYcYO329fnnuyGg84jdU65k1DQQVw
HqWJ7hOc0SVrQKYpTS82MJBKkz6fVGt95Uk0xi/CRRBRfmdZhma16wmmHn4SaA3F
YYjBimWGayvaJK77smWYzTX/3/l51xf0wU5rXkI7N7JjHaqQmCCYrB4u7f142iaQ
thYH6h2QexIsAFuvYziaVE2/eWtiH0kjraATrp+7DZmSO0KhsaYnq0RH2J/pynpS
RBi1mBdp6+1tVJ8PXY7xoHmtMGS5BA75T3za5zppME9elyWNzhljYzMvmEreIaOx
50TZCGUhs59AG6A1ZASAZDQPsLqKd6w5wM5SDfVq/heuSv0GIv5LJ5Z1nU3U4Psj
l2NehMTOcwsceON9erZyg1JsdOMqgpXjlV9rIazQABbRUu1g6MqX9mRT2hf6MYOB
YYzo8vnci+Fsfw+is6hp
=W+kg
-----END PGP SIGNATURE-----

--Sig_/=n6U5nGJUV.PJI_hoQh5S_m--
