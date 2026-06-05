Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5583F5BC2;
	Fri,  5 Jun 2026 11:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780657410; cv=none; b=fpW+ShLOSbFID0+8eESRBFgMw/sxMC9RdHvIbliBBquLLKItNR2CeCN3L6ScsrIFWftCo3Ddj0yIje/adneHznZwIM6TmvMqOyF+dFqjX2p4KH3UFTBznpdWm71IF+HI+bP59RxIY73zj5/fETXLdRI0n/nRSvTcnpyFiFEk6u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780657410; c=relaxed/simple;
	bh=BZY18HxO/dEJtrnA5uq5khUrNrYFp+RjD02YUbnOlIs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iIUIYLTM2DI+VmRd6GaZzpxu9IiI6bl7cvC7zydVtM3eVlCu67cNcSugpuUNwKWbYxEf42hJS0Q1EfTX9cH/aI+PmRuNiER5U/+6Q+WlHg5/o91s7B0lHyEygfMLcyzsv+Ae7uBCjr2aT2yef3NY+xgut9bJyvBhcf/s2mVE5+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TLAf3rEt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLAf3rEt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CC621F00893;
	Fri,  5 Jun 2026 11:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780657408;
	bh=/KUbSan6ddcjd/VlqRgKjqzBit8/8pj2PmLh4tW1azo=;
	h=Date:From:To:Cc:Subject;
	b=TLAf3rEtL/N3eIOkdSIpR23FFvEBZtu2cle22N7Ibld1dEVXy/8NdyeNVUkc1VTxl
	 JIhZZVPGKsdFHuXYNMcNLNgzqHNxhBqikReyyUg0VAr947+gJY7j8O7e+9S8Ee731C
	 UsEJmnIHyBOW6QC6McoSk+RzUZL24Z9LIWa+tYYrp7rYe4NblAAorbLmOyQCO+iQb4
	 WQLWZgOEI0ZOXN3Xj9sTW7LufULFp3kLuua9KOJCOsI0B1Qbhhejlwilp0vzH+WnoE
	 +JTDb1Y4hrK9zBfKFSivVl/tCCMTC81weMad+zamoCateG/Oi7XB2xb8nwfVeZRupa
	 ITjs73QArLmhA==
Date: Fri, 5 Jun 2026 12:03:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>,
	Andrey Albershteyn <aalbersh@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	"Darrick J. Wong" <djwong@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <aiKs_XGXGTZDKnlh@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wuoM5ug4EZ4LEm9j"
Content-Disposition: inline


--wuoM5ug4EZ4LEm9j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the vfs-brauner tree, today's linux-next build
(arm64 allnoconfig) failed like this:

/tmp/next/build/fs/iomap/buffered-io.c: In function 'iomap_read_folio_iter':
/tmp/next/build/fs/iomap/buffered-io.c:577:33: error: implicit declaration of function 'fsverity_fill_zerohash'; did you mean 'fsverity_file_open'? [-Wimplicit-function-declaration]
  577 |                                 fsverity_fill_zerohash(folio, poff, plen,
      |                                 ^~~~~~~~~~~~~~~~~~~~~~
      |                                 fsverity_file_open

Caused by commit

   014c8fc41d92d (iomap: teach iomap to read files with fsverity)

I have used the version from next-20260604 instead.

--wuoM5ug4EZ4LEm9j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoirPwACgkQJNaLcl1U
h9B3KQf+MD7LNRlJE6jCN8Ua6/XwtowzFrlXtLcWtA2ocf5mQlLaqruLeEA14j9q
sev0WZO0oZ4A4OwC5cZjVKvh/j9oumS6Xi+0uBYJ8/91f7vVTa/ygQ/4tMbJpS39
a52uog41xurdUrcPX420U02Lc9xUOBrBe8Wq2H/sO1fEI47NwCvSyuoCueW7DOLt
FJAsxmLSHANumKB6n9DffhP2Y1dk918j23lG+U+Qqvmx+cx/e41mjf+OltGkIaST
CWz0KOdQ2zL3MW4aBRT1nDqlBuZp6sMuMaasbyDF/VJ6vmtH9D4mLmAiuYop3DHV
nbW57oeQQLarn+J43Syx0EadQabaKA==
=4ePn
-----END PGP SIGNATURE-----

--wuoM5ug4EZ4LEm9j--
