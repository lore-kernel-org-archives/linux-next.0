Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576073911CE;
	Fri, 12 Jun 2026 17:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781284653; cv=none; b=I5kjsd61WF2JrGQP3LpHWy3PDq6nd96WvH/sjcymoA6Is3rIOASUTihcdw67b9+Z7jk3vRIFbO/wiA2y0gWwqNDOq9q4xnuyeLHWN9EtuydA2r4cdm08T+9j9i1TnJ2y7CWuSFpcaH2WQlY9IK8reB70DLWlAHMgmsl79akQ1f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781284653; c=relaxed/simple;
	bh=7xFRORub6kTUWP2FYMXQ4PGc3x+rsxlqGG1er3qj5t4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AfwGre84d6Omt1G/lSjt2/QDyfgzjHmofD5kplEqqE5NolMcrWCZsNKVKSPxvFalOTsW7YkrOkTl3kVlYKjlErhWLS41K1rB9faU/jgRF/JeYLvHpXBiXl69EhXiUzSOfjGevJurS/DJQQQu0GYJhgUtonsqjh27vNInlQgRlr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ng9N4Snw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ng9N4Snw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54391F000E9;
	Fri, 12 Jun 2026 17:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781284652;
	bh=KHC4yNHz54liyfO8bs0C5suSNUKKs3Q36O0t5KuWwOY=;
	h=Date:From:To:Cc:Subject;
	b=ng9N4Snw0I2IHKTzv2aqmpr2a5TfRp6RPHKnyWZ4m651UIkEj92buRF16/6LFObCr
	 uPr/rLPOqfAqsoRStsdBMoicrCcyNMb/lgBjBfOwjgA8iKfiihlNY0alHcHfq/O9QH
	 G9eLzm8b3SejPNhOvPagC0fvL0BsBcqDA4dpnT1UlMA+A7+NYXSRtLqQiArjE1Y0X5
	 j2iATNy42pTZ8mD/tcy9AkYeq2cbj+FmQVYaQeD9cBWSZdYL/oa7n65dvaoRYuRIbQ
	 O590cMZWm7wYSAtfivGDkVcZENh7c0MKRnqVRz8mVWhNOAP/aIbdwyJ7u35SWFcZHs
	 D5m9OsgyfxFkg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 7C8C51AC5AC2; Fri, 12 Jun 2026 18:17:29 +0100 (BST)
Date: Fri, 12 Jun 2026 18:17:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>,
	Davide Ornaghi <d.ornaghi97@gmail.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Steve French <stfrench@microsoft.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <aiw_KQMAFMIVSFL0@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OXdxvoYmVI3MsSFU"
Content-Disposition: inline


--OXdxvoYmVI3MsSFU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/fs/smb/server/vfs.c:1255:30: error: too many arguments to f=
unction call, expected 5, have 6
 1254 |         err =3D vfs_path_parent_lookup(filename, flags | LOOKUP_BEN=
EATH,
      |               ~~~~~~~~~~~~~~~~~~~~~~
 1255 |                                      path, &last, &type, &share_con=
f->vfs_path);
      |                                                          ^~~~~~~~~~=
~~~~~~~~~~~
/tmp/next/build/include/linux/namei.h:63:5: note: 'vfs_path_parent_lookup' =
declared here
   63 | int vfs_path_parent_lookup(struct filename *filename, unsigned int =
flags,
      |     ^                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   64 |                            struct path *parent, struct qstr *last,
      |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   65 |                            const struct path *root);
      |                            ~~~~~~~~~~~~~~~~~~~~~~~
1 error generated.

Caused by commit

   f2f1dddccae50f (vfs: make LAST_XXX private to fs/namei.c)

interacting with commit

   9b012f13c6b671 (ksmbd: fix path resolution in ksmbd_vfs_kern_path_create)

=66rom the ksmbd tree.  I have fixed this up as below and can carry as
needed:

diff --git a/fs/smb/server/vfs.c b/fs/smb/server/vfs.c
index da0dbf2209d28b..7e4fffc88dbd75 100644
--- a/fs/smb/server/vfs.c
+++ b/fs/smb/server/vfs.c
@@ -1246,13 +1246,13 @@ struct dentry *ksmbd_vfs_kern_path_create(struct ks=
mbd_work *work,
 	struct ksmbd_share_config *share_conf =3D work->tcon->share_conf;
 	struct qstr last;
 	struct dentry *dent;
-	int type, err;
+	int err;
=20
 	/* resolve the name beneath the share root so ".." cannot escape */
 	CLASS(filename_kernel, filename)(name);
=20
 	err =3D vfs_path_parent_lookup(filename, flags | LOOKUP_BENEATH,
-				     path, &last, &type, &share_conf->vfs_path);
+				     path, &last, &share_conf->vfs_path);
 	if (err)
 		return ERR_PTR(err);
=20

--OXdxvoYmVI3MsSFU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmosPygACgkQJNaLcl1U
h9DsuwgAgoTl59vtSGVPJJccGPQM6Hb6b0iwlJoMEDwY3KSOpNWpAbfa0NmulUXN
EooiYwQCL5pAQiyFiEMoBkiGR8HGMMx1ZBGmysHTa3/5Z9T7Ek6thzjnI4QfpF9m
cZD9pKWzC9sPifkcmeNfWKsB7lH0idtLrWkLpKAGxXC/oHjflFt2M+Xq6PgOUyYF
WEBaSD+A/jA/Jc5m0LMLZO8Tp1ejrpST3/jFqkfHQM54lF3Bs5CVQhduIzMPCzsR
+j0UhFWZCGAS/stdmAtgZ0r4/8OxUr3nm9bi3DmzmQ0dkbBJ1SmmugwgSu9elkgb
FjFlOHPbPc6blfiE+6Awv1BnXdOpLQ==
=KMUi
-----END PGP SIGNATURE-----

--OXdxvoYmVI3MsSFU--
