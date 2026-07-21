Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8073B494A0B;
	Tue, 21 Jul 2026 14:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784645114; cv=none; b=jlYDPi360BGL5hFFewjDOAO0uc38NnrCP3zbp5VW5nmG9Wsw4KCpC5CUJOEx/41DbOmX8rzWf8J9PIDID8E+Dbk6dQRFK5kbEVct7hMgQPzVwWSgsB8LbUZKSDkmDZyG8xkNx2CajDxAm8iGK/cESE+qzr5ya3n0KRRw3KmRR/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784645114; c=relaxed/simple;
	bh=MPEQjKmczSbgWH3SVy1Y6ZpkoCx9g1/uM+LBay9F2as=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nYOV2iGs1zqPfC2j6rdWCf1i/kphynpd0ncoFlamV5miPc7818Bcj8291Y9jPTSGap4xa7Ht00zow6eyHkLDBHDTXSTkHscYOHeLSV4lOm9uJZQAjH1UOwYFMT3sR3BvmYvazsgeeJu4Fa2bjxEb5mHY+BXaHIvt81Rm/0jWbRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2RyW8es; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2RyW8es"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5CF31F000E9;
	Tue, 21 Jul 2026 14:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784645113;
	bh=MPEQjKmczSbgWH3SVy1Y6ZpkoCx9g1/uM+LBay9F2as=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X2RyW8esyVsO8tgd3Kp33J7kKBLBZy0ahzWcGPuvs25BJujvQOxsPLK+Av3tsr8kp
	 7yOzxjyPFcvSSFaogIkLksxD8zaHyTLXmYGP+1iNlU2iho/qFDYuJiqQFZguGlPIaE
	 +GnRELXI7QB9jHrxCS94Z/ces4QZn+/0m9wkxdhC1hJetQSM2feO9W3RkdcqxEJgu2
	 F5KvodvqtUzwQX8SK+NrJqNRNWHwsHruS03CxoModBLyGRJpu7ZKF/6JUYwnhbywWh
	 SE3qtFdmurhVyrJm2ksDW3pkH9NWXWLZxSYM/cyKfoYu4TJUK5ANCDdGkYY8UpuTsM
	 PT/cdZvPecKDQ==
Date: Tue, 21 Jul 2026 15:45:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: David Gow <david@davidgow.net>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: test failure after merge of the kunit-next tree
Message-ID: <7c8d152f-efb9-466a-9e59-025f1cd26232@sirena.org.uk>
References: <alrCeerj_TmaqUuP@sirena.org.uk>
 <60e97b0c-701e-4b32-9056-32994fb8088a@davidgow.net>
 <f54627c0-83fc-4df4-9539-e9df051cf2e8@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wQAfD0SBU4P2bBpe"
Content-Disposition: inline
In-Reply-To: <f54627c0-83fc-4df4-9539-e9df051cf2e8@linuxfoundation.org>
X-Cookie: Love America -- or give it back.


--wQAfD0SBU4P2bBpe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 21, 2026 at 08:41:29AM -0600, Shuah Khan wrote:
> On 7/20/26 03:01, David Gow wrote:

> > I'm pretty sure the fix for this is a part of:
> > gpio: kunit: add test cases verifying swnode devlink support
> > (https://lore.kernel.org/all/20260720-swnode-fw-devlink-v5-1-ec250ae6af91@oss.qualcomm.com/#r)

> Thanks David.

> Hope this makes it into linux-next soon through gpio tree.

Whatever it was the problem went away yesterday, though sometimes that
is just glitchy tests.

--wQAfD0SBU4P2bBpe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpfhfQACgkQJNaLcl1U
h9DAhQf/Xx9xpk2d78JZgyKa4UkA3E056L4cNRebgCBSnl0Cel+/WghI+5ptugJj
WbbVI/nBGaRlW/F6jtq0VRwSk9LLv7kSdAYRO2Z51Amc3QQHP3/3a7MbLuWYE0Pa
XBhxVXREw5uzrnRjmJ4VnAVv/Je4elFqyciDrd669cToJMn0cje8G7zF+nDyu6nI
QRsgjIzBgNVjJNDMxPyyEZ1WhRDkYZcWf1LibFxfGXR7Zk8eeWsKk7gWsFUAs9MH
NQaumBTJRqdy2gOzmFHrRmcrxYrLl7weuzbLM0GNaMW5r19JzzSwKX7MwRm0e4dU
ZmJqFmjg5eR5MX97/oYgvj3bBs2blw==
=EPwF
-----END PGP SIGNATURE-----

--wQAfD0SBU4P2bBpe--
