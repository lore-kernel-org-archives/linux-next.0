Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89960439F63;
	Fri, 31 Jul 2026 15:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785510623; cv=none; b=Jbc11o3AYGeKumVRqDlOBcMoX3q3Jtx7iwbp1GJOIYKie1kdyg6gs1DXJ63QxHq7BcjQYWRZuJL1xrFkP103Kq0XhMXFcNzqmmWgHWAdkQ2phU71OzrAS14VPKFpyViLbs7uhnGjeG3JfZ8mp0jgv7KjLONsYAxpxVCmQlItbSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785510623; c=relaxed/simple;
	bh=P5clsbffPkR/gKmZ+1U/0nBB49V4x3x+5P9nZh3zdEs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pagdqLFkmdddYyHqY/wUcluG+qAXTKSaS2xQMmuVg4luM0+RUVvf7ipG3QwOXEtbGhd9kXUp+9jpBaG65NlHSZ7J9GuAZOlInykAWWYERGQZJtlaPTiRFbTnjBH6L//7TG/fBmAzrwvo+Jv7EMy2ll2aowVHR4ywndx+8vntfyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jUP0OBjF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jUP0OBjF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD7291F00A3D;
	Fri, 31 Jul 2026 15:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785510619;
	bh=240lVybYK3ENYwKgYOhk55iYthL6f3+E8I+4Qp6VO+U=;
	h=Date:From:To:Cc:Subject;
	b=jUP0OBjFhbEkU4n45XPJc0mYh0MRkfvskwZEyd7LmTPHjE56fSLgxu+20Zzvn/dKN
	 w0miuOlbMZrGWlrX6uJcfWHUU/2B4IvDAvQG1frwtUIAZCbeCWhKFj/ujAaVm5+mvx
	 td8sZT0T8RIo1ds7W9AaE/eOunQTpaJ2Tu0Rh4VztzrQESZIsvkEaELvjVRRMhRDnu
	 rAlH8lPDr1B/48y5i5iT6U5TN0ZLllHGDe+yk0hr/o7IaUMpBSIrGa+x8V0b4+00Cx
	 SmoA9ezrJei1Hi6Gvx7tLqg4Uy638TT+0eoaW5lgLZMfNkvXu2XYVpnErYczQNREOn
	 869p868ByEy1w==
Date: Fri, 31 Jul 2026 16:10:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the nvmem tree
Message-ID: <amy62FeftQnnQ350@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qx9mITKlgYM7QVtM"
Content-Disposition: inline


--Qx9mITKlgYM7QVtM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The following commit is also in the char-misc tree as a different commit
(but the same patch):

  18f2b79951a9e ("nvmem: qcom: Unify user-visible "Qualcomm" name")
  512946cf0f32e ("nvmem: rockchip-otp: alloc clks with main struct")
  5a2bba5b74227 ("dt-bindings: nvmem: lan9662-otpc: Add LAN969x series")
  68628e84bc61e ("dt-bindings: nvmem: airoha: add SMC eFuses schema")
  7089170e1df16 ("nvmem: apple-spmi-nvmem: wrap regmap calls to satisfy CFI")
  7106dcb57aa1b ("nvmem: core: Default to read-only if wp-gpios present")
  7592c50152619 ("nvmem: lan9662-otp: add support for LAN969x")
  9f902e68cfe33 ("dt-bindings: nvmem: qfprom: Add Milos compatible")
  a3122a19f00b7 ("nvmem: layouts: u-boot-env: check earlier for ethaddr length")
  ac0a5d17aa3cc ("dt-bindings: nvmem: qcom,qfprom: Add Shikra compatible")
  b13e7886c2e16 ("nvmem: airoha: Add support for SMC eFUSE")
  c00ca6cc2fc96 ("nvmem: layouts: Add fixed-layout driver")
  c33862c0a3a9a ("dt-bindings: nvmem: qfprom: Add glymur compatible")
  c896d1c34f2bb ("dt-bindings: nvmem: qfprom: qcom: Add Hawi compatible")
  d5bd22d9d2032 ("nvmem: cleanup dead code in Kconfig")

--Qx9mITKlgYM7QVtM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpsutcACgkQJNaLcl1U
h9C9Rgf8DbQZR6+4qr2x73BksXIJUdr2Obqr91m25DJIaBwBcjBOl2Dorvzw43Jx
qzSmwnuwKfwB/v8RNzGyTaeD+qaq0ZJiHOPxs52CZvGS2H+LyM6ChkNJB/YOdar2
tBtyorPyiUi9TeWhIgujVb0PwpqOyPhOzD5efATWmgmr7Zefvxu65j1VhVK0gq9h
GzzgnZRdMQ/JwRq+sbZbzbc8mTzCuEN+ZDYU/DIP1ZRx2D9KeBDPZg1eGsgMjHL0
pmB4hzejCP2JjsIK5vL55e7ljoGxjlo0kz+ok6SfoBar7VejPgw+EfdRgzp4lT5f
h19w3qqWW05jqiz9+M5+DJHvKlwJEw==
=J06I
-----END PGP SIGNATURE-----

--Qx9mITKlgYM7QVtM--
