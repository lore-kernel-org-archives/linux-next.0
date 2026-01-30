Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F4B28D8F1;
	Fri, 30 Jan 2026 15:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769786922; cv=none; b=uGpnXKFVShOA8dcxM4pjahJcslhGae8D+EE4Cdg8oflRqR7jmJ8JM/cl11ZeZp5CaibIZV2a1ofL1gQLekGLtk6hw+BeSutlH8ObQdy0G53pPGPdggRGB5pZWcY9Kq5P1MHq5g5sr4oGNvediLQnYI+jJWLdAe7Gm/7uqSG8kZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769786922; c=relaxed/simple;
	bh=uA8YZORO7B+yXHQ+TgVUI9wt71XGHm11ITXH1rE8ObI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p82kHN4X104Z197mgkNLJSUHgxECA7ZGRuCKMxHqwz/JsYYY9VPqyQB+nQqZQU4BTIs3zA/6tlhWJiFDv09vcDe8PWyjKD2dvMB2uAGd1GJjo9ZRJknv+Co9WZ3VFZkLc+px5Vh5sM/2mG1uHAMBOPIhHBHwaiK6PsErdItgsIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pB2wvjKV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pB2wvjKV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6649C4CEF7;
	Fri, 30 Jan 2026 15:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769786922;
	bh=uA8YZORO7B+yXHQ+TgVUI9wt71XGHm11ITXH1rE8ObI=;
	h=Date:From:To:Cc:Subject:From;
	b=pB2wvjKV2TLs4GUXvrB8bfZqa20XG+Tn11dKAKEkjfTLjPfdDNlROlMHDt/7yrz3N
	 RoAxs39O1Iu9NMNy1h3ERHU8XOaCHr+QE+NtcS9ynpPtR9slm5XKPiotaGm2HgLn1G
	 GWfJbauKjTVcCrpHiAVqbWH+PRUDxTXSu/Z6ix+aw+PXS1APb8xaOD0+SxdpmaXqXT
	 MvSVFshvb4F3ZaXjVJ1YAp8CAtQteJt8+p/ONuD5vhWlqQt1QuunaO95Xbl3EHeP4E
	 8gAoAvzz3Q/NjYxuzJVOrxAqyyE5IGS0krO94dmwxmfCVjcc1w9t+xe9PgghVTXVs0
	 UNSynFX1k7XLg==
Date: Fri, 30 Jan 2026 15:28:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Message-ID: <aXzOJoJ6zhgtFL5u@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TLCRHCZHnl+s3H3W"
Content-Disposition: inline


--TLCRHCZHnl+s3H3W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got conflicts in:

  drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
  drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c

between commits:

  3eb46fbb601f9 ("drm/amdgpu/gfx11: adjust KGQ reset sequence")
  dfd64f6e8cd7b ("drm/amdgpu/gfx12: adjust KGQ reset sequence")

=66rom the drm-fixes tree and commit:

  d09c7e266c8cd ("drm/amdgpu/mes: add multi-xcc support")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index e642236ea2c51,3a4ca104b1612..0000000000000
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@@ -6828,7 -6832,7 +6833,7 @@@ static int gfx_v11_0_reset_kgq(struct a
 =20
  	amdgpu_ring_reset_helper_begin(ring, timedout_fence);
 =20
- 	r =3D amdgpu_mes_reset_legacy_queue(ring->adev, ring, vmid, use_mmio);
 -	r =3D amdgpu_mes_reset_legacy_queue(ring->adev, ring, vmid, false, 0);
++	r =3D amdgpu_mes_reset_legacy_queue(ring->adev, ring, vmid, use_mmio, 0);
  	if (r) {
 =20
  		dev_warn(adev->dev, "reset via MES failed and try pipe reset %d\n", r);
@@@ -6837,18 -6841,16 +6842,18 @@@
  			return r;
  	}
 =20
 -	r =3D gfx_v11_0_kgq_init_queue(ring, true);
 -	if (r) {
 -		dev_err(adev->dev, "failed to init kgq\n");
 -		return r;
 -	}
 +	if (use_mmio) {
 +		r =3D gfx_v11_0_kgq_init_queue(ring, true);
 +		if (r) {
 +			dev_err(adev->dev, "failed to init kgq\n");
 +			return r;
 +		}
 =20
- 		r =3D amdgpu_mes_map_legacy_queue(adev, ring);
 -	r =3D amdgpu_mes_map_legacy_queue(adev, ring, 0);
 -	if (r) {
 -		dev_err(adev->dev, "failed to remap kgq\n");
 -		return r;
++		r =3D amdgpu_mes_map_legacy_queue(adev, ring, 0);
 +		if (r) {
 +			dev_err(adev->dev, "failed to remap kgq\n");
 +			return r;
 +		}
  	}
 =20
  	return amdgpu_ring_reset_helper_end(ring, timedout_fence);
diff --cc drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
index 4aab89a9ab401,40660b05f9794..0000000000000
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
@@@ -5302,7 -5296,7 +5297,7 @@@ static int gfx_v12_0_reset_kgq(struct a
 =20
  	amdgpu_ring_reset_helper_begin(ring, timedout_fence);
 =20
- 	r =3D amdgpu_mes_reset_legacy_queue(ring->adev, ring, vmid, use_mmio);
 -	r =3D amdgpu_mes_reset_legacy_queue(ring->adev, ring, vmid, false, 0);
++	r =3D amdgpu_mes_reset_legacy_queue(ring->adev, ring, vmid, use_mmio, 0);
  	if (r) {
  		dev_warn(adev->dev, "reset via MES failed and try pipe reset %d\n", r);
  		r =3D gfx_v12_reset_gfx_pipe(ring);
@@@ -5310,18 -5304,16 +5305,18 @@@
  			return r;
  	}
 =20
 -	r =3D gfx_v12_0_kgq_init_queue(ring, true);
 -	if (r) {
 -		dev_err(adev->dev, "failed to init kgq\n");
 -		return r;
 -	}
 +	if (use_mmio) {
 +		r =3D gfx_v12_0_kgq_init_queue(ring, true);
 +		if (r) {
 +			dev_err(adev->dev, "failed to init kgq\n");
 +			return r;
 +		}
 =20
- 		r =3D amdgpu_mes_map_legacy_queue(adev, ring);
 -	r =3D amdgpu_mes_map_legacy_queue(adev, ring, 0);
 -	if (r) {
 -		dev_err(adev->dev, "failed to remap kgq\n");
 -		return r;
++		r =3D amdgpu_mes_map_legacy_queue(adev, ring, 0);
 +		if (r) {
 +			dev_err(adev->dev, "failed to remap kgq\n");
 +			return r;
 +		}
  	}
 =20
  	return amdgpu_ring_reset_helper_end(ring, timedout_fence);

--TLCRHCZHnl+s3H3W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml8ziUACgkQJNaLcl1U
h9DblggAhksD09t0akRktEE//4f51U7wqQGjVJ8AbbWsqjgfV57nq7AwpCFJzMCH
A+dxsHvK1PrBQqd3bvR7UMe5Tnbb1sDUgvRLSKAtD18khZLPIbVE7xMfgDWml9VP
Tyv24kN4wN5YNUT3MzqQ384c/kUvl47tBGP56Q5jPQP+0q28fQkVqMdOdEtCyoFH
w5sBZt7VV0VitUURPJ7Zm7Wf5IFrmfz+XJXd4SYO9plLKRZlsDqgw6z/0VXwqeG/
H6XXOOYFkS13LkTVwZJHMM2QyrSKVBajs66lagyrlGBRhurSuURYFAman7diSrjt
jfoDSodrIyvnevZwKmXMsfya/PgCnA==
=taB6
-----END PGP SIGNATURE-----

--TLCRHCZHnl+s3H3W--
