From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Wed, 13 May 2015 12:26:42 +1000
Message-ID: <20150513122642.6fd7e7b0@canb.auug.org.au>
References: <20150511112612.04e26c8a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/VmG.UM.W0Bh4t60I26.jlYZ"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55373 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933877AbbEMC0v (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 May 2015 22:26:51 -0400
In-Reply-To: <20150511112612.04e26c8a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Uday Savagaonkar <savagaon@google.com>, Theodore Ts'o <tytso@mit.edu>

--Sig_/VmG.UM.W0Bh4t60I26.jlYZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 11 May 2015 11:26:12 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the vfs tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> fs/f2fs/namei.c: In function 'f2fs_encrypted_follow_link':
> fs/f2fs/namei.c:336:10: warning: passing argument 2 of 'f2fs_follow_link'=
 from incompatible pointer type
>    return f2fs_follow_link(dentry, nd);
>           ^
> fs/f2fs/namei.c:311:20: note: expected 'void **' but argument is of type =
'struct nameidata *'
>  static const char *f2fs_follow_link(struct dentry *dentry, void **cookie)
>                     ^
> fs/f2fs/namei.c:336:3: warning: return discards 'const' qualifier from po=
inter target type
>    return f2fs_follow_link(dentry, nd);
>    ^
> fs/f2fs/namei.c:379:2: error: implicit declaration of function 'nd_set_li=
nk' [-Werror=3Dimplicit-function-declaration]
>   nd_set_link(nd, paddr);
>   ^
> fs/f2fs/namei.c: In function 'f2fs_encrypted_put_link':
> fs/f2fs/namei.c:400:3: error: implicit declaration of function 'nd_get_li=
nk' [-Werror=3Dimplicit-function-declaration]
>    kfree(nd_get_link(nd));
>    ^
> fs/f2fs/namei.c:400:3: warning: passing argument 1 of 'kfree' makes point=
er from integer without a cast
> In file included from fs/f2fs/f2fs.h:17:0,
>                  from fs/f2fs/namei.c:19:
> include/linux/slab.h:143:6: note: expected 'const void *' but argument is=
 of type 'int'
>  void kfree(const void *);
>       ^
> fs/f2fs/namei.c: At top level:
> fs/f2fs/namei.c:960:2: warning: initialization from incompatible pointer =
type
>   .follow_link    =3D f2fs_encrypted_follow_link,
>   ^
> fs/f2fs/namei.c:960:2: warning: (near initialization for 'f2fs_symlink_in=
ode_operations.follow_link')
> fs/f2fs/namei.c:961:2: warning: initialization from incompatible pointer =
type
>   .put_link       =3D f2fs_encrypted_put_link,
>   ^
> fs/f2fs/namei.c:961:2: warning: (near initialization for 'f2fs_symlink_in=
ode_operations.put_link')
>=20
> Caused by commits cf41cea5a829 ("new ->follow_link() and ->put_link()
> calling conventions") and 0ad7e33ea980 ("don't pass nameidata to
> ->follow_link()") from teh vfs tree interacting with commit
> 5270e98c341b ("f2fs crypto: add symlink encryption") from the f2fs tree.
>=20
> I applied the following merge fix patch (which I suspect is not
> completely correct - especially the f2fs_encrypted_put_link part):
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 11 May 2015 11:22:19 +1000
> Subject: [PATCH] f2fs: merge fix for follow_link and put_link changes
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/f2fs/namei.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
>=20
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index d7ed99ebe95b..42af89cdb9a4 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -320,8 +320,8 @@ static const char *f2fs_follow_link(struct dentry *de=
ntry, void **cookie)
>  }
> =20
>  #ifdef CONFIG_F2FS_FS_ENCRYPTION
> -static void *f2fs_encrypted_follow_link(struct dentry *dentry,
> -						struct nameidata *nd)
> +static const char *f2fs_encrypted_follow_link(struct dentry *dentry,
> +					void **cookie)
>  {
>  	struct page *cpage =3D NULL;
>  	char *caddr, *paddr =3D NULL;
> @@ -333,7 +333,7 @@ static void *f2fs_encrypted_follow_link(struct dentry=
 *dentry,
>  	u32 max_size =3D inode->i_sb->s_blocksize;
> =20
>  	if (!f2fs_encrypted_inode(inode))
> -		return f2fs_follow_link(dentry, nd);
> +		return f2fs_follow_link(dentry, cookie);
> =20
>  	res =3D f2fs_setup_fname_crypto(inode);
>  	if (res)
> @@ -341,7 +341,7 @@ static void *f2fs_encrypted_follow_link(struct dentry=
 *dentry,
> =20
>  	cpage =3D read_mapping_page(inode->i_mapping, 0, NULL);
>  	if (IS_ERR(cpage))
> -		return cpage;
> +		return ERR_CAST(cpage);
>  	caddr =3D kmap(cpage);
>  	caddr[size] =3D 0;
> =20
> @@ -376,12 +376,11 @@ static void *f2fs_encrypted_follow_link(struct dent=
ry *dentry,
>  	/* Null-terminate the name */
>  	if (res <=3D cstr.len)
>  		paddr[res] =3D '\0';
> -	nd_set_link(nd, paddr);
>  	if (cpage) {
>  		kunmap(cpage);
>  		page_cache_release(cpage);
>  	}
> -	return NULL;
> +	return *cookie =3D paddr;
>  errout:
>  	if (cpage) {
>  		kunmap(cpage);
> @@ -391,14 +390,11 @@ errout:
>  	return ERR_PTR(res);
>  }
> =20
> -static void f2fs_encrypted_put_link(struct dentry *dentry, struct nameid=
ata *nd,
> -			  void *cookie)
> +static void f2fs_encrypted_put_link(struct dentry *dentry, void *cookie)
>  {
>  	struct page *page =3D cookie;
> =20
> -	if (!page) {
> -		kfree(nd_get_link(nd));
> -	} else {
> +	if (page) {
>  		kunmap(page);
>  		page_cache_release(page);
>  	}
> --=20
> 2.1.4

This merge fix patch is now:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 13 May 2015 11:03:18 +1000
Subject: [PATCH] f2fs: merge fix for follow_link changes

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/f2fs/namei.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index d58df3630b9c..9f7adba1893b 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -859,8 +859,8 @@ out:
 }
=20
 #ifdef CONFIG_F2FS_FS_ENCRYPTION
-static void *f2fs_encrypted_follow_link(struct dentry *dentry,
-						struct nameidata *nd)
+static const char *f2fs_encrypted_follow_link(struct dentry *dentry,
+						void **cookie)
 {
 	struct page *cpage =3D NULL;
 	char *caddr, *paddr =3D NULL;
@@ -878,7 +878,7 @@ static void *f2fs_encrypted_follow_link(struct dentry *=
dentry,
=20
 	cpage =3D read_mapping_page(inode->i_mapping, 0, NULL);
 	if (IS_ERR(cpage))
-		return cpage;
+		return ERR_CAST(cpage);
 	caddr =3D kmap(cpage);
 	caddr[size] =3D 0;
=20
@@ -912,11 +912,10 @@ static void *f2fs_encrypted_follow_link(struct dentry=
 *dentry,
 	/* Null-terminate the name */
 	if (res <=3D cstr.len)
 		paddr[res] =3D '\0';
-	nd_set_link(nd, paddr);
=20
 	kunmap(cpage);
 	page_cache_release(cpage);
-	return NULL;
+	return *cookie =3D paddr;
 errout:
 	f2fs_fname_crypto_free_buffer(&pstr);
 	kunmap(cpage);
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/VmG.UM.W0Bh4t60I26.jlYZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVUrZnAAoJEMDTa8Ir7ZwVZvUQAIH8NWtSGQxa/kvkdUmXoSV5
3+4hPelPxMsYu5AEV0tQvP/R0aDN0U3zMA5SjM46gsK8uFOpnofMtjySNULAHyUH
BXYC2qo3/LOmptCxYMUAhCpiNoOM6+GHRIfQMLwGjNS/+0vdxjrcd3vOxEXkJ92x
AJngeQw9hmz/qrKRPwHb078QyGaPfWzhHS8iUQnW/awcW2hutJ3UnOys485TjTyO
MGRlaRcHjGuTcZ4KYsjZ2YLaGvnRBWYFXnic+npw7C8USw0t6VESmOk5ksQbktWC
DNKDPl8D6CEMRg27JGJP4f50M69rZGSmjGRaY/JbnteeagzNOGSLdHsZ931L/Y6B
FYyu+reoLpcE1syhVhlVE5lcoYMco+FbqIvgoFxr3HgaxZTQ2+k1SYatyTi0nVtB
0ixdEDqxoTXgywbLuy1JZKCvX8J92uXhcZAEuzN1EpIbPUvRLIveENafCi+uCLOm
QW2SAK7MdNp/Ti7RfsS+FSgbmOzuBlF0h+ReJGPXlEqkh98uppc55jgAOqc46oz1
e/1PTBJShq+BZIX+jyr78mq9TBuViXCod66/bzbK2cb4b9cywnHGiwm/RV018lmQ
gnjXpkcGzpyj6oPM2j+sEdCgQdG27WVqIL5t4weE4GRYmZCx812LkFu0e328zajQ
sJAmm8ty9m03tsy0ZcQP
=/iO4
-----END PGP SIGNATURE-----

--Sig_/VmG.UM.W0Bh4t60I26.jlYZ--
