Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C47141D12A;
	Wed, 22 Jul 2026 15:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784735900; cv=none; b=qlAPFPk8KcriVCEMjniwjT+XsOkw7bxhSE1XXk5AlhCuMVRwCZlCTxfePDCNLymxVCqWMUCRMYlW3hknxwUUrLWTC3Q7L5H90y1Yw1Rziv5iUjwLAdpfFgf4gjUBZ/Xif7u5PiSZuE0IYKTm2ZyPa5YGFDhxzR+yAMsxbr8mA8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784735900; c=relaxed/simple;
	bh=9i/fcTLmhqeXH4t+AWsOWSjC6/6M2VfUmVBDq4APTg4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OVL7qZp/IlnCuPI0iWfKYrIrYvCSuAtZrYihRqUuNNTaGxj/paJg3nS3VCDXuiwps/bbGDHt3IQeei5d7xVplXTXiu3fedo0NOlYx0Q+8RQdeNcj7Is7xqr5IHGCL8tN0MqCYG3PyQ45Z8dV0WjjK2GHqI+lSaLmqolNhx9hAjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iz/nxOFh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iz/nxOFh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46EC91F000E9;
	Wed, 22 Jul 2026 15:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784735895;
	bh=C+ZKC8xKMvJKHXbkM4iLmCXYURHKd05w1P5rwYtOXgw=;
	h=Date:From:To:Cc:Subject;
	b=Iz/nxOFh+PnNm954OqbEooZyXfjMRAoVXoi/Ac/Sc80R6tEIpBzrLb/0AMQiFHEs3
	 sOqMRWxFjuNpWzgqTPSFri2J7eGrGFUmi86G/9zepuo/erXEZnEqewmH7NzMobDKfr
	 n9O+NG59jgzQI/pOm7B6571/R5j7v8I7MMH6ZglpK+ysgd/u/+0ayWAy1U8fO/kiiH
	 gyjxpCPOoGlaT/lYG3awfEV4NBDb1t0Woh58XPOq9J9o/JtQUJ06cuKTL3S5onkF5a
	 Y4DXwylaiFtOVH5lYm1AiMXPiI76lFwN2sUiMHQX/3O3HigWA1JHVrU9cNoyf9KRhi
	 qfWopcsPm6A4A==
Date: Wed, 22 Jul 2026 16:58:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the drm-msm tree
Message-ID: <amDok_0qVLb7IZGo@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qyx3rohW7f5ZlObb"
Content-Disposition: inline


--Qyx3rohW7f5ZlObb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  0aeed866cb938 ("drm/amd/display: Fix dangling pointer in CRTC reset function")

Fixes tag

  Fixes: e7b07ceef2a6 ("drm/amd/display: Merge amdgpu_dm_crtc and dm_crtc_state")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--Qyx3rohW7f5ZlObb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpg6JMACgkQJNaLcl1U
h9B4Wgf/XD09HUp0/5WyTIz9xeE3/AxhLGylE8DZ3ulLJIpTAJ6fuTruJ9WE+4j3
Q4km+pvek2AuWKjLGsJM0Otd+Yxb58D3H9m7KTAHaUAvctA5YoPiQCgAB2SWt0rF
Qjd0JRlf3C4zmfDD6YC9rRf/REn2rbYx+9oBzahOu1/PcEKuP03Jb8i2dreKs09w
6DnarvPGL7AfQti1wukXmluDx1XU2Blg23frqOB6iqeF5xtafQBH9Hxij6wEQRFg
kCUsWLTze+sPy6niqG4khRsjKMlvcbFu84wWywgHSfQngJSLdNv+oYrV2m6t3gBW
W/haLLiXa9UyQOCwHZ9RdE3oSEXNZA==
=wrO8
-----END PGP SIGNATURE-----

--Qyx3rohW7f5ZlObb--
