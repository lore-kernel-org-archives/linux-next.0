Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F7048BD3F
	for <linux-next@vger.kernel.org>; Tue,  9 Jun 2026 15:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019018; cv=none; b=PRQ0xciGGtHPKqJ9bKUrYfH4zGp6QLK+LDPOem0Lpw6Ob9QWEOqqIoXc+DksAd1xETFlBrUM2MK+ExQN57EBDDw+6qxoi6Y9RxjbL1fTuou2Hr5Dj7bE2zHeqfFzyUQ2q3b9FFu4Rgzv8Yym7MRtp86pB5ClbMLrWoaK7fprsDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019018; c=relaxed/simple;
	bh=8YEABsYOyRyVhz1jZLAH0ekWV3HkY6xbJb8nZEET9zE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CxadGBQun6L4LDfE5gTiojoBeVEGUFz07ULEDgoYoIoILHzs5Q9ivq/Ghbn93z6DRDrWMAaPbfRvJFWcnrrs5mNtaCLp7OLQ4Rd0mjsAERv4ij4X/KxroGY85F21Ae3HbbwroZ7qeXTaM0kvd7gmdGgErUDpVu/hBok6Zo6KQPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cCUjDeKb; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cCUjDeKb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=kHim
	WTvTCs+9lwY2woCGfN0ICeWwHgvMAlWb18U88pc=; b=cCUjDeKb/ukp3y66w7Wv
	JiBvmxCYHbDck+cYgQGPw4E4pHhdsEkjdybYjFYqw3vQmwtBF9Mce63hF8kpQdAY
	dDpRwts3S58EgwCYhAg+n626IrncGL8CCspVtvB2ff9b0N+nqudwNKX0RLJWxdn3
	JseAt/6MBrFQ7C4s0bmZiu/9i7hNBk7NGTS2aBGbRHlMmRWzT2KWwe1l1kQLp1Yy
	3LfD1MyC7bccwGlQ3i5H4MtEmZO3QgqP5FDBz3Fsqc0jJDfBkcmXxvBBhAsVeR/w
	VWIE+vZ3jk+f7bF5VMgkXCCPsL02liusK9oYjNz2gjPQj02eWOw9/FNos63uKMoW
	wQ==
Received: (qmail 1332212 invoked from network); 9 Jun 2026 17:30:12 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Jun 2026 17:30:12 +0200
X-UD-Smtp-Session: l3s3148p1@8NGMzdNTOpwujnvA
Date: Tue, 9 Jun 2026 17:30:11 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Mark Brown <broonie@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate commits in the i2c tree
Message-ID: <aigxgxPuNZYT8LGe@ninjato>
References: <aigwbaQTkSzXbOBT@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fK/qGHdS3fdYOYvO"
Content-Disposition: inline
In-Reply-To: <aigwbaQTkSzXbOBT@sirena.co.uk>


--fK/qGHdS3fdYOYvO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>   07d5fb537928aa ("i2c: core: fix adapter debugfs creation")
>   158efa411c5711 ("i2c: core: fix adapter probe deferral loop")
>   2295d2bb101faa ("i2c: core: fix NULL-deref on adapter registration failure")
>   3c7e164344e5bc ("i2c: core: fix hang on adapter registration failure")
>   3e2041ea586ae3 ("i2c: core: disable runtime PM on adapter registration failure")
>   8ce19524e4cc24 ("i2c: core: fix irq domain leak on adapter registration failure")
>   b1a58ed9eab146 ("i2c: core: fix adapter deregistration race")
>   ba14d7cf2fe728 ("i2c: core: fix adapter registration race")

These are already dropped from i2c-host-fixes.


--fK/qGHdS3fdYOYvO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmooMX8ACgkQFA3kzBSg
KbZivBAAtYW9MiHnLZKKQ/EKZWsNgpoCsd7wJufwR9TaiCLYr6+r/B8zclXMEYuK
ovnGMeNlI5SoeD4E3APkTmIYhttCwPC5kIEqe4NjJm46MqcKkYu6kMLxhgukhreT
rt1K5JSlgyZhUSGJmBEDgVkbzlGchubE5+LvrXfQDxTM+vCjPfsUQ0dT6e6ixzyP
cNlgTjE+nXwWnB46w81i3mq34Pjm/ADwWjGUQVPodXX8vsaMtX8pCu0M+dn5xUBm
9ERv1qI2UBRV9aE/L3faG5EWlwQ9y5rOf2HTcX/ma2g/X4NagbDmxVKUgRZIYnhP
PczOZAa+PNrbDt4VpkkCdMw6z2ApTNqX4R/ZVJhH0Vn4EGVOm7YFUIUVWuOsm4fZ
fEDGIXeAcKOPDMxZAak9rJRP++DXEJm1mc/4iZXzfi7hYOdz0oDV/o5wkQkd9wC+
ZBIZtfgKozeDOYlSLBZYUO5CSnFgofaeodxv1812Z98B9m3zjKUf+HZv49GeB6yy
76z+fyciYs++JU32upAE4vAaDyXeqyg7EJ8jUueDuSaE0Wglm5gN/Gk4Y+/htRBN
eSPPzgIK0Q37yse7bYD7iChYrQY6EBtw2o66BJyjyf/1ipl05s7M1Z94Qf5mDbvJ
QJErU/jGdiF3Tk7iID6dHS0cMWh3ODLEO2f8O+jxNLtlQO5ztIY=
=8Bgc
-----END PGP SIGNATURE-----

--fK/qGHdS3fdYOYvO--
