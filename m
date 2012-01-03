From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the l2-mtd tree with the logfs tree
Date: Tue, 3 Jan 2012 14:00:29 +1100
Message-ID: <20120103140029.2f996dab9bdfd3ec5c876045@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__3_Jan_2012_14_00_29_+1100_fu4v.CfGTceSpzzW"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:56560 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750863Ab2ACDAj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Jan 2012 22:00:39 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Prasad Joshi <prasadjoshi.linux@gmail.com>, =?UTF-8?B?IkrDtnJuIEVuZ2VsIg==?= <joern@logfs.org>

--Signature=_Tue__3_Jan_2012_14_00_29_+1100_fu4v.CfGTceSpzzW
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Artem,

Today's linux-next merge of the l2-mtd tree got a conflict in
fs/logfs/dev_mtd.c between commit d1cc3ad397f2 ("Logfs: Allow NULL
block_isbad() methods") from the logfs tree and commit 957afd905eda
("logfs: do not use 'mtd->block_isbad' directly") from the l2-mtd tree.

I fixed it up (see below) and can carry the fix as necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/logfs/dev_mtd.c
index d054d7e,e97404d..0000000
--- a/fs/logfs/dev_mtd.c
+++ b/fs/logfs/dev_mtd.c
@@@ -147,16 -149,17 +149,16 @@@ static struct page *logfs_mtd_find_firs
  {
  	struct logfs_super *super =3D logfs_super(sb);
  	struct address_space *mapping =3D super->s_mapping_inode->i_mapping;
- 	filler_t *filler =3D mtd_readpage;
+ 	filler_t *filler =3D logfs_mtd_readpage;
  	struct mtd_info *mtd =3D super->s_mtd;
 =20
 -	if (!mtd_can_have_bb(mtd))
 -		return NULL;
 -
  	*ofs =3D 0;
- 	if (mtd->block_isbad) {
- 		while (mtd->block_isbad(mtd, *ofs)) {
 -	while (mtd_block_isbad(mtd, *ofs)) {
 -		*ofs +=3D mtd->erasesize;
 -		if (*ofs >=3D mtd->size)
 -			return NULL;
++	if (mtd_can_have_bb(mtd)) {
++		while (mtd_block_isbad(mtd, *ofs)) {
 +			*ofs +=3D mtd->erasesize;
 +			if (*ofs >=3D mtd->size)
 +				return NULL;
 +		}
  	}
  	BUG_ON(*ofs & ~PAGE_MASK);
  	return read_cache_page(mapping, *ofs >> PAGE_SHIFT, filler, sb);
@@@ -166,16 -169,17 +168,16 @@@ static struct page *logfs_mtd_find_last
  {
  	struct logfs_super *super =3D logfs_super(sb);
  	struct address_space *mapping =3D super->s_mapping_inode->i_mapping;
- 	filler_t *filler =3D mtd_readpage;
+ 	filler_t *filler =3D logfs_mtd_readpage;
  	struct mtd_info *mtd =3D super->s_mtd;
 =20
 -	if (!mtd_can_have_bb(mtd))
 -		return NULL;
 -
  	*ofs =3D mtd->size - mtd->erasesize;
- 	if (mtd->block_isbad) {
- 		while (mtd->block_isbad(mtd, *ofs)) {
 -	while (mtd_block_isbad(mtd, *ofs)) {
 -		*ofs -=3D mtd->erasesize;
 -		if (*ofs <=3D 0)
 -			return NULL;
++	if (mtd_can_have_bb(mtd)) {
++		while (mtd_block_isbad(mtd, *ofs)) {
 +			*ofs -=3D mtd->erasesize;
 +			if (*ofs <=3D 0)
 +				return NULL;
 +		}
  	}
  	*ofs =3D *ofs + mtd->erasesize - 0x1000;
  	BUG_ON(*ofs & ~PAGE_MASK);

--Signature=_Tue__3_Jan_2012_14_00_29_+1100_fu4v.CfGTceSpzzW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJPAm9NAAoJEECxmPOUX5FE9IgP/jIArZPmyPfD40ykeleFR9fS
bP6CBSsD11H4N8HvsPi4rdcLEhLvh1d73NhnoaCw9mQcjuIOZ0yib2ltPMFN6PQ8
Fb6t7mBV4zB8ijsiZo4kpC4ymCnjXL96YoryJULzx5KMbaNd1fskdiHHwexv1KAC
ELHKb18ThbxElEo5OwXvBpneVx8MXaQenXFDYWwjiFKnqACUhp20ZtGU+9tsGUbj
w2czgJLNMpPl0SuvF69VZfX7KEc7bgFNJADpKN0cUvnf5NcM0ZisMUk1nxQNhP1w
eH7LOZInImrIZOOQPQpzb05DeiQEAY52IOS6G/g9JDUHopHdNzIvPvuyakt9CnGc
wiahQwkGAlW2IsqJgzCv0OaE0vkjP/a2sk8TCq7Xhx88d7FXgorh3q96qfgWgDNz
Vhg1do6hLlebp5rpMQJnT3xMR6YTNCxy2ssx0SbfMyyAGb/iSrniSgkhl2VyWRhk
weRIvrSbagvK/PBskYJxmvNJgVkf7CoGUmc6jnOQlaQXULCLannVWuLe30vcgGWt
n1E1L9OXpWadqHwAWtDp79wNgIwWdf37jydUMTCVOfawQjV0pRLHg8Vuizq3cJgx
TbSw28GzqOY8AeyqhrL8FU8WkLchaSXIcfakwuA0qp8bJ/Jlzlur4d0XeBKmaAE0
rewlKEVMPL+9CHW8KxKh
=NIeU
-----END PGP SIGNATURE-----

--Signature=_Tue__3_Jan_2012_14_00_29_+1100_fu4v.CfGTceSpzzW--
