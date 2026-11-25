Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615934;
	b=K3ZWu7wNepxk7KLb/qsv5y7TdkaP9B9puh12LEnG1cJ7x9uIZqo5Z8UbM29aZd1jUzAi
	 /+372dIyd/p9+ecgjsLNgrXpElL7KyTVc4CrmlLBEZ4OIMtAbjKdMaMmDEdJrmKNKstwl
	 9FyWFv02rW/ygEaYSpxAG2jr0ajqVw46R/Ku4xg+L+w2u6x+/zgJ+pfW03PDFzOrM3xa5
	 a1JwtM4ZiqDci7W4NJPIm5O/oZszfQt8ANXiPSZIFt5wOtIXhFA3mJJOA9sEfC4nx7FII
	 Ovnj3vH2BYOcHEZRW1unf568pLk8I44vL1YyLUDx/rrdQfLJy8iYBDuiCPyRpiS6U5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615934;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=aUiIoWV9wFi+0KR9UrJfm3cMI/BKv1gv3XsBUzQW4Ys=;
	b=UoYU2uXE0vrQtt75TVeT6p3DOd++aaSp0Vyk9Au2GBVEenWJYfod/fOmtlPkoS27NshE
	 e+9aoy6KrD4l0gG+X+T/d3WQoqgQKSKEG5mJaqzu0qFGh7SnqHggS+TfRYC3zoyh1mAhJ
	 dHq8V9H6/JyJAlO8nAGqm0cKUguEjoWydpNlpbTmoy62qQA4a69DoKNo7hhMk/JRpZZPa
	 GOiQlX/Ytk3tWuqEezM3AgE7llL0NHqyCAzXgMtEm1R0MHJ36LDASf3PcAKEUj2qcqyLW
	 0a4jNTBYpJobDdf0GI9VKgtfXCsgoXWiO2yGdCp6Cn36CzhH1LVmfMC33lk40/6xJ3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DSnuPNJc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4F760A260A;
	Wed, 25 Nov 2026 14:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DSnuPNJc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5891F000C0;
	Wed, 25 Nov 2026 14:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795615934;
	bh=aUiIoWV9wFi+0KR9UrJfm3cMI/BKv1gv3XsBUzQW4Ys=;
	h=Date:From:To:Cc:Subject;
	b=DSnuPNJcGp8y3EwSqTl/ZjYjdzGlH5KbYlymSeA4twwNTQed4nGOxz8tyO3yp9nwI
	 tt9l1fQhmzhUhzW48QoS40aI6OrQsINV0sFsQtPRYQrpDbD7RCJC3OciOga4KgqQoW
	 S5I0kUyyT/oYVSRjejRApE6KRsKKrHhqzndm7pB967j06LSSnBDnzSJWmhOdCK8mXV
	 6gp8KHOBGN5TlLEKoRSYp84K9km1Ao6lPgHdgbybfbV1Lz2JaABpy/612iy96IOjEk
	 eBghyOx3rQZb2Om9WnGCdImJi5/EQsEMmXd1RVAJmmq0GuMuS0mj9aV17y6stIOjE6
	 f/4qik1v6Jsuw==
Date: Wed, 25 Nov 2026 14:12:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the imx-mxs tree
Message-ID: <awbsu-v1AvkUk92M@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="iPcX5JUUHdzkIqHt"
Content-Disposition: inline


--iPcX5JUUHdzkIqHt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  7c6b834cc923d ("arm64: dts: imx93-imx91-toradex-osm-dev: Remove ETH_A PHY interrupt")

Fixes tag

  Fixes: e8a8c86875f4 ("arm64: dts: Add Toradex OSM iMX93")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--iPcX5JUUHdzkIqHt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsG7LoACgkQJNaLcl1U
h9C8Vgf5AeGn0J0yrjaIGHyM5aoxHiKbH/LQMDAPf28YgGufVD8b79hHxObb3kbD
UHDpzMmy2NXJKu0Ky1GgrOa4Y2JIPURqejM25SbckOYPrF5W9A7oZTsqRTuBJfqD
MDDGKXcDUZSEIQpvZ+ZED5JvPBi0wOLKhs82UO8vJH+MhAKVIrq08PmbttiPQwHF
mjjkgUi2JQfwXXb9wDPjRoNzEjS1ydDKs4CX4Um4pERJGX4Y30WhYUY5Za9WMkoG
GCVjfMb6Mm25yoS9kT2HDozsjOaMELaEFD4OgEBQSlKeaOKwOF9jJNuKHPNFV2s7
X/TzUCaxbSq0L9O4MP+S2iTEw/n4yw==
=y15U
-----END PGP SIGNATURE-----

--iPcX5JUUHdzkIqHt--
