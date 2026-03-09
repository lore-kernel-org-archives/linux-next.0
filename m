Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BAE19F135;
	Mon,  9 Mar 2026 18:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773082702; cv=none; b=rj/wh5WicLg67JCbp85Z4maOGcUosbUZwEJirZqcXurpW1Am8ErqQM3aYPjK0Ha3VSKBrzoqsxpe87V6E1GUc3qbNeoeUWXlFWWfx1+b0TttZ1Q0Ld8muHAk/z53XxEfXqXa+NHKQRVLisSCinU57xIwjedTadoKyZDLqRyIN5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773082702; c=relaxed/simple;
	bh=cledHMfdYPuLaudjPLRREOdXD4Tsc5kWtqaOZco++so=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A1vXUiAp9h/991MjKK7hGwD/g7yat2m3JfRgxpAWNFvNQexyZhVszoChsvO9HVvOuTDINtFpaeeA9x8NKOB+AInG4dERyjHO/xsREfuj2ehwFe8pgj2f7UjyicE6SoM0uobGFqtQyCGR8uLNQBY2N6xtBU/XtpT9L4pqqvsHho0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fJUS/MnH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fJUS/MnH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E25E9C4CEF7;
	Mon,  9 Mar 2026 18:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773082701;
	bh=cledHMfdYPuLaudjPLRREOdXD4Tsc5kWtqaOZco++so=;
	h=Date:From:To:Cc:Subject:From;
	b=fJUS/MnHG1TNlh94cwBp3Mrv0nsYr28D0UMU4Pc3+hs9MbmJVRkhE3D1WJ75PoQQf
	 3mEL9ulzAvzGojqZXtfOISk1/GMI27D8CGN22lZIYIy/+9yq4OQ5zNDPqnDHlK5hrs
	 6hAD0Ts4CUa+vVGhC/5M6u10L7bF/oxsfxV8lA3xegp5O3G4obiTCn9qmQrCtQ9h28
	 OaefDMcQcEWVdHlfHfB9eoIqqd0PkdtFm99mXYpsTvwAYFITcfxQZI1xqo+rcNDnQW
	 QS/iYmVoxeO+sYmE0SMTiVMu1cQdswRdGGrM0OPol6b+yYjo+z0ou30QWhHG/27qxD
	 03nv8JQXVVl0Q==
Date: Mon, 9 Mar 2026 18:58:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status as at v7.0-rc3
Message-ID: <05e98b6a-a0be-4fa5-87a0-a4ab6a07427f@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1rOZ+/aN8lO4OXuy"
Content-Disposition: inline
X-Cookie: Do not dry clean.


--1rOZ+/aN8lO4OXuy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

No trees are held at old versions

Trees with signoff problems:

  imx-mxs	(missing committer)
  rdma	(missing committer)
  rpmsg	(missing committer)

Non-merge commits relative to Linus' tree: 4261
 4408 files changed, 304357 insertions(+), 76741 deletions(-)

Top trees adding commits to -next:

  533	drm
  333	net-next
  255	drm-intel
  249	mm-unstable
  151	ksmbd
  132	iio
  124	kvm-x86
  116	tip
  96	imx-mxs
  93	mm-nonmm-unstable

Thanks,
Mark

--1rOZ+/aN8lO4OXuy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmvGEkACgkQJNaLcl1U
h9DN3ggAhZi4/yQzriPmQSrq0gXGBlQXny3fpsomcu0cS5ebTpQfOEkKzq50AGBF
w7A+I8Gshm7M7K0955We6+MR/TdsaBZZ6agMxQ4Dbqo4TUi9F0znRKAcaD5woOgz
PVdx7O6OcTs8RA6IlFkl8mppXPMTV/n2QyqAWqxMwMLwuNxkUAP70ut2A0rv5CCB
PlVW6Qn5GV8QM4HMGBwqcahDhgTy1i7nQXPaRj1uIwqxSrZy6LMd+XQ7s4kg9F/o
mUtmb5Zj4S/jO/wJJhI7ZQ7VVJTK9joiSx2ci6q1scoCOIugIjrhZtAPj3rfN1YM
xjy/Bq1DIVoXJkHYQPSTHpKc1Ae+0Q==
=wCp1
-----END PGP SIGNATURE-----

--1rOZ+/aN8lO4OXuy--
