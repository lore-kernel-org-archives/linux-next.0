From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the vfs tree
Date: Mon, 13 Apr 2015 21:00:55 +1000
Message-ID: <20150413210055.42eeecd5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Gyoe1ygXaqOro/0gXzTAUs3"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57586 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753549AbbDMLBB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Apr 2015 07:01:01 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>, Fabian Frederick <fabf@skynet.be>

--Sig_/Gyoe1ygXaqOro/0gXzTAUs3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in
fs/befs/linuxvfs.c between commit 5dd3dc06371a ("VFS: normal
filesystems (and lustre): d_inode() annotations") from the vfs tree and
commit badfbaf2a80c ("befs: replace typedef befs_inode_info by
structure") from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/befs/linuxvfs.c
index d3cb8774765f,16e0a48bfccd..000000000000
--- a/fs/befs/linuxvfs.c
+++ b/fs/befs/linuxvfs.c
@@@ -472,7 -471,7 +471,7 @@@ static void=20
  befs_follow_link(struct dentry *dentry, struct nameidata *nd)
  {
  	struct super_block *sb =3D dentry->d_sb;
- 	befs_inode_info *befs_ino =3D BEFS_I(d_inode(dentry));
 -	struct befs_inode_info *befs_ino =3D BEFS_I(dentry->d_inode);
++	struct befs_inode_info *befs_ino =3D BEFS_I(d_inode(dentry));
  	befs_data_stream *data =3D &befs_ino->i_data.ds;
  	befs_off_t len =3D data->size;
  	char *link;
@@@ -502,7 -501,8 +501,8 @@@
  static void *
  befs_fast_follow_link(struct dentry *dentry, struct nameidata *nd)
  {
- 	befs_inode_info *befs_ino =3D BEFS_I(d_inode(dentry));
 -	struct befs_inode_info *befs_ino =3D BEFS_I(dentry->d_inode);
++	struct befs_inode_info *befs_ino =3D BEFS_I(d_inode(dentry));
+=20
  	nd_set_link(nd, befs_ino->i_data.symlink);
  	return NULL;
  }

--Sig_/Gyoe1ygXaqOro/0gXzTAUs3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVK6HrAAoJEMDTa8Ir7ZwVZQgP/2pZL0NTPt3WuquCX7clAMF9
Y0zr661c0c7OVlZeihnLqzEqqRVFWxIlPHzwY+X6PcRSDeeNL8VifGlW4ZAcodMJ
deRiw9xiawIDqpWlBsu/MXq5Ef0Q12OybX5BXUKyqa7DgTS+Gm7W7+mLSSTG+mhv
JEQYuWR3f+MHTQKO60HacZT4wSqFPsjymUikMzYwd9DoLrYyt6C+dT4+KfeFRZOB
XYy01gFmnIQZh/dtxanHS9aKYsACPj6Pl47TkTDrI4+LxLfA2IjuPpv1uLNQmaLw
KENjEVDwdvnOWxIr0OZuZVBxHHJLmUsMM1eIreYR7beC2HchmiraS48UHNQxcOzU
Oozbtp7QP7Vs+yYj054CV+zwAwsgYTHLQRc/00bCqJLZdgPoyVQVKFJKrUY/5KMZ
lqI3z+UjsGPBAi7GBi1oi2KVucvqxDUrb3TPZqRPoFvys+lHFPWf3ffOC/eY1qJf
FosKhcEyjpkcq3ckAejYEkFvsj+kUavAO6fvjzGIinBWL6hnr50c/pgRFx0S76P/
oz7l6yrKGQgFRu4Tkq6PMuADtOK8ADv8snH5G6W92LcOWVt8q7FGsLh9XmUWGFgx
Y7MxXJtFTb1eoA35d7TJc3QGQ8Vy+UWqVctP2IseLsJAH5Qqdg6vBYYc/EwRYAAa
4QreK0EHp8CRg8RO2QPA
=3wlr
-----END PGP SIGNATURE-----

--Sig_/Gyoe1ygXaqOro/0gXzTAUs3--
