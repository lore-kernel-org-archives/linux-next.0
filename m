Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789735;
	b=D3Kj68IApbI9bydqq+4jobP2wT52W/5f80qMuJfgMmDge59ni4w+EkMnRvZHC2VOyABH
	 wRznbEn0VzQyQeE0w13YD7Hu9RM9DNuYkyPcuiuhIx4R0XH+kHnbeqcIiiImOFeI2K+8G
	 21hEf48IkynW04ur9R3IglznMFlUz3VG7dpMOl+X44xEtd/B2nMuBfZRF0BSPy08YZE4U
	 lMKwIE8EMFdOYx+I+y5b9FpKgvIz8rgTKsKcfoju5NWfJRbbhiqk24jEjJKeDvaUyLFua
	 vQu5TN5pxjdoACZlFoeHWmVhVd+4HhW5H6WwL7R8bohz/D6DMfZBAJoqfEp9QqBCq0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789735;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=ctO9FSnU4U0seeRIMh4Nou3mn86PJ1Df6Anh/gflICk=;
	b=tr/HlV+m0PqjHbugSpjeaImmcDoBq5bNdWPI67mjAiqw8X5YELilxkFi1ocKfGuuYLdm
	 xtV11Jo0f7MP6oLAAgnZ4EakXsABlbyYsynA3P3hamT2nOgYcgfS9YHDxhE4VKvlLj5VW
	 dJzSc+QoVo6lFoRC6l5pc6zGyTeAu/pANAJ6HpaaHIkKIv/sdx7+VFfcXG4SroWYRkTjT
	 R8BT+K1/69770KG0Q2DE2cpRUhuIJRP++qE9W/ieCM4Wh9cLwGE2V0iuiFyctPzmSQI78
	 PNANpJHaf+3dIQeWHp3/zNoEQQSeVPelB6wTA2af2YN4sZxft/Ia8s60uUA9nEeT1Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DVT7qceI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DDC606A33C;
	Fri, 27 Nov 2026 14:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DVT7qceI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F42B1F00A15;
	Fri, 27 Nov 2026 14:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795789735;
	bh=ctO9FSnU4U0seeRIMh4Nou3mn86PJ1Df6Anh/gflICk=;
	h=Date:From:To:Cc:Subject;
	b=DVT7qceIrRFW7u35MRMv31uj7Qkg9FSbPK0JydPBO1tYxnsMPt+qQjW2ydcycPOAk
	 gxTkXvS62kgsPfUj0lIo/hY69qc/ll8nEHf/aOYxkj108vQL855wd3lv+s1m+BMOje
	 pNw723OIt2RbVPcIqn10osjFyqCAa9dxr6exoocsTzoTWKsk6T1p119zuWTgWg6uYv
	 8q3jN2JWXxfnZzyO0EWizQg0JgDLOoLFTN5R9OiMnt3Wv+E2z3A1xOX+lWNC4HZbfG
	 qbhGySky3KhhaTF5D/fL2y5cx4mWAjMggw5BulHtgEuViAjv/YOo+BZYvorwBUV+oy
	 X7zKkoK960CdA==
Date: Fri, 27 Nov 2026 14:28:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Miklos Szeredi <mszeredi@redhat.com>
Subject: linux-next: manual merge of the vfs-brauner tree with the fuse tree
Message-ID: <awmTozkMyM-9FEiB@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JZSvye0QZAVe47gj"
Content-Disposition: inline


--JZSvye0QZAVe47gj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  tools/testing/selftests/filesystems/fuse/.gitignore

between commit:

  0d2c729bdefe0 ("selftests/fuse: test listing directories with long names")

=66rom the fuse tree and commit:

  ddd75941c4a1b ("selftests/filesystems: test walks racing the unlink of co=
vered names")

=66rom the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc tools/testing/selftests/filesystems/fuse/.gitignore
index cd5492659ffcf,3fde4061654cf..0000000000000
--- a/tools/testing/selftests/filesystems/fuse/.gitignore
+++ b/tools/testing/selftests/filesystems/fuse/.gitignore
@@@ -6,4 -6,4 +6,5 @@@ write_extend_eof_tes
  fuse_acl_cache_test
  fuse_symlink_cache_test
  fuse_readdir_cache_test
 +fuse_readdir_long_name_test
+ unlink_reval_test

--JZSvye0QZAVe47gj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsJk6IACgkQJNaLcl1U
h9DP6Af/VYgNoaiJRMjlOSL/8UBFO8Pp91+1wl1zWhWRynMVtkbn8eslMCqWHUQq
M9/SBHmYiTx3QHgc1Unj2LyZBIW05OpqciPEckJXHTTtO7iHC6Eb5ULuYsXz26Xu
8nI6IDimy+yciJmOfzmrCgvDh0uAMjSbXatC9YS4zroiyOoMLhbW16mtBGlyjEuf
cfuv4bRzeytR/i+sOY9MkwN/A69bUZhWT77wzXs7cp6e4Q4Eh1Cqv1s8/HoOXTeY
DDRROjfPI4UpiOh3zAD84yXDM5nn25MsoTKNraYOPyr9bwPPpfLu9MGlQFcY+Z2h
kzSNF+k6dKunDeKAx+ODOUJ3TfLIrA==
=/dnG
-----END PGP SIGNATURE-----

--JZSvye0QZAVe47gj--
