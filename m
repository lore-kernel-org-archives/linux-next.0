From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the vfs tree
Date: Mon, 13 Apr 2015 21:10:09 +1000
Message-ID: <20150413211009.2fb2a23a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/sRM+O1x/mBNRBtPQGQN3swU"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50333 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753357AbbDMLKP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Apr 2015 07:10:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>, Fabian Frederick <fabf@skynet.be>

--Sig_/sRM+O1x/mBNRBtPQGQN3swU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in
fs/hfsplus/xattr.h between commit 5dd3dc06371a ("VFS: normal
filesystems (and lustre): d_inode() annotations") from the vfs tree and
commits 2c14e8b354bd ("fs/hfsplus: move xattr_name allocation in
hfsplus_getxattr()") and a88c4defbd2e ("fs/hfsplus: move xattr_name
allocation in hfsplus_setxattr()") from the akpm-current tree.

I fixed it up (the code was moved by the latter, so I applied this
merge fix patch) and can carry the fix as necessary (no action is
required).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 13 Apr 2015 21:07:48 +1000
Subject: [PATCH] fs/hfsplus: merge fix for d_inode() annotation

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/hfsplus/xattr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/hfsplus/xattr.c b/fs/hfsplus/xattr.c
index 8c8f2cbe533a..416b1dbafe51 100644
--- a/fs/hfsplus/xattr.c
+++ b/fs/hfsplus/xattr.c
@@ -440,7 +440,7 @@ int hfsplus_setxattr(struct dentry *dentry, const char =
*name,
 		return -ENOMEM;
 	strcpy(xattr_name, prefix);
 	strcpy(xattr_name + prefixlen, name);
-	res =3D __hfsplus_setxattr(dentry->d_inode, xattr_name, value, size,
+	res =3D __hfsplus_setxattr(d_inode(dentry), xattr_name, value, size,
 				 flags);
 	kfree(xattr_name);
 	return res;
@@ -600,7 +600,7 @@ ssize_t hfsplus_getxattr(struct dentry *dentry, const c=
har *name,
 	strcpy(xattr_name, prefix);
 	strcpy(xattr_name + prefixlen, name);
=20
-	res =3D __hfsplus_getxattr(dentry->d_inode, xattr_name, value, size);
+	res =3D __hfsplus_getxattr(d_inode(dentry), xattr_name, value, size);
 	kfree(xattr_name);
 	return res;
=20
@@ -868,7 +868,7 @@ static int hfsplus_osx_getxattr(struct dentry *dentry, =
const char *name,
 	 * creates), so we pass the name through unmodified (after
 	 * ensuring it doesn't conflict with another namespace).
 	 */
-	return __hfsplus_getxattr(dentry->d_inode, name, buffer, size);
+	return __hfsplus_getxattr(d_inode(dentry), name, buffer, size);
 }
=20
 static int hfsplus_osx_setxattr(struct dentry *dentry, const char *name,
@@ -890,7 +890,7 @@ static int hfsplus_osx_setxattr(struct dentry *dentry, =
const char *name,
 	 * creates), so we pass the name through unmodified (after
 	 * ensuring it doesn't conflict with another namespace).
 	 */
-	return __hfsplus_setxattr(dentry->d_inode, name, buffer, size, flags);
+	return __hfsplus_setxattr(d_inode(dentry), name, buffer, size, flags);
 }
=20
 static size_t hfsplus_osx_listxattr(struct dentry *dentry, char *list,
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/sRM+O1x/mBNRBtPQGQN3swU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVK6QVAAoJEMDTa8Ir7ZwVdvUP/itwSYspmkr4ewenokZUQpD3
zV/3zXWOqwezQGvkDknjS1GlhQlKyoH7KIJk4+cKTOFdq/nMQa2vMJ3hyo3XpdQz
qGZaqZWiT9r3vcXN9M+Nj3Dw1S4IvAJrEE090sUGL3YCHtlnU3xqYpwPIrRmFoQG
/A72jRIRfyqbV2B6iJ/bT+JJpKNKX4wCGQCfxQWmifJqWTxNm2yEpJ2KSjl/53ui
fI3SNEZiIRiuaSzqL3IL3FurVEwf2XLqpY1i9RG36mQMkijq+bAakDKBdWYwcR5n
TrDm7M6gjD1pwWdi8U5QsKzxONxpmcaUjsDf6rKeAkhgBL6MUab5vWBov1dLUrr8
lU+cLLijy3ex1qbwJyY900ewMbVs/kkZ3ChoszwTPmRzHeXzkOQ5BPxCfnuJ733D
CLdoPh6PeAmYzT6E83G1bO5lanUiyKpv99OkWHwQ6RUK2XVCHLMFJlA67Aq/zVuw
jOnIsau+ScJoii93/mx6gdUGXcWSceC1u6L+dZ9/m93+SfWeCxfW51W+gm3B10rp
nMDgqCDXI7x/sPmtmV2KnbxrA2KDBeMtpazFOB36iG6l3dbgyZic0AMsrHZpmxbM
nZYMDGOR852uFsgAEgOde0VYlolZTz5d9tL7339snoSfIijifveDQxjTOAN4EfcW
MXkJNnQ2u30K4tX7kbXV
=RkPK
-----END PGP SIGNATURE-----

--Sig_/sRM+O1x/mBNRBtPQGQN3swU--
