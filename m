From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the ext4 tree
Date: Tue, 9 Jun 2015 12:47:43 +1000
Message-ID: <20150609124743.6ebf692c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/KABMpGKuh9_lTpn=72f49cC"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42675 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750814AbbFICrx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 8 Jun 2015 22:47:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, Theodore Ts'o <tytso@mit.edu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/KABMpGKuh9_lTpn=72f49cC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in
fs/ext4/symlink.c between commit b7236e21d55f ("ext4 crypto: reorganize
how we store keys in the inode") from the ext4 tree and commit
680baacbca69 ("new ->follow_link() and ->put_link() calling
conventions") from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/ext4/symlink.c
index 68e915aac0fe,ba5bd18a9825..000000000000
--- a/fs/ext4/symlink.c
+++ b/fs/ext4/symlink.c
@@@ -34,20 -35,19 +34,17 @@@ static const char *ext4_follow_link(str
  	int res;
  	u32 plen, max_size =3D inode->i_sb->s_blocksize;
 =20
- 	if (!ext4_encrypted_inode(inode))
- 		return page_follow_link_light(dentry, nd);
-=20
 -	ctx =3D ext4_get_fname_crypto_ctx(inode, inode->i_sb->s_blocksize);
 -	if (IS_ERR(ctx))
 -		return ERR_CAST(ctx);
 +	res =3D ext4_get_encryption_info(inode);
 +	if (res)
 +		return ERR_PTR(res);
 =20
  	if (ext4_inode_is_fast_symlink(inode)) {
  		caddr =3D (char *) EXT4_I(inode)->i_data;
  		max_size =3D sizeof(EXT4_I(inode)->i_data);
  	} else {
  		cpage =3D read_mapping_page(inode->i_mapping, 0, NULL);
 -		if (IS_ERR(cpage)) {
 -			ext4_put_fname_crypto_ctx(&ctx);
 +		if (IS_ERR(cpage))
- 			return cpage;
+ 			return ERR_CAST(cpage);
 -		}
  		caddr =3D kmap(cpage);
  		caddr[size] =3D 0;
  	}
@@@ -78,13 -77,14 +75,12 @@@
  	/* Null-terminate the name */
  	if (res <=3D plen)
  		paddr[res] =3D '\0';
- 	nd_set_link(nd, paddr);
 -	ext4_put_fname_crypto_ctx(&ctx);
  	if (cpage) {
  		kunmap(cpage);
  		page_cache_release(cpage);
  	}
- 	return NULL;
+ 	return *cookie =3D paddr;
  errout:
 -	ext4_put_fname_crypto_ctx(&ctx);
  	if (cpage) {
  		kunmap(cpage);
  		page_cache_release(cpage);

--Sig_/KABMpGKuh9_lTpn=72f49cC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVdlPWAAoJEMDTa8Ir7ZwVRXMP/iAOfudUKEZqT3Ooa+ageb4E
ZHEZrrUNxFfOtoQPc8CtXlVwDk2Pd3q4nckFm0F0o9ZujQKRn8mRu2GnLm8FPc1i
xv1yhedAHfR+f/CF9XmTXEALtvom7eAvSVAloBLNiOsxyV3IT/GHMz0qWvhoAJP1
G+JcF+sufn+9lHAvlF4OUlOSNo1GJGwP+/RhXH0aT4NU4EAlnkFw/vQUaFLuzHyC
ncVvTEDAMXjDmxDDN46MWJv71jxtRPsJLESJvxmRvWuFqbKeCWLOPWDLyHxb6XV0
bBRVldXS4JEiOJPW1FWLkhsJiDHYboV6bNewJ/omD7etbjsndAyctvdBlRlFN8kK
qbbNGCUB7UROSthh9RdiKlvwXFWgpaCP6dFpUmi+gq6Ww+6KHBj8F47Qc1+YpRxB
o8UjZaRq7vlPsM6Hmbpwlscw6Emii8X2Ybg7t0ooTCP72xWVoAS5UMsMDnXqn9Xd
hkJquUEhYhKWWktFBW3QJXK1EgT6djYlHaJte4tkGDzFUJ+96toaIfBDaFpCqo/r
xUWYHUs7IkHKgzb18MWGmmyUroFmP1iKC8KJyjI/gY8oW267Nwiw4VlfUPT/OhlU
5wgY4tWT1fwS/2wPD+bP0to8+c3hYFpx2buG4iJv3b9dEVj/fdcSAERDeb2E4tou
1ViWv6dsr4GHX3FOGdvE
=wScV
-----END PGP SIGNATURE-----

--Sig_/KABMpGKuh9_lTpn=72f49cC--
