From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the xfs tree
Date: Tue, 14 Apr 2015 11:34:42 +1000
Message-ID: <20150414113442.62751cdc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/5O+aYlm=1mAzyMbqBYGBoKU"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43214 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751768AbbDNBes (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Apr 2015 21:34:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, Ben Myers <bpm@sgi.com>, David Chinner <david@fromorbit.com>, xfs@oss.sgi.com
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, David Howells <dhowells@redhat.com>

--Sig_/5O+aYlm=1mAzyMbqBYGBoKU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in
fs/xfs/xfs_iops.c between commit 21c3ea18819b ("xfs: unlock i_mutex in
xfs_break_layouts") from the xfs tree and commit 5dd3dc06371a ("VFS:
normal filesystems (and lustre): d_inode() annotations") from the vfs
tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/xfs/xfs_iops.c
index 2f1839e4dd1b,54b95232d946..000000000000
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@@ -953,13 -975,9 +953,13 @@@ xfs_vn_setattr
  		uint		iolock =3D XFS_IOLOCK_EXCL;
 =20
  		xfs_ilock(ip, iolock);
- 		error =3D xfs_break_layouts(dentry->d_inode, &iolock, true);
 -		error =3D xfs_break_layouts(d_inode(dentry), &iolock);
 -		if (!error)
++		error =3D xfs_break_layouts(d_inode(dentry), &iolock, true);
 +		if (!error) {
 +			xfs_ilock(ip, XFS_MMAPLOCK_EXCL);
 +			iolock |=3D XFS_MMAPLOCK_EXCL;
 +
  			error =3D xfs_setattr_size(ip, iattr);
 +		}
  		xfs_iunlock(ip, iolock);
  	} else {
  		error =3D xfs_setattr_nonsize(ip, iattr, 0);

--Sig_/5O+aYlm=1mAzyMbqBYGBoKU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVLG63AAoJEMDTa8Ir7ZwVpLYP/3Sag0Zfim2NG4Ls84f8xR7b
uv4FNLtmXMXAW3ioV8H2d4qvT80esCti3mTmdioUzvt6WuXPO9DN/QRoWb3olXfb
sQ4NXn0PJt7cxH+GT98+DhUuwy3VJrm87jUECYoMXGu3nl6t42W9F1UxShW9a36l
vv5HDqyNrR6MdJVy/b6h5mO6qY4t3cmnS5PQvklVz7/4/S9TiC/jdK63PwPzZ5Wt
n4R9LDXiWbtmG9YGaNcDb9mpn5XzJsa5NYQWTz8LofUik50T6+nEqIPxrj9Mv7ae
S9hZN/JZkXtTIEJ4IENej4Qh9akQI19Fxtq251MUOXyIp4J7V8JM8p3zzi99fbIL
MCDpzAbC4S6H+enPp3yKtxwYdjpUZkvVkU6eLCTdQSVNlvvuMCyMZYSpthsmByWn
IfnsnEa7Y1Lb5yBOaqgpKuVBrRx69Ov564asTGG2TiarwhrLusZ/0ky/8sshyTy0
NdrUCCzbEJl955oDqbinbVfPZj6zns0lKFeZiEtNVfQ9NBRDhWkcqcr7EkCQ0Wnm
xucyzesO6XY5ViB5jy5f8TNdmZ/ziO5oBJOiXE9yHKi9X/ixo2bq3xJAqBaNt3+g
yaWDeLuWu4wSnIES4W7dqQmdubqFIGrOOn6NVHqBXe+Vv1imaL7h4PumcO1lHIxA
4ZwIx4wasd/O2LglavGf
=amIj
-----END PGP SIGNATURE-----

--Sig_/5O+aYlm=1mAzyMbqBYGBoKU--
