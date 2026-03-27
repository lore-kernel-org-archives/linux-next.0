Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D1938A731;
	Fri, 27 Mar 2026 20:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642028; cv=none; b=q3UhF0MnhoEvjGizoYEow0DD1/apkwO5qmxIiC++H+Fs/5/VC5GVVcsaLUwPKz+FSktF/0UAswmrpN3eY5+agEo81n0xQPcCFgfKXEScANw9hYh59oN9qb6wUxzzLj5H+mKDClhz9GMYHz67VIQELEflIZrPVnveKPT+Fessu3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642028; c=relaxed/simple;
	bh=K8+s2P9TPTfYjM3Ew7Ej4zTe+sXHc5/q2U9ADaBFOGA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BxuMRWvDTfNvNIeC/KF4B36nl/0JjzU/1wkUEdgqG2KC4Ql7Yi3fTi62vYPtwvmMy9/N4I0VpTrl0W+AXUVxne3jVpaKPVVKZ+YmdU2TYAPaUZQeEYdpzYb1eWUFC424b0t0TyfIExZzbsmDmeCs4bJyJ2V5P7Jgw4EU/GY33YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N/DDLFWo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N/DDLFWo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F644C19423;
	Fri, 27 Mar 2026 20:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774642027;
	bh=K8+s2P9TPTfYjM3Ew7Ej4zTe+sXHc5/q2U9ADaBFOGA=;
	h=Date:From:To:Cc:Subject:From;
	b=N/DDLFWoZFm0TA1ZqEjPEEfdpon3r7LFi3PPMU5XdK6lR0jKk1erQijOJJhalu0bp
	 gXZDuJJuAuyJnErvKt53EpwIjTUkjIPOLBsD71/btJ68QOANXT948gynx6GBvTWjD2
	 rjwyPs7+K9nPci5ZiJ3pp4y9TwkntsyZ8NMHH7kfznl0V3n2b+uRwa+gPLNdsqyLoY
	 lzD/fjCeP/QAMv/dPSnXE/9f2npmcovl8muuiChHoaZn39B8Lq7yZtppgyamZ5CtDC
	 QCE/JPNhCHoUHNk7tMriqA2+xKwIzJToSqH0cZru6Ewka8vanAMUsl5x8Q00rO1hdI
	 oOViKFqp//IKw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id F2CA91AC5847; Fri, 27 Mar 2026 20:07:04 +0000 (GMT)
Date: Fri, 27 Mar 2026 20:07:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <mripard@kernel.org>, Albert Esteve <aesteve@redhat.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the dma-mapping tree
Message-ID: <acbjaDJ1a-YQC64d@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qFTg8Y5P0eoJpoOC"
Content-Disposition: inline


--qFTg8Y5P0eoJpoOC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the dma-mapping tree, today's linux-next build (x86_64
allmodconfig) failed like this:

x86_64-linux-gnu-ld: vmlinux.o: in function `dma_contiguous_reserve':
(.init.text+0xbf3bb): undefined reference to `dma_heap_cma_register_heap'

Caused by commit

  3a236f6a5cf2da (dma: contiguous: Turn heap registration logic around)

I have used the version from next-20260326 instead.

--qFTg8Y5P0eoJpoOC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnG42gACgkQJNaLcl1U
h9Dz4Af+LhqPqzv/eG9TuzhUmx6Ahb7ryoeBiqBc5wfunvIt06Gzgwb3nr9t52bx
oLE1S/8mQrU9ZqesRUzW3fO77pzvsYwVwn8SeXVDJaCGzJ02F8orR1eq6ymUsm6D
KGUhDUWZeCrntabp+fQTadKfKZjax03v3t8eqN57hwo2qhhmsJBB8Kym8Br/gRhG
ZyoMUqX8ZKu3MNA6h4GlXkYdKui8s/NH+zqIIJ+TprvOxC+XCsMkUcKqFSmcb6w4
nK2VonmXX4kGNW8862GHL6QVzWoDGs7NYzfQsOKc0EVNnxeWwGApJD5n+/wEGirj
QZ6XamthovVbc3tr/RMaw+NlGHYDLg==
=LmTh
-----END PGP SIGNATURE-----

--qFTg8Y5P0eoJpoOC--
