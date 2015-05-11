From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the vfs tree
Date: Mon, 11 May 2015 11:26:12 +1000
Message-ID: <20150511112612.04e26c8a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/vJjDl3uwjXAJts9FSHr695q"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Uday Savagaonkar <savagaon@google.com>, Theodore Ts'o <tytso@mit.edu>
List-Id: linux-next.vger.kernel.org

--Sig_/vJjDl3uwjXAJts9FSHr695q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

After merging the vfs tree, today's linux-next build (x86_64
allmodconfig) failed like this:

fs/f2fs/namei.c: In function 'f2fs_encrypted_follow_link':
fs/f2fs/namei.c:336:10: warning: passing argument 2 of 'f2fs_follow_link' f=
rom incompatible pointer type
   return f2fs_follow_link(dentry, nd);
          ^
fs/f2fs/namei.c:311:20: note: expected 'void **' but argument is of type 's=
truct nameidata *'
 static const char *f2fs_follow_link(struct dentry *dentry, void **cookie)
                    ^
fs/f2fs/namei.c:336:3: warning: return discards 'const' qualifier from poin=
ter target type
   return f2fs_follow_link(dentry, nd);
   ^
fs/f2fs/namei.c:379:2: error: implicit declaration of function 'nd_set_link=
' [-Werror=3Dimplicit-function-declaration]
  nd_set_link(nd, paddr);
  ^
fs/f2fs/namei.c: In function 'f2fs_encrypted_put_link':
fs/f2fs/namei.c:400:3: error: implicit declaration of function 'nd_get_link=
' [-Werror=3Dimplicit-function-declaration]
   kfree(nd_get_link(nd));
   ^
fs/f2fs/namei.c:400:3: warning: passing argument 1 of 'kfree' makes pointer=
 from integer without a cast
In file included from fs/f2fs/f2fs.h:17:0,
                 from fs/f2fs/namei.c:19:
include/linux/slab.h:143:6: note: expected 'const void *' but argument is o=
f type 'int'
 void kfree(const void *);
      ^
fs/f2fs/namei.c: At top level:
fs/f2fs/namei.c:960:2: warning: initialization from incompatible pointer ty=
pe
  .follow_link    =3D f2fs_encrypted_follow_link,
  ^
fs/f2fs/namei.c:960:2: warning: (near initialization for 'f2fs_symlink_inod=
e_operations.follow_link')
fs/f2fs/namei.c:961:2: warning: initialization from incompatible pointer ty=
pe
  .put_link       =3D f2fs_encrypted_put_link,
  ^
fs/f2fs/namei.c:961:2: warning: (near initialization for 'f2fs_symlink_inod=
e_operations.put_link')

Caused by commits cf41cea5a829 ("new ->follow_link() and ->put_link()
calling conventions") and 0ad7e33ea980 ("don't pass nameidata to
->follow_link()") from teh vfs tree interacting with commit
5270e98c341b ("f2fs crypto: add symlink encryption") from the f2fs tree.

I applied the following merge fix patch (which I suspect is not
completely correct - especially the f2fs_encrypted_put_link part):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 11 May 2015 11:22:19 +1000
Subject: [PATCH] f2fs: merge fix for follow_link and put_link changes

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/f2fs/namei.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index d7ed99ebe95b..42af89cdb9a4 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -320,8 +320,8 @@ static const char *f2fs_follow_link(struct dentry *dent=
ry, void **cookie)
 }
=20
 #ifdef CONFIG_F2FS_FS_ENCRYPTION
-static void *f2fs_encrypted_follow_link(struct dentry *dentry,
-						struct nameidata *nd)
+static const char *f2fs_encrypted_follow_link(struct dentry *dentry,
+					void **cookie)
 {
 	struct page *cpage =3D NULL;
 	char *caddr, *paddr =3D NULL;
@@ -333,7 +333,7 @@ static void *f2fs_encrypted_follow_link(struct dentry *=
dentry,
 	u32 max_size =3D inode->i_sb->s_blocksize;
=20
 	if (!f2fs_encrypted_inode(inode))
-		return f2fs_follow_link(dentry, nd);
+		return f2fs_follow_link(dentry, cookie);
=20
 	res =3D f2fs_setup_fname_crypto(inode);
 	if (res)
@@ -341,7 +341,7 @@ static void *f2fs_encrypted_follow_link(struct dentry *=
dentry,
=20
 	cpage =3D read_mapping_page(inode->i_mapping, 0, NULL);
 	if (IS_ERR(cpage))
-		return cpage;
+		return ERR_CAST(cpage);
 	caddr =3D kmap(cpage);
 	caddr[size] =3D 0;
=20
@@ -376,12 +376,11 @@ static void *f2fs_encrypted_follow_link(struct dentry=
 *dentry,
 	/* Null-terminate the name */
 	if (res <=3D cstr.len)
 		paddr[res] =3D '\0';
-	nd_set_link(nd, paddr);
 	if (cpage) {
 		kunmap(cpage);
 		page_cache_release(cpage);
 	}
-	return NULL;
+	return *cookie =3D paddr;
 errout:
 	if (cpage) {
 		kunmap(cpage);
@@ -391,14 +390,11 @@ errout:
 	return ERR_PTR(res);
 }
=20
-static void f2fs_encrypted_put_link(struct dentry *dentry, struct nameidat=
a *nd,
-			  void *cookie)
+static void f2fs_encrypted_put_link(struct dentry *dentry, void *cookie)
 {
 	struct page *page =3D cookie;
=20
-	if (!page) {
-		kfree(nd_get_link(nd));
-	} else {
+	if (page) {
 		kunmap(page);
 		page_cache_release(page);
 	}
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/vJjDl3uwjXAJts9FSHr695q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVUAU5AAoJEMDTa8Ir7ZwVgjQP/1gTcUqq6rFUykba3vPrHEp9
7JKjxCL0mC1hP8Zif3wx5tkjU7EXjc7l8ePM2cGrrMoNobFdsUENwG2dTkQaxCM7
9A/MirANi3aOv2xJisduXyss8cueOpZ6v6t0AfJMiYBp9tARJ+jFXOdMIrz9Fed+
fJupgSQ8eoPhDxP1Udn8Why/3HBAYcVW3bewyLMM3kKbvPzaI0lL833N2PVzaU0D
2guCe3IGLy9dnekg21FTKbVgifBSHliu5Ot/8ojRR8cL+XD1WR7tqnDimZ87MnL2
5oLFCmiOiEEC5EKsI1xL5z9d06epPwsEUjEcvvVgY7QbE+OlPlRFqzq7VWzoZdz1
thqwsVEleEdEbrolS1WB6qxB3pgU19LB32Efj1JXnBLrwdsbUPexcx7K13W/1DJf
h0U5LbUStHgUxdZJOyST/P1ijWu1qiIHEEdZ5x+cyxaFZ69SqlVWsQQRMptYi2bK
GltgXqh7f2wXp47wt0orWJ/8fncJDACnBI9l6dI3SACeIHXdyVjgz6zNHhzHNZsl
VWkMiKhyC0RIbPGRoxBZ+CXwBpfevdlrnCY9P89fkE4YWbyLLuqlLgVUxKIDRC42
cweoADuWdbn3om7aTZ+updiaiIp1vUjuPAPT1BTeCR0yC97x8nmsFDBg9qVR+UBV
Gd0fXLrMnT0TWC5tdLlL
=FSai
-----END PGP SIGNATURE-----

--Sig_/vJjDl3uwjXAJts9FSHr695q--
