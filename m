Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB451E834B;
	Mon, 23 Feb 2026 13:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771853719; cv=none; b=iXgat9Nvd/nfzwbYbdTgxJXV07p1KE/2CjzJHqSFq0eV46hvxr6mv+PsO8SXIrppYwweSeevfdABVrdAX18lsT5chBNv1868Tp+f0h2yFxgNttOUNgA/UKR+riitOF+H2z6HDHLTI35a3DQEmQmX90qsvCzAK1kLWAFzcSai03A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771853719; c=relaxed/simple;
	bh=8u9ds5fqNJrRhe3s51z54/M0BIl2FP4xRR5tCzH0FiY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vGucgwe97szFa9/rsLP8JR5s0Yz0Mrfgb3KBlV3B9etT4pUehbnE8kBYzS5WtVv29fbdESuAJuPO9EQP+mQC6zFMyiZUhRuJLMbDlusk02OSZk92+6GtlSqxX6zyj0A2fn3S9Lo14B7euUQPijHbSH8RXfa3VcqkToItOvlOqwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fmn+x16e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fmn+x16e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A1E0C116C6;
	Mon, 23 Feb 2026 13:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771853718;
	bh=8u9ds5fqNJrRhe3s51z54/M0BIl2FP4xRR5tCzH0FiY=;
	h=Date:From:To:Cc:Subject:From;
	b=Fmn+x16eoq9zj6AVKUbggFRHaSyLaKu83h9Nx13Je9ghWDElz6XdgvLBviYblIhCh
	 CfVeWQMX6BIV5fZqNuQednWJNKc1dzqe/fdS03je8tkWkTNDtf/Au8y7W3WCnW0+CK
	 rJbNb7r8MkjZG+IWDdOSiDTd6OuVLJotPpI5PSCPFAx1hSOu19sgXBRnLLhwdru8he
	 rFLXXZFHlHOdMAINuGBneZzgqdv4zS8huS1wkXmlqwsDkvsaRpYKGIcJupYy1PCFkL
	 5mEPhOPZCRdIB0IlSZ+6RCV7osg3z3FSqlNP3ivyjHF9Jt/Q9Bl52yBuffs5Pyl+ki
	 IRnGqn+H+jJNA==
Date: Mon, 23 Feb 2026 13:35:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Dave Airlie <airlied@redhat.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matthew Auld <matthew.auld@intel.com>,
	Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the drm-misc tree
Message-ID: <aZxXktNIJQ192N4a@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="it5+89qN7EPvYTzh"
Content-Disposition: inline


--it5+89qN7EPvYTzh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c

between commit:

  ba110db8e1bc2 ("gpu: Move DRM buddy allocator one level up (part two)")

=66rom the drm-misc tree and commit:

  dc2fc00ba94de ("drm/xe: Use DRM_BUDDY_CONTIGUOUS_ALLOCATION for contiguou=
s allocations")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 2c44aa4b5562b,d6aa61e55f4d7..0000000000000
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@@ -80,10 -79,13 +80,13 @@@ static int xe_ttm_vram_mgr_new(struct t
  	INIT_LIST_HEAD(&vres->blocks);
 =20
  	if (place->flags & TTM_PL_FLAG_TOPDOWN)
 -		vres->flags |=3D DRM_BUDDY_TOPDOWN_ALLOCATION;
 +		vres->flags |=3D GPU_BUDDY_TOPDOWN_ALLOCATION;
 =20
+ 	if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
+ 		vres->flags |=3D DRM_BUDDY_CONTIGUOUS_ALLOCATION;
+=20
  	if (place->fpfn || lpfn !=3D man->size >> PAGE_SHIFT)
 -		vres->flags |=3D DRM_BUDDY_RANGE_ALLOCATION;
 +		vres->flags |=3D GPU_BUDDY_RANGE_ALLOCATION;
 =20
  	if (WARN_ON(!vres->base.size)) {
  		err =3D -EINVAL;
@@@ -111,15 -113,7 +114,7 @@@
  		goto error_unlock;
  	}
 =20
- 	if (place->fpfn + (size >> PAGE_SHIFT) !=3D lpfn &&
- 	    place->flags & TTM_PL_FLAG_CONTIGUOUS) {
- 		size =3D roundup_pow_of_two(size);
- 		min_page_size =3D size;
-=20
- 		lpfn =3D max_t(unsigned long, place->fpfn + (size >> PAGE_SHIFT), lpfn);
- 	}
-=20
 -	err =3D drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
 +	err =3D gpu_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
  				     (u64)lpfn << PAGE_SHIFT, size,
  				     min_page_size, &vres->blocks, vres->flags);
  	if (err)

--it5+89qN7EPvYTzh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmcV5EACgkQJNaLcl1U
h9BKygf7BHi5DF86Mxf9Wn54wFbPY39BwlSmtne56jkgm7VmiH3OJey2gGaGfp92
ce8ASM6ob7U91+a485LAkvh54Uzoa7hg5EWXXqtT8dzeeBXA14kUHmRtqEWO/c9K
pRa9fntFCd7hDZt9wD8eN5TCVK/nfcO2cVNiPTa7NYAa0hHUT2kNktxZssCBD+ai
mzqGwTdy4sgak6wDyVQ4Eae/8Ii8NXOyt+8nBefXfS7AnRYJwJIL3UhP8jyGPlJz
+9Xm22e8waSnlXke5DtY3T2S1VGsRs4o0wmvln1sdVSCUGYoamkzGIexfhAy2Tyt
lT/h+6rgZJpqYSENGCVfpwNAb09VMg==
=jQQA
-----END PGP SIGNATURE-----

--it5+89qN7EPvYTzh--
