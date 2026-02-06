Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70E8288B8;
	Fri,  6 Feb 2026 00:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770337910; cv=none; b=fmdVv94Ac9Ifirj2sLYYuTJRDVPPK/57smh4vHcNuUVRrjihNzHYrA3PydY81I0e2FJjkHIVr6i2uiK2St5hphfrQxubbevrdCPM1M+3yUio1EBXgHP+gKVExvF4M9Yr91EsTj/UOv/HTRu7RkJRkVTIym3+v7jOCUsGPFac59g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770337910; c=relaxed/simple;
	bh=OoHUXofRjw9AejJ+I+SD6VAK0R1tVPEhDBk8j6xypsk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NkB5y9TctnfUpHVC4T73dTUeYIqzP4tyn5V54W/VCg8S1wO1d65NsmCIlYSxJF+NieaXmvSKgcpEbRNtf8gpDZ4RrVWpcR89UCtGCW2et3TeQf04m4sp41lZ2Dkw3QCK9zlatGcorDuSS0VLEXhqdg6oSbVUBvUPJIA4nrnZa3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SxQpGUMV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SxQpGUMV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F93FC4CEF7;
	Fri,  6 Feb 2026 00:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770337910;
	bh=OoHUXofRjw9AejJ+I+SD6VAK0R1tVPEhDBk8j6xypsk=;
	h=Date:From:To:Cc:Subject:From;
	b=SxQpGUMV73WgVmzDaeY0EAgQ00DZIwG9PpSKMTqgyB+cvt+zdWeGI+zAxCO/1m5hh
	 CCrwW12fShDYbF0CeuEcwpDQ0PupOVb7dYD1LAuOJ7zR/XupRPY39tJkJvZLWKHUiA
	 eO/UgGy/db5g6cTv1q9Td75CH1467E9V9YPfbAMjvssjE+h9mdjEJ+8wv/GaCbctqA
	 P3cYRFILR/gDwLpWi/aA5nsjZIFp8HbeYwJGTHb/HtR398Vvk1K0qiLs/ZO2lS5ILd
	 /WkeAwaRdheweiLkTrkwFDBBQ31rXVEGSPykxEmd5d4jp/ntu/3ec9d005GRRpSbiU
	 VwZpGweQ+VkTg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 67C551AC52C4; Fri, 06 Feb 2026 00:31:44 +0000 (GMT)
Date: Fri, 6 Feb 2026 00:31:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Fixes tags could use some work in iio tree
Message-ID: <aYU2cC4wNIvUJdO1@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xxel5ovSl1Hwxcq8"
Content-Disposition: inline
X-Cookie: Think big.  Pollute the Mississippi.


--Xxel5ovSl1Hwxcq8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  5b383bfe2b9c7 ("iio:frequency:adf4377: Fix duplicated soft reset mask")

Fixes tag

  Fixes: eda549e2e524 ("iio:frequency:adf4377: add support for ADF4377")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--Xxel5ovSl1Hwxcq8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmFNm0ACgkQJNaLcl1U
h9AjmAf+IREOTzIWgWSj9IEuFCGkjT5gBuA4iKgGWedM96F/0kscR0HkTyv9CuF8
uIXAUuL7Yiz2hNpeIqUXpiUC6u3KkjfseLwzlBmbTQJxxYU8QrxS0ZvYJCBIk4P5
k917OPwA/AUVWIitEztqCI9VhF8EaVQtV3UES3BlpwIPbp8Y0OFobg4zrJFa2wFO
MkGaQlHAA4oiqQzXNvMDi5g6KTIm36tYvlPSO6og3cvtEHacMgieRoL51FqHtfO9
O/ssepCweZko/0f8cBud+fl37HG+m497JJVnVJ4tqqCPP5HZKGcn9hBBhUvX9Cro
+k4hrsrhlz84Rh3qYKQHRGAPUDK5gQ==
=B0aj
-----END PGP SIGNATURE-----

--Xxel5ovSl1Hwxcq8--
