Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0209C39B489;
	Fri,  6 Mar 2026 13:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804858; cv=none; b=ksspnAY13FLEttu169xQeOR8fYSNW7Gng7hPRoROyz0ypGSs7MiD4MTYMRDE/0Dce13Il7nXbTgGeYATreg1I5NpO7SQL7GRRqvSjtSP+RRIHpoiFNnjuLwyDByaWVWL5Lot+zrVyfhD6cGDL2XV4SaubiKthJUJCHGmSClfEqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804858; c=relaxed/simple;
	bh=0ukStTyGnIIvoK4UDcCYldUsJPcmS2GrzcUY4SL21gE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dJDrqThoC4SB6eGHy8tRlJ4nOdZMCUkOAqT7mWJbDTcH42Xxacl26kV01xSxk/zIugm9Gq1F5G03WYpqhn3wefxQYjSE4B8TAmUbwLu+K7F/p4BXQZyZYM+lIluq6pei3hsGal+eRAF88J10oO9xtb67r1ZaGj0Nkxk1aSDJmpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6kMNgAG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6kMNgAG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D286C4CEF7;
	Fri,  6 Mar 2026 13:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772804857;
	bh=0ukStTyGnIIvoK4UDcCYldUsJPcmS2GrzcUY4SL21gE=;
	h=Date:From:To:Cc:Subject:From;
	b=n6kMNgAGRJ1za0nKAdnK+tIqO1rcqzH/J3BUCC2W2e/3r/X8VkCXp2z4sMY4fLODa
	 NsGIfvS/qH6MZD5SQEYfTu9wb1RsAi90Pv5NIZEGsI6bFh2vfFm/JJqCwLgruc4MVW
	 UX4TprS7JWx8XthtAZ2nIYSpBd1pRZKk87upq2oEvk3XpZSw6kfSqkPH3HyNZo/2wD
	 FxO1p00hm3aYwZjL3JB846e/k8Qml+BF5xC/3hPe2sMim31NxJ5suJdztJcHINd+Ai
	 ms/Vmrqv5yHkyJSZ19QkZ3IOWFq6J+aT/bsfqEyxqNmWZzjD52+CoUbeKtKLRMfir1
	 syXKOQHT+H3Tw==
Date: Fri, 6 Mar 2026 13:47:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matt Roper <matthew.d.roper@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Message-ID: <aara9fmCbTdROliH@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Nky8M7ub3zJ4eLnz"
Content-Disposition: inline


--Nky8M7ub3zJ4eLnz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/xe/xe_wa.c

between commit:

  89865e6dc8487 ("drm/xe/xe2_hpg: Correct implementation of Wa_16025250150")

=66rom the drm-fixes tree and commit:

  941f538b0af81 ("drm/xe: Consolidate workaround entries for Wa_16021867713=
")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/xe/xe_wa.c
index 462c2fa712e01,289acac2c3c82..0000000000000
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c

--Nky8M7ub3zJ4eLnz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmq2vQACgkQJNaLcl1U
h9A+Pgf9GLG/N23ED2iT/BnDDvEPH25nVyO1wvmJ3D3/tesRhl+J+4pM3am9o5oe
cyqhQX/79nKf7pFX7C9FM/RahXb6pui8xE4cl2OEc8uh+qCfkSbPKjy1Mt52pEJ9
dKBjoEg4oyBTXmUZI+WONOi947h/gxgyinT25Y/SntfksjMLYoSyfuHYf7kSF547
khk9aEKS8sII/Fzf3YsFMX/o7PyJot/rKTy/k1TgeQ85AXPr4/Ao3BNjg2CNOTZY
lTpAmqGVzl1LaSuKhySp+vUXvO9FOLC6qkux80qiOuyatuf7C/Nf4B9Zdl/WB7ND
n/Umc/cQjokU/n23hnw/fAKU/GA7QA==
=ThXb
-----END PGP SIGNATURE-----

--Nky8M7ub3zJ4eLnz--
