From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the security tree with the vfs tree
Date: Wed, 13 May 2015 14:39:52 +1000
Message-ID: <20150513143952.79a3b57e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/I52PgY9C=En07tCIgRhCPZj"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52883 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751065AbbEMEkD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 May 2015 00:40:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, NeilBrown <neilb@suse.de>, Casey Schaufler <casey@schaufler-ca.com>

--Sig_/I52PgY9C=En07tCIgRhCPZj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi James,

Today's linux-next merge of the security tree got a conflict in
include/linux/security.h and security/security.c between commits
37882db0546c ("SECURITY: remove nameidata arg from inode_follow_link")
and bda0be7ad994 ("security: make inode_follow_link RCU-walk aware")
from the vfs tree and commits 3c4ed7bdf599 ("LSM: Split security.h")
and 346033a28fb1 ("LSM: Remove a comment from security.h") from the
security tree.

I fixed it up (see below, plus I added the following merge fix patch)
and can carry the fix as necessary (no action is required).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 13 May 2015 14:29:17 +1000
Subject: [PATCH] LSM: merge fix for follow_link API changes

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/lsm_hooks.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index f014f2596e22..9429f054c323 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -315,7 +315,8 @@
  * @inode_follow_link:
  *	Check permission to follow a symbolic link when looking up a pathname.
  *	@dentry contains the dentry structure for the link.
- *	@nd contains the nameidata structure for the parent directory.
+ *	@inode contains the inode, which itself is not stable in RCU-walk
+ *	@rcu indicates whether we are in RCU-walk mode.
  *	Return 0 if permission is granted.
  * @inode_permission:
  *	Check permission before accessing an inode.  This hook is called by the
@@ -1397,7 +1398,8 @@ union security_list_options {
 				struct inode *new_dir,
 				struct dentry *new_dentry);
 	int (*inode_readlink)(struct dentry *dentry);
-	int (*inode_follow_link)(struct dentry *dentry, struct nameidata *nd);
+	int (*inode_follow_link)(struct dentry *dentry, struct inode *inode,
+				 bool rcu);
 	int (*inode_permission)(struct inode *inode, int mask);
 	int (*inode_setattr)(struct dentry *dentry, struct iattr *attr);
 	int (*inode_getattr)(const struct path *path);
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc security/security.c
index 04c8feca081a,bd4c5f6a5b78..000000000000
--- a/security/security.c
+++ b/security/security.c
@@@ -578,15 -586,14 +586,15 @@@ int security_inode_readlink(struct dent
  {
  	if (unlikely(IS_PRIVATE(d_backing_inode(dentry))))
  		return 0;
- 	return security_ops->inode_readlink(dentry);
+ 	return call_int_hook(inode_readlink, 0, dentry);
  }
 =20
 -int security_inode_follow_link(struct dentry *dentry, struct nameidata *n=
d)
 +int security_inode_follow_link(struct dentry *dentry, struct inode *inode,
 +			       bool rcu)
  {
 -	if (unlikely(IS_PRIVATE(d_backing_inode(dentry))))
 +	if (unlikely(IS_PRIVATE(inode)))
  		return 0;
- 	return security_ops->inode_follow_link(dentry, inode, rcu);
 -	return call_int_hook(inode_follow_link, 0, dentry, nd);
++	return call_int_hook(inode_follow_link, 0, dentry, inode, rcu);
  }
 =20
  int security_inode_permission(struct inode *inode, int mask)

--Sig_/I52PgY9C=En07tCIgRhCPZj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVUtWhAAoJEMDTa8Ir7ZwVJjcP/3eSECnz/RCrxU3uSdHmraql
IvFRSKAKmCt7fK+WNu/A9vh1DRU6dN2N93bXLW2QXhEEw9IAkKNTlJwOcZhvGgvq
VX/fkLnGeovsxGAvWl1YxF4/qYKE+ZD2tckv8cBElxgaXhKMoZ2hl9i6AuXAWK9S
y18cNJW51RxVSytIAn9cyAjWqICet+rYcvpvfdmJG/gkid+G0Vm+w1uHbuF6mPPt
XmUfhKnB4gvWjlob4rj7AyhjYaNF5B+qBddXlB9kgxtw33Flp87i87SWs+cBd2ji
vOjP3mRFzXfrbvELJVS57Jy8h0k86onznkIUkX/aPnrbBBOmOYtZ/ScNyWqCIGCq
4D+HLzeUS617s4wBqFfWOwUE+IMYYbAmKOeNkIWXxl6bNzHzq6e214Q6E4eLwHxF
JUUaGzDSivOSKuR8ckoVtTIQJf1jx8FVI9oZAbmbBnm8EBPt3AXMZROkvBQpzJ4m
0NLduNE4SD6o3366vXlgZ/tDAmV2D+Dc4ZO0Y0BexmBBFSteIYAV72B2U8RMYyHj
9FPD/0PI/qUFZDmEppMKOvJQBq2987IJaN4szzDJlhFHSsnuTOtgB3FjbjJAPRcd
PgnAYNKvPZmiOPscmR7OB6wA+I5K8n3d8zHSdYFin1fu3M1v7PrxKmiprWJB5N+E
FtVmyUVZNTVv8Gy6qU4o
=51nR
-----END PGP SIGNATURE-----

--Sig_/I52PgY9C=En07tCIgRhCPZj--
