Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48CF4219F6;
	Thu,  9 Jul 2026 12:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600453; cv=none; b=IUiEMbOPHWxwGv4dDju2PPHJTKdrN4pE1p+9ebIKDJzXkKDwiy9EtKTO/186IZmGDEpGylHrhO1vGy7/NAxW3MGTJY8sSD4DfFqqr+8OZSt/sNRFXPSJceYbbwH0LUYdY08zql7SvAooU3Nbcg1HjQVQ4TAFzp+qK+e795fm3Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600453; c=relaxed/simple;
	bh=h2Y7F2WDMXhDYHXwcO6lBhqvLgadaHeohSNlu2EKBb4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=loZiUoVfb1kU2Ezz4CcZ2A+LyWYyt+eE6hlCtPFJLp/ua5YtR9B2QXv8SI0R1e3ZcDnqp4nDoEQYogeOJDa0fmYwCa3VwJ2BHTrnQjwopikQzQ/+56v/KG7ZkMTe5I15EHdPUa9aaOydzxmuw8l6kq8LDOGEe/hCi0KKBHVaugA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bseccNL5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bseccNL5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 416DC1F000E9;
	Thu,  9 Jul 2026 12:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783600452;
	bh=PLcyfyRLh9N274iEIAU0fg4hnH+FVhFMtjqvfI8OHEc=;
	h=Date:From:To:Cc:Subject;
	b=bseccNL5IajMpaKml0Cf6JglRnD3jC+Q1AWQzLot0EA7gD7jKDk4l0haAHXGRfCIN
	 BPPzP1WU4g7bjFNFd848ZgxKYl5C0c5zlvr++A6DIgcZCy+vBIaHBLHISEmr66opq6
	 S8HfDiTkqzBXDer+bZWSySMNoSqFHy3lO1p4lmZ6f/yq+8OBqENDk4DvkCqQguS/zw
	 EYNbQmr4+PCSEbcZl1/QKnNWnJDMrNDLQMrf7FYp3pVCu2+36cHodmVg0Ss9w9mDIJ
	 O/XdRwlPHKSOQ8Xun6gbsx8Ot9dNBYtMWOy99Dj1J2xaADQoKhsnfmbc5DD40p84pU
	 nrmmctDpz6aAA==
Date: Thu, 9 Jul 2026 13:34:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the drm-misc tree
Message-ID: <ak-VQChNqm9ymtS6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ySfZFTdHsc5H/OLM"
Content-Disposition: inline


--ySfZFTdHsc5H/OLM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  0aeed866cb938 ("drm/amd/display: Fix dangling pointer in CRTC reset function")

Fixes tag

  Fixes: e7b07ceef2a6 ("drm/amd/display: Merge amdgpu_dm_crtc and dm_crtc_state")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--ySfZFTdHsc5H/OLM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpPlUAACgkQJNaLcl1U
h9DuLwf/S7lHF1Sp6r6EGwnAz5Xpnr4wcgRT3e76kWqVLOglVplCjZsJPkBhbb4R
dEbXZM6pYa1ygK6Yefqr3W0sbTppN6l9e5q/a4fA+6PJoN5mFDHdXjyKCbBeZSsR
cyLjnZCT160raWAVLiSZpG6ETvdusRJehu0e4PEQ/qgORPLMRdZTUr2fkaGOz7xJ
WxxL7JX9El47q/uz88bvXzAD3iXJTbca+IpZ9COCyhe0cN2V6ojo90jyL/4xuwET
BEhlsCgKe4316jOWXAfaOjIFgXU9ns53YDdwPtrU/3vqmZghMT4M2LcbWJGeTPVS
KnADsQX5IgmW1NIINRqWZDuCIFN3og==
=glOm
-----END PGP SIGNATURE-----

--ySfZFTdHsc5H/OLM--
