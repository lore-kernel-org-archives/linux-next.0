From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the ext4 tree
Date: Wed, 7 Aug 2013 15:16:11 +1000
Message-ID: <20130807151611.7651be058d537610ea1b05bf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__7_Aug_2013_15_16_11_+1000_X0+CnZmH44zbtmbm"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:48821 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753424Ab3HGFQ1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Aug 2013 01:16:27 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>, Dave Chinner <dchinner@redhat.com>

--Signature=_Wed__7_Aug_2013_15_16_11_+1000_X0+CnZmH44zbtmbm
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in
fs/ext4/extents_status.c between commit 49c6efc7b80e ("ext4: add new
ioctl EXT4_IOC_PRECACHE_EXTENTS") from the ext4 tree and commit "fs:
convert fs shrinkers to new scan/count API" from the akpm tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/ext4/extents_status.c
index 00e6589,9f931b2..0000000
--- a/fs/ext4/extents_status.c
+++ b/fs/ext4/extents_status.c
@@@ -1091,9 -1044,7 +1102,9 @@@ static int __es_try_to_reclaim_extents(
  	struct ext4_es_tree *tree =3D &ei->i_es_tree;
  	struct rb_node *node;
  	struct extent_status *es;
- 	int nr_shrunk =3D 0;
+ 	long nr_shrunk =3D 0;
 +	static DEFINE_RATELIMIT_STATE(_rs, DEFAULT_RATELIMIT_INTERVAL,
 +				      DEFAULT_RATELIMIT_BURST);
 =20
  	if (ei->i_es_lru_nr =3D=3D 0)
  		return 0;

--Signature=_Wed__7_Aug_2013_15_16_11_+1000_X0+CnZmH44zbtmbm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBCAAGBQJSAdgkAAoJEECxmPOUX5FEbzgP/2mVBzNu3DOJqItGNfMdHbC8
Pr5yGweXc1gsaA8FoSGagkCryj0TJzONPV5HuDFfGzh8xH3NglOCF1hSVUoDxQIw
9XFsjyuSjex7De9TT7Z2m9q0sqHD1/hnZV9Ovd5lpaDhSUU79KjoXuYnVJryg2IO
eYf0sVfYh1A2V6YTiGV6vgHbLP9TigIRsB8zi4MIx3WvWkJo7U12nMiVzN8fbPFZ
DcPLTsfNJrTBP83Axjoa2WNy8NxpU4/KoVLvN7WW5UOfz+l/pvxEGEVi8MkJlIAt
696lSQnMT12Mj8dcqvuaLzHufRmzOIVU5gt5dHmfM06oCB3Fc1fjHDQctHEQffcg
qoskxS3j2q+iV886nCX38lJk3sAyxyu6gYdlg0UcHTWKWlR9RAlQeriOBtfL3GuV
mqFwGk9Y4H7HJaqhLu0Onzr8seUjTByOCs10wFYjOfpJlkv1sCgRVvX2SY9zEyMm
B3Eb//yAb711IqY/bCVv/drdJ2sGORQSNFmlXWGFxWTdmjYWP04o0jkUlxRl474s
5nbWmZyPEi9A9sOwb43oRi7rLPavjmzQGRr+65Dzripyk3QkBgeshYpOjn/6gzJO
qO9KygjL92SkNKReb2IcoH8s/AH07FbiAOKyT61X6J66uLehqvU2EbeUNw3//AMm
v0CV4UyfvYG9f4wfLZum
=B9Mi
-----END PGP SIGNATURE-----

--Signature=_Wed__7_Aug_2013_15_16_11_+1000_X0+CnZmH44zbtmbm--
