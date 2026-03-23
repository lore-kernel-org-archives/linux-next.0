Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1998B3B9DB7;
	Mon, 23 Mar 2026 18:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774289335; cv=none; b=Hu/LsOi+ZpK1nQcuACxQTjMoVKeAb30CIDOfw6Fg6dZEt5nPSdCc+iR0Jf0YWIF01Mj5CTtn/wrpxVL/x+E2a/GY2GSlnaV1FCY6mtFurIeUI5x+VnAmmVSM6lOiUUPHZqABiSyXqn4Btrzpyj6M0wAlxiojK0xDpvfRAwMxVWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774289335; c=relaxed/simple;
	bh=tGEvD37Xcm77lhVJ4TlELVN0KVqsRZDQUD4pDGeTygw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d0r5tEbDbIiNIfVoc9xsEzHb2wVdiliHUEOJ6wHuqyP730l70UEug369ZMb1/Uku7zsAeU/MtFu9mSXkLjVQohvPvAQGbIzH/GppHYKq3fMtzY9+vJ8xXo0bJqtxHJ0k1Xfho+BHQgN1jxo9Z+ifl5T0EUQatQkCgAbs9DsP28A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HM5rdWuT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HM5rdWuT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9221C4CEF7;
	Mon, 23 Mar 2026 18:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774289334;
	bh=tGEvD37Xcm77lhVJ4TlELVN0KVqsRZDQUD4pDGeTygw=;
	h=Date:From:To:Cc:Subject:From;
	b=HM5rdWuTMsO+Thk7e10yyyhpfDBS8XWgES3e6O49RqkpOE0mbCNYDHFEr6GtVvMcz
	 yvbSFGjCR3iN/Pu3S6j3nWobBpqzJ+Mc/ovdBSKg9dSemr0G+2QdsywCVHUh/AQjTo
	 2ohawktes+GavJWwzY6NQ+M45qBpIAVpI77dYqUSzdh5UrHHi/tyNT7XPkOV0KqY5L
	 qxnhfwTmLJF9wXZ/pxMGj5A738PHR3hkoEDtaKlln0a8+TNFM3lUv+DDKSt+/Ff0jl
	 wKpW+Dml9tUYrztd0P7w7oXMw4w7cCmvVP4w8XZq/pASwf4stNytJzRg06ozgfZxpL
	 4SnYgaGuv8b0w==
Date: Mon, 23 Mar 2026 18:08:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status as at v7.0-rc5
Message-ID: <cb2256d0-cfa9-424f-9dff-8704c3c8a1fa@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0uaGxlVVTt4ddwxt"
Content-Disposition: inline
X-Cookie: This is a good time to punt work.


--0uaGxlVVTt4ddwxt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Trees being held at old versions:

  vfs-brauner    	next-20260312	(Fix applied today)

I'm also carrying a patch for ext4 fixing KUnit memory corruption that
manifests when we merge with the tip tree, the ext4 tree hasn't been
updated since January (before the fix was posted).

Trees with signoff problems:

  hid		(missing committer)
  iommufd	(missing committer)
  qcom		(missing author)
  rdma-fixes	(missing committer)
  rdma		(missing committer)
  rpmsg		(missing committer)

Non-merge commits relative to Linus' tree: 7417
 7501 files changed, 482067 insertions(+), 147610 deletions(-)

Top trees adding commits to -next:

  1073	drm
  633	net-next
  436	mm-unstable
  272	tip
  221	qcom
  152	ksmbd
  143	iio
  139	sound-asoc
  137	v4l-dvb
  131	imx-mxs

Thanks,
Mark

--0uaGxlVVTt4ddwxt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBgagACgkQJNaLcl1U
h9AXoAf/U8Lz4aQ8jHSrPJ1IYe8cAwOZPd9rYuFlhIHiajOJXUs/SpcIalEVS/53
hfxxA7WXBT8aIxkv4DM7EzHQXeacFC854vGkQiGp8dDOBckpjwRga2Bozqn7jwn6
oRxJEn+064ZWkaVEbQFZrqlaLoLlH2VLrtCUqjJOCmvPTtvPVlXIOUe4h4h0A1dH
soUi0TxlcopUgme9DFzk2aIM8bgaDde3ncp+LKX8fhfMLW79FrVs8PQDg0qTiBVq
zho9l0YnU0j6SV3//ptYhMhpFphiawVTJvMWBYSr6DwuX7Asimmm3Fe06yIxg9kl
wWAXtL24qEb/kdbWXpLGwFNZ1wrxag==
=3sYL
-----END PGP SIGNATURE-----

--0uaGxlVVTt4ddwxt--
