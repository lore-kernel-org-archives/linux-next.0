From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the ext4 tree
Date: Mon, 11 May 2015 10:49:51 +1000
Message-ID: <20150511104951.4938f794@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/gfM=M9EUUhTwOueuRjBZK5V"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49062 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751854AbbEKAuB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 10 May 2015 20:50:01 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, Theodore Ts'o <tytso@mit.edu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/gfM=M9EUUhTwOueuRjBZK5V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in
fs/ext4/symlink.c between commit fd64e6fd4575 ("ext4 crypto: reorganize
how we store keys in the inode") from the ext4 tree and commits
5542f03602af ("ext4: split inode_operations for encrypted symlinks off
the rest") and cf41cea5a829 ("new ->follow_link() and ->put_link()
calling conventions") from the vfs tree.

I fixed it up (I think - see below) and can carry the fix as necessary
(no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/ext4/symlink.c
index 32870881188e,ba5bd18a9825..000000000000
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
 +	res =3D ext4_setup_fname_crypto(inode);
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

--Sig_/gfM=M9EUUhTwOueuRjBZK5V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVT/y1AAoJEMDTa8Ir7ZwVdSgP/3p/SlNsfRj0HpJgIiXaiCvd
XRjES5/h/2uuB1ujF2k0BM/8Jac4C90o2A2mpdqPz8gnArmZPqxpo77FAQijLaCc
/g4tQHvfPQKwpbCPBndkrXKqwTahME28lNXI4rke0dUiboiZNrMjRtp/9z5be7sY
B3wirRJt1W/xljldeRpwoBXfODHZyIkKH230Sut+I6/3ZBDhBze+PeHSDP+mFMkc
9bn1QT15MqNlFty9ms0DDue7DAK1qSmpjUSwXX3ixLYZe2sshEQ5RWzK9u4V2zg1
NtW9eu3bADz25vG+3Pt9XvNbPWagUOtWu2gUgzMbe79qe/WF6MaWVGuprms77JeE
Rw9wQqXxqZqk2iH/40UIonegXPjSNEKKdA8bD0ruiCtZ24BzZgWmaXbAacCPeb6/
wosEPcrq/TvtSm9UCCT/q/UQIaPioBJtcexjvTHWLJacqKZhcISc9tVyPmiwecdD
LNTqfbHKUMwheNqbh9fWiKIHnZPEIWxWK/19Es1PaWM//1dsZ18eXMA/RlCXO9DG
AyUz4YkyCm+QcEbLsdP9YkhXS5v2AY++skdynBL+ynVE15KExM/vdS+ti+2FMopc
SpuZuym34FY1ZZ6ZVxT8X1I5p7V180lj9GdYBrowwXwp77hEsRnHorP94Q0cz+Zj
R05zp3nWYn7rMgm5Qaam
=8jq8
-----END PGP SIGNATURE-----

--Sig_/gfM=M9EUUhTwOueuRjBZK5V--
