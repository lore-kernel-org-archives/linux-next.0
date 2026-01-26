Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997F534D902;
	Mon, 26 Jan 2026 17:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769450292; cv=none; b=Q5PIZV6EraXeIfFBX82YO80ZAl8/7p+eJXXki2DnWgEPJ/BRuR61FfQI3g2zbzZvDn7LHE40TzvYNX0tRmMfopfgb2S5DFQpqeTir6OKiYAcpRUjnitAkV++Gv4lTCPaHLyLRt+Dyd4LqIRgS9j3jw6E9Q6xRf1OYu2uE8WHnU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769450292; c=relaxed/simple;
	bh=kuQG20g8zvZ5vAgg1w+mMVMd7qWXKLVSY6x84fQoFos=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y8/q1re50F2hXf5Dcit97Aq/jHg3XssYWogLiFV8Em3a7kgt8OJ5v0HnFkXnGEGyz+kV68svNakclQGX/XAHHO2rKIJVldp9bPVc5atDk1Hi+oTsN4xutYnNK62n7bX79jre1gnCPwj+WpuqVP5DUNag9GNYGyZj0pGP0cj3qg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZcIJGIkH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZcIJGIkH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E1DC116C6;
	Mon, 26 Jan 2026 17:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769450292;
	bh=kuQG20g8zvZ5vAgg1w+mMVMd7qWXKLVSY6x84fQoFos=;
	h=Date:From:To:Cc:Subject:From;
	b=ZcIJGIkHyPYQJGCDm5Cq4L3c54KQnahQcHg3FMYMCrpI9SXEimKRCKhc5t8Ls+ZLm
	 p/UcO05fDt1uezQObCWXqZFl6SYTYqoYMK7fC5cZtiD0e0U3WrBWJpWeWaT9vp/O37
	 Cg5515GDAEO+sSoyhvPs2n8LTpoKHwZyH0eAoUj080D6TEgVZXQCQxrKa7JdPYOn3h
	 YTBQiB8XnL98UrSA69klL468I3mHwvWIKlUULqKhMwqfcAuNAzNtRD63aEEfgZo7VI
	 RmTNOA0rkMsowVqETGOg6HwZlVSrDxzpG5KjtKAIJ/GKh2n3j4QB5bfmul3uVznKY4
	 yIST0dkiKTpVw==
Date: Mon, 26 Jan 2026 17:58:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	=?iso-8859-1?Q?Lo=EFc?= Molinari <loic.molinari@collabora.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: linux-next: manual merge of the drm tree with the mm-unstable tree
Message-ID: <aXerLzIbpMy9d4lx@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1eFnNaNa6x8oeO9X"
Content-Disposition: inline


--1eFnNaNa6x8oeO9X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/gem/i915_gem_shmem.c

between commit:

  0c21ec1416a33 ("mm: update shmem_[kernel]_file_*() functions to use vma_f=
lags_t")

=66rom the mm-unstable tree and commit:

  a8a9a590221c1 ("drm/i915: Use huge tmpfs mountpoint helpers")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index fe1843497b27d,6ad1d6f99363e..0000000000000
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@@ -494,9 -496,11 +496,11 @@@ const struct drm_i915_gem_object_ops i9
 =20
  static int __create_shmem(struct drm_i915_private *i915,
  			  struct drm_gem_object *obj,
- 			  resource_size_t size)
+ 			  resource_size_t size,
+ 			  unsigned int flags)
  {
- 	const vma_flags_t flags =3D mk_vma_flags(VMA_NORESERVE_BIT);
 -	unsigned long shmem_flags =3D VM_NORESERVE;
++	const vma_flags_t shmem_flags =3D mk_vma_flags(VMA_NORESERVE_BIT);
+ 	struct vfsmount *huge_mnt;
  	struct file *filp;
 =20
  	drm_gem_private_object_init(&i915->drm, obj, size);

--1eFnNaNa6x8oeO9X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml3qy4ACgkQJNaLcl1U
h9ACgAf/VRMmmY0iN/iFkpxw/bHJPUPV20kF7BeELc1R2cRNJ6Yu8t3LAHatkbm0
VljYl/3OOgvd2U3npfpxd8DBngWRQ2o7M5yjOm/u5VNBWhWXgGBg0huXQDaZFM3m
taf+9S40UnxhGwsF0SynJ/F/0+gxflqRfcdork/srOzWQG6tOdV/chMGSmogSq03
MbqkSxuitXyb4EyFx5VN0tuAkOQQaD4HGX1TYupsBn5aedz444bJ9i6ahk2uNymi
XUxndnzogDUXlV5L3GVeKcnaM6EL31tC+dmp0rFzTL6Ln+mXt+feTGb4DP3nfEvY
I/Q92Ub5c1i6pBPRhc9hnIhtNZr2Cw==
=oFVz
-----END PGP SIGNATURE-----

--1eFnNaNa6x8oeO9X--
