Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488582F25F9;
	Fri, 23 Jan 2026 21:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769202011; cv=none; b=Hg3W79n3djGr8SCNb3YgbcvodC0KgO9HQRVBKeWVnZYs59biYoyCzD8cprqDyjKTj/NAMjHdDtT46SAAOvskv/MOkN8axJnPvbP7Vcy2tNEc5czAVwA0tqY2OalGrLkGcT3yFvYkdfuSX5gaWxMmHQWbZPEA+DtHMuZF3tP0cGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769202011; c=relaxed/simple;
	bh=Hezi1EIMhrtWMnsl13WmtfSE84WxOICVrAgK6WpR7Bg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GFtMOx931fVaJEUgP+ju0RtjmfQjh1iKWeiPVbF5vJeZAcxtcXRF720PSYL9VK1SUK48kBtK7cSbjbHktlvmmLpPwDTtk9lyjYTFncPn0SAyuDsghEhBjDI7Ksj7ZZjYQXkNh48yna6/u/XjJDBqw7d9iEc1EYRrrslhoO0gUBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rjd8G/J3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rjd8G/J3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E68C4CEF1;
	Fri, 23 Jan 2026 21:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769202010;
	bh=Hezi1EIMhrtWMnsl13WmtfSE84WxOICVrAgK6WpR7Bg=;
	h=Date:From:To:Cc:Subject:From;
	b=rjd8G/J3gYT5gGp/+gUW8MAio4FQ0fCYyApC6bMjaOfrRfGEw3D6KKdbGXbQqNsFw
	 yBdS+gnq2VrmaRnr2M17aleIsXbF6dl7JpDsm1rfvPtGSfAGlKlRUwOuE0xheoyisk
	 RmZH/VpMI1W4M3iebZlhMfXazoS2ZKXXf0tHLgQhtqcYeTJsQW9ddcErlW44S9ZMBo
	 74gOJhEESBmy57QLstfDPaDiTkCSLInG7SnPkh9INWtETiMJtClZA5NN2IFJJ4nWss
	 ArjfVQU8oPUpDXjdMbvgp6Pqhydx4bz5qsPnmQ15GulR4Ve5pSNKJA4tCkUG/9O4Gc
	 2Wk6QIOg5+zmg==
Date: Fri, 23 Jan 2026 21:00:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes problems in the clk tree
Message-ID: <5490b0fb-6754-40f3-9583-af514404ef94@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jNwMRaJO0lTEI7H+"
Content-Disposition: inline
X-Cookie: HAIR TONICS, please!!


--jNwMRaJO0lTEI7H+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

In commit

  fc5d7e7ee6812 ("clk: milbeaut: convert from divider_ro_round_rate() to divider_ro_determine_rate()")

Fixes tag

  Fixes: fe67c682f91c ("clk: milbeaut: convert from divider_round_rate() to divider_determine_rate()")

has these problem(s):

  - Target SHA1 does not exist
In commit

  7468ac0ce2626 ("clk: bm1880: convert from divider_ro_round_rate() to divider_ro_determine_rate()")

Fixes tag

  Fixes: cf1d95fa0c64 ("clk: bm1880: convert from divider_round_rate() to divider_determine_rate()")

has these problem(s):

  - Target SHA1 does not exist

Thanks,
Mark

--jNwMRaJO0lTEI7H+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlz4VYACgkQJNaLcl1U
h9A5MQf/ZjAp+TeOSBGMgR1ZkhcHC//f8MF5119TN8UL8Wfr4H5tYtJhvni3uGZx
rePnEIf1MTLxWUtWcVkaKvBNMH8Y9go9N2/8wIttrTb5tyC5/ccb0EM/Id7Fnv0W
E8P7MK1/2oU1ZTu61ZI1Gti9OT/3MiyHRF1Ukl2YTtB8IT2GziYUuatY09oBVzmN
/0Zgap8e/p/eV9J4dBUHuk1lcQWY85kylgVMshbttndHMPeAKHawcwRGi/qOJKm6
P/8k/J528MqH8j+O+il9xaVeHWd2rI8yhHS+J2Zz4rQfjMrSclcbmEKyzZJVp8OR
anxOBPBaceudvuq0YVWfoKcRuSAKNw==
=J9Vl
-----END PGP SIGNATURE-----

--jNwMRaJO0lTEI7H+--
