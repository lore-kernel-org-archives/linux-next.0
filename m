Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377BE448396;
	Fri, 31 Jul 2026 16:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785515159; cv=none; b=Mq0wMpguwdgH+z551HaY497hapERlwg4l/B6rAdE0+ycaXOFWqFnSKy9DRICQ/tGrn5X0osU29pFCwVg6aL24HHqifJAIVAhB5MMYN7Q70YJXAUnkT1D67QKs9NfA0PQxjk2wOZnTEUoHkJVgR5J4mZ5+w6ryV8NUjLLRMErx9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785515159; c=relaxed/simple;
	bh=J4X9XJavjHvAd84D5PJT7XsuXij064W2Zq/gFO544kA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EYJ3xqclYEmv+e2Jtt9xCElyCb/EeOfsAXy9bwxLUB6E8EtaJWtJ/X+/I+v+mwUF5WQMUl16zUtgjDqq9huKtGtNtWMaJOL8PRZcm9JJy8wbPsM/UlQ5oP1r/SWe9w73Mghbfv+0DdBV/+CZqUMm9HMQhNZDxOX1HlxvuvIvtZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LfvPvzlx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LfvPvzlx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA0B61F00AC4;
	Fri, 31 Jul 2026 16:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785515157;
	bh=maoOh71MZmKC+yOl0zmIWaZRwvkmLrD3oyTz5uReoA0=;
	h=Date:From:To:Cc:Subject;
	b=LfvPvzlxACIDdFRXQJQ1ouHRHiLrR5CewB0TySzT+OsFarIjq8O2GA97+AMH3lAcp
	 VEaYUVtBHIeeLceqPghmVCdCHcvN9U1L61nBRqXlC3xGz+LaouMJSAhEw5RS5GMBiA
	 dDoehU6itWOl1mleLOdN4RJlLkWYvivN4qlp1XRIFu55fTNHFxaRsZyMFUrUGmKqSi
	 s8FegrM22dTPCQAQKYeex5U1/lUdMrmHiMSpqcJ1biZCotnuur9B7pZUukgvPfimBv
	 NmSeUYlpkFfSe+fnp4FL6OuL004hGMwwtGYzlhcKXdqaV6fthClETfZ0Q7dvfNJGaI
	 37Dj9ccpe+XBQ==
Date: Fri, 31 Jul 2026 17:25:54 +0100
From: Mark Brown <broonie@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Alexandre Courbot <gnurou@gmail.com>,
	Brian Daniels <briandaniels@google.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vhost tree
Message-ID: <amzMknGYfJEYTfbQ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DlJLMAe6Salua5QZ"
Content-Disposition: inline


--DlJLMAe6Salua5QZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the vhost tree, today's linux-next build (arm64 kselftest,
specifically headers_install to allow that) failed like this:

error: /tmp/next/build/include/uapi/linux/virtio_media.h: missing "WITH Linux-syscall-note" for SPDX-License-Identifier

Caused by commit

   cbd7147ab4059 (media: virtio: Add skeleton virtio-media driver)

I have use the tree from next-20260730 instead.

--DlJLMAe6Salua5QZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpszJEACgkQJNaLcl1U
h9DSzQf+JutqP02WJ9z3roq6UPfAxcheUejRJJJJ261K1aZFSNpe5NPkQXBmg+yM
SpKL+MG3fMQRcfdwG+99KXSZ+x4OLPqaJ2rvXVkhaNAMoIGapdJfdP76/LavPop4
9BamM46c8nFxt1sZXiiRGmfpa+lDW158tz+Uux/XUb+mmcSZJZLd50+DYKggvXZb
Io1850TgXDWoUq3uYe4h/gsnms5iI62aqZOlpcNw4L5kqFziebmvU52nYcLCL9E8
docvell92mIKbLmUqt7fpzRjyJ0hOI46z/CQnXBqF2STk9Vo4o3RnEoDSDIg7YXd
cp3ztYB+t1oNrNeuMYyCgixEwIxCUA==
=vxZ8
-----END PGP SIGNATURE-----

--DlJLMAe6Salua5QZ--
