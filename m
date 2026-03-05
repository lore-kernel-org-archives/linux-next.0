Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7209F17BEBF;
	Thu,  5 Mar 2026 13:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772717842; cv=none; b=scScSBuZlt60oQnDhKAbUnpYd+iDPSJS9SQNJN3qGTsruXhSdREAXoY9yVRFsXlwyu6qr/a3W7WfeB9ST1cxbY1rPzPuHQYgJsWF5Tpy8scaxkK4qEiFfHwMzlJZr7GNis/QbLaR8gOks4iNFSytkUyLOxNAf1W0bkSAAEJnp/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772717842; c=relaxed/simple;
	bh=NQMjKmue/4llBwIfQZngr3UQmcpYmUFUyewVyuQx8G8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=avAoqmomc/H4YNjKQDTPxfvZmfc9+SS57MIg4ZBRgFXNGDyFFYlusA6VcAOUYHZ8iQ6l6Fml3oxV8RJm1EARtzjo7Elyq2cqN7w8EBwodzE0kv0P72UN4O2exRkgOiR0BXdQQ7xBhcqvZiwMtYWDSSWIFS49MlFM1qtM6Xq/TGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JhVWECqz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JhVWECqz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A090EC116C6;
	Thu,  5 Mar 2026 13:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772717842;
	bh=NQMjKmue/4llBwIfQZngr3UQmcpYmUFUyewVyuQx8G8=;
	h=Date:From:To:Cc:Subject:From;
	b=JhVWECqzDD2P4aC2lUFuTrs5Qw+C9TaoClG87ve24IrtA+XPnqsgZRcFSa3PIF801
	 3xANyJAq/XkEA6924jubO2nJIQjfOTWoMNg3QjSPB7p7n4n9/Kx0K6oOF55RofNBMx
	 4VHces631XHt7n1A5HHfWi1VFCRG/33hPoBXmwK8iOBPySoZK1T61RdlHq5Xo74F0E
	 JCgKZkg1CBsoKHzpn2IudD/kmoSU6nBqR0C9hBL32YmbiNUQvM+A2d6grGf40ngLlX
	 K0Nc6fePiOZ8s8gO0fnR0nZsaVcru/cfdI19PJXmvwMj4fHbulbpPk22brvm72SGvg
	 xkBGaHXMu1B5w==
Date: Thu, 5 Mar 2026 13:37:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
	Sunil Khatri <sunil.khatri@amd.com>
Subject: linux-next: manual merge of the amdgpu tree with the drm-fixes tree
Message-ID: <aamHDS3zAKWfUEtU@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cKRaDG1on2qsu9DG"
Content-Disposition: inline


--cKRaDG1on2qsu9DG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c

between commits:

  65b5c326ce410 ("drm/amdgpu/userq: refcount userqueues to avoid any race c=
onditions")
  64ac7c09fc449 ("drm/amdgpu: add upper bound check on user inputs in wait =
ioctl")

=66rom the drm-fixes tree and commits:

  750cbc4fbd490 ("drm/amdgpu: Drop redundant syncobj handle limit checks in=
 userq ioctls")
  4952189b284d4 ("drm/amdgpu/userq: refcount userqueues to avoid any race c=
onditions")

=66rom the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index 5239b06b9ab03,d8ce7b3733e75..0000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c

--cKRaDG1on2qsu9DG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmphwwACgkQJNaLcl1U
h9BJ3Qf/T0gGgDtPLtKzpq+/oW+ifCpPbybr+wk4u1hoU2b7w8lxhcn65DiN2yHL
OV+9UwnaTTMgJf7kjLMkd2FamV1Nno6vLokHXOaujlUVqxOhwrAx3Z2nSTktFL2K
qbHr6idNfj7TiOTHZWow7v2lY8SBqS2sYjiAshe2PzMpekSLewGnj0+ocwiVS/u5
4aaydX3d+xn1Kj7ZGmZYKlL4+h2rbXrl5gSq9Goz/AcgHG1Eh348ngcVP0eDTsMf
IV9fEZWWSLrDA41T3x/toHPU0Lia271nN7f0PMD2ncwYgh1L6nrGcig65ye2fLa7
GoEBQD3OS6y89CwjT+DHEfGQ8RK64Q==
=NPgd
-----END PGP SIGNATURE-----

--cKRaDG1on2qsu9DG--
