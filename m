Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47943345CA2;
	Tue, 27 Jan 2026 11:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769512225; cv=none; b=tUyuQO8Ps5QLZsQPladBnh9FuiBBO1w24MiTFJrXtL7TVWlPt7vxHENQE/GEAMLHazu7XZOc+mOisQui474zD3BkqlmaVPDulrMlLGWL7BgUrJnyjVoNRjWcooie049qwlNgf49oSh6j4y99XHkLuWuwuu6CGmfW0op8MGKn8ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769512225; c=relaxed/simple;
	bh=ghE0PV6MgbDOIunX4C/dCjhWcjwFHGSYSnXY9jCVIxs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GNPq5dAQlwYxVQa6BdxzUWs3GkZq4NmxR6vx4C9mEXD0tGvEV1xdu2eJ/VUpO7vpJ4QzCoIFtZDW7VN7EfsNeQfMQRuJzS4yXlQIjqL6v+pONAtWUqzetd7SQmwVpbRG6xwVRxCVbZB/9fYSL2eRYTwlOFzHJgxZjIYyWdPwWAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IvFxtKx4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IvFxtKx4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB17C116C6;
	Tue, 27 Jan 2026 11:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769512224;
	bh=ghE0PV6MgbDOIunX4C/dCjhWcjwFHGSYSnXY9jCVIxs=;
	h=Date:From:To:Cc:Subject:From;
	b=IvFxtKx4VCQ9+taAJzXnxvFpREBvVfvq9lmsSfEjV9Qf1hWM8vHfdU5hs1bdHvUMH
	 OVxZ+YCrfoYlajmSckilv6ldTopjyg5ymuWcL4rWW/xeZAs0zIu4sniAXcQ3RjttqD
	 N7O2Lql6lxl5l47UqgsKPTmAhKyX8zRuV4PXzuhjrpKko+oq7nCwMLUdz3oxEzQJI9
	 5ov6T6Vlkav/JXYKXcriClkv6sTZiK0eq3gTsGb7A6dgmYY3VmUMvipsjuA/eYS+Fk
	 kUsVlJwTJX3fjXrBmsDdktJi5e+4vEz8O9qQV6WH321If2TfYsV1FFod/2wO4eRpS3
	 kqy0pQjZffvNA==
Date: Tue, 27 Jan 2026 11:10:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Fixes tags could use some work in the drm-misc tree
Message-ID: <2951a9c1-3a6a-4f96-96b6-8cd49b5c0eb9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="noIxOaML5XedF8uY"
Content-Disposition: inline
X-Cookie: I brake for chezlogs!


--noIxOaML5XedF8uY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  6ef93f62533e4 ("drm/amd/ras: Reduce stack usage in amdgpu_virt_ras_get_cper_records()")

Fixes tag

  Fixes:

has these problem(s):

  - No SHA1 recognised

--noIxOaML5XedF8uY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml4nRsACgkQJNaLcl1U
h9CXLwf9G0dTFjqQFNplLJkaEoyt/k67OYGOYLOCGjOBNcgxNVSU4bc/j0+QKTrS
zoWh8WGAwDFv4b09PfnXfzVZ2t0gK7Ls/0Fg9/ZdBRFWKUI2wzOluIp6m46cSBzs
3tIx1Uqra8uFqKARThB13s6/as8+UtMt/Jhp5rN+p5/9PWO6aWZ/5MlfA5JM8C8N
iCBkObJIv3y3DM7BnRYRDC9vIm91QQgJaUNGVj+OI7aLW5qqn7l3Wv2dOUS2TiwN
cCydaksJy08Ia5eJUhC9dkZfqB/4UeUTUOJurknr5xzXfd2DymkM7jab6qU1tncS
eRywKtKosxvdFKJMe/iP3mFlIc2kCg==
=pmUD
-----END PGP SIGNATURE-----

--noIxOaML5XedF8uY--
