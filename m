Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED9033B970;
	Mon, 13 Jul 2026 13:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783949473; cv=none; b=JQy1QAQgxRKL/hTMo6tY8sRGadnevMCPu0RVJXPLVM4NGKpumkXkF6bO7joXLs773C3ogifESukIDvfh9/etki5fzKykSHVpeBl1NRumKrFP8qX/wbEft7XJMaujjT3CV9ytN4g2eRAKy1fTjHg6wmeUURK2PXIWbtf8Kt32FtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783949473; c=relaxed/simple;
	bh=kTDs8WYzXwSWzlf+2nIWqUjl4hw5W1tCSPzBl5Gzgmw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hm3mzeYFinsGA5VeQCkQ57nSBArpJVwm3Eg2v+51h+6pvCqskqEjyGliJXG2YJVyhIY++wF0V7caaUuKL4ZYHoYt3BFy0szmFY43bP1W0LYVtyb248IVcaFbJeWY4dF9SSlj2ejy5LAnR2Zv856UJikE/KhMY5sLb+lSf0b97Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AWDiXeib; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AWDiXeib"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64C0C1F00A3A;
	Mon, 13 Jul 2026 13:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783949472;
	bh=XmdfXt6/LQL/1urrjIUugrHXGUcg9sAxCHKXwCoDvZI=;
	h=Date:From:To:Cc:Subject;
	b=AWDiXeibV65Wxd3l9ayeU6ecrgOV5JWa5S9PIr53V3sHLroliJDQSZH+HIW9boGzp
	 Uh4qF6ciEZMWVwSZR13lUXT30rSLLLljT+MQHeKTHy7BY0U0XSD6sYDZOZqzFED1Pi
	 woLoor5w56U/2CZMyKqfrAWPkwQtwtYXKN9tCL0nyyykxkJCg/UJnpsP8Xu5F7vZJf
	 Fy8pzlldALjq8RBIGNdrOunWqFCyzH4JnHBmXmesRsfSI8TUfaL+BZecEgolBDfq4V
	 5fdf1iPEs7ZfoZ6uAWdx4yfSV8ohwwy09FUPuTnaMgGy8SjHQl1tfMcgWsmf6hhn1E
	 jJXplwlVG64UA==
Date: Mon, 13 Jul 2026 14:31:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the rpmsg tree
Message-ID: <alTonG3dKz2B0weI@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J4irUM0YhKdwIQyF"
Content-Disposition: inline


--J4irUM0YhKdwIQyF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  3dbc90b9c22ea ("remoteproc: qcom_wcnss: Fix handling the lack of PD regulators in v3")

Fixes tag

  Fixes: 65991ea8a6d1 ("remoteproc: qcom_wcnss: Handle platforms with only  single power domain")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--J4irUM0YhKdwIQyF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpU6JwACgkQJNaLcl1U
h9AuVQf/dUjTG2RgXS5F9yeWMSv+EfDPbm6c7gES9c94FDDz7zDeEdLIdXGz6JK9
1WG0Oa9HU4+c/M+kTA+vKvVFJpbQh17UNQdmepsdkIkmfTEl0Te7f9VsgddEvkec
MG/+wzkZ0Op4IJ1DO4TLZRSno8Q8/JPGiPavw9HEJLTUe3ddEKuKMdmSPY+rMKvM
m4UvDnBR5kg/hIxPpwNXA005paNebW4DZ9azHsF2Jx57kUHM1lmXNmu/eHaSrrED
4Usu8P18KiUzKMC7K+X8+yYPRQDZ2JWsLBn8lQ1nC/Z72/Z3X/JNX5bpkjFUmtg1
5l+NaANsCRk6ql/Zx9gVNJbeu4EipA==
=iRQC
-----END PGP SIGNATURE-----

--J4irUM0YhKdwIQyF--
