Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E1B367285;
	Wed, 12 Aug 2026 11:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786535413; cv=none; b=QsCNrW+vRNGPECuGaP4294tXrDbrcSIaXR8Upw/hqKey2ijFm+uIGd0u0x3rnBueXYyWs5lGUkbkK2W3prisANN9cmMMr3G0fALtU5bzyPxhI0zjMA7Pux2YFxX4RRerv0eDFjZZ+usagXAZXKZA3XGqT+3t4aJFlDtfkL1BzCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786535413; c=relaxed/simple;
	bh=FOlAW0MSHh4Qt21ARGb3I3FoQHz2CvH+SSMKuNzq/dA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n/yViDOnkSCFS3moZ62ZolQd8D5byRgtyGdCexO1kE2APGzuaOXAxau9XJ7algs/+6mG2qeYxKz4SQXCdaABy3Uqiy3vPH/mZxvANyR5E/TBA+u48vx7gvpSLA1I5lic5g+8T0HbImLuIpChCc94QeMjwoMpitWy5vyXWB7jQk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VNdaz4+M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VNdaz4+M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F8F01F000E9;
	Wed, 12 Aug 2026 11:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786535411;
	bh=0kXCvSG/mhXD8NnlElwbklumHn2etbe+2eot+w5eg00=;
	h=Date:From:To:Cc:Subject;
	b=VNdaz4+MzQKtghNb45lPElR7oGVJSIvDa28wRMej6gGwLG8vWjS4ATbX1fG/BNiRZ
	 DQpQuOqIDY9/IdBqsJnFrwjqvazyPH2f/w5Aw02sOrKR0ntX5s9R2qHLrJPk6Kfr/B
	 IHtqIRohZ94WWbMLLTN/lL1VYJCK1+a9EGTFNVw+QoVVV1jQnx/PzUu3oGt5GdP+kg
	 IXL7zovNw4FtaZt5lQpZTO++4l0UnLxb3b7qYgYreIXQYBzxVdokKRVSEv94CtQ0qM
	 oy4qgi+euGkbzqP8wtP+/dsbsrUyX51u3xrOK5KUtyRxnqGt+WTFSmLUIyGFxjOhpT
	 MZjznAciRttVA==
Date: Wed, 12 Aug 2026 12:50:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the thermal tree
Message-ID: <anxd8D2M1OLWqBN_@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IpMbtMufUAUq3ZLa"
Content-Disposition: inline


--IpMbtMufUAUq3ZLa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  847a49609df62 ("thermal/drivers/qcom/spm mbg tm: Fix missing bitfield header")

Fixes tag

  Fixes: c3dce117333c ( "thermal/drivers/qcom: Add support for Qualcomm MBG thermal monitoring")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--IpMbtMufUAUq3ZLa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp8Xe8ACgkQJNaLcl1U
h9Ba/gf/cYb2LrInRfzd+V9N+FVIzuOTR9KBtsF4ReThWMKTedX0i4Z0HTtWLVDP
k2H9ralGp29azK0WZ4qoyWx+Kbh52qm0xDmJmEgCA5v8m4KivgHhFMzgNey047mI
U4Cl2hJbR7fDafg+6CbSmsj9O7TZn6eCG9vkdFngY/IQoQUTvVt2koxVIC/qHzFN
Yw7DxR2+WI5FmvzFy1wCMsJrph6xZ7IbhRp6vtcAxICuWxatvs12thtL3h85qyio
rpcDMgih13+3cdL4FDjBpVGWwlFK8GgZXawQPKzhWfEZE53QTr+pzyiZweWziglK
ayC1sA5piASxvsmLBh5RUASk4BII8g==
=oYIh
-----END PGP SIGNATURE-----

--IpMbtMufUAUq3ZLa--
