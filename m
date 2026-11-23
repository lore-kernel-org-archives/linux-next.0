Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460319;
	b=UzOYtnZIME3H+uNecDidTw88seqlRQ36tDNwVdtSLc4S+XyeI9CZojpzjAx8lHIWzdie
	 PWDdZeaKT0Oad8MnXt/M+sJrgKYfcpg/VmTIeJWthRYUPNx5gdMGabLCGY4PgDzpOJL8u
	 NRXeq0tM9jhSqEj3JutS88CAaiNyj4Mt2tQ82tZEurIXGdG6Pn+FxpZh474SJLURMAOM4
	 bZzl5D5M833pTGU4y/lF5nQKIm6hTxIvxTAsOzMT22y4D7Imng9IBBYA1vMFa83ONOeUN
	 olmqWgLg6Fu6HCxfPCHbHOPQ6Zl4Us8pBfDyN871uvwIX0Lfc44stecIa9n6HCp97CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460319;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=tJOy9chWcf1B/eBZf8s61uqXhDY/6IDo4JHJxgUqU6M=;
	b=1jLyoZzOm6whF7SUwvY90d/luD37E3h0fGuuzWoaUJ1HIsfkavM+WDqQdQmUgE3GvHJ2
	 sm16dbcIwZLKTphlybNpDDPVX2HpJU3p2XuxSavqTlZOq6eGUnB0ZkBqzgk7InFMuaGQl
	 I78D8q95JifEl00Gj5eEhsXJu9BjfCA12aUqybMEctvgqQ1GiPmOBmdRYu+UUqA6JKbqW
	 lhfLeTbNTWnYy4QWhjvDn9OHlFgd2ljN7FOTdVNw7yoLAPyqRvzsxM9A5s001t7/d/P9y
	 /eITRuMYC0pWMiQ++ZLLvBw6nIWyakXY/RyaXg4b91QKctQU9OID7tZCvTcBt590THg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EefM0zUu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C52F606A32A;
	Mon, 23 Nov 2026 18:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EefM0zUu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B9C1F000D3;
	Mon, 23 Nov 2026 18:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795460318;
	bh=tJOy9chWcf1B/eBZf8s61uqXhDY/6IDo4JHJxgUqU6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EefM0zUu7zrgeVI03cAMLIWcfyy1bv4NTQcIc4YC6Q0SwkfnHHgsq01RG7fZcovdj
	 1WEoFQEUaxYrhk+cZT33wyBLwGNfbLKGQ+Jovk2S6EgOWG3a3ims8Dsj8+zPjTgElP
	 3Sy6ctlGJD8FAZ+Ixj75WJ9Hm0Lr/wMXFgX++NFPfs7SrMdTeWUfWRDqwX8ZFl9iiR
	 alLV21Z3rRtN1UtnK37Ms+jWqvBJ0cdWFFm34uXiwByo6dlFoebfH9Z1/JHY39Uv0o
	 zU4ILWEfw3U4huiXM1P91Rr+y+SzWjjHaobI0F8a2TadqZitgSJIWFUIPkDKDW9WbZ
	 d9AmUVqC375Fw==
Date: Mon, 23 Nov 2026 18:58:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in the final build
Message-ID: <0af7abff-2c33-4920-835f-9c5abe73b143@sirena.org.uk>
References: <awR7nSOWkxRm-iP6@sirena.org.uk>
 <c631c19d-4fcc-4881-a6ec-9dad24419fe4@kernel.org>
 <b7fda918-8355-46da-b7f4-40e1a104279b@sirena.org.uk>
 <2fd6f05a-6dfe-40c9-a7ad-44c28af8584b@kernel.org>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="texP8MAS4Is3315k"
Content-Disposition: inline
In-Reply-To: <2fd6f05a-6dfe-40c9-a7ad-44c28af8584b@kernel.org>
X-Cookie: Truth is free, but information costs.


--texP8MAS4Is3315k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 23, 2026 at 07:42:04PM +0100, Krzysztof Kozlowski wrote:
> On 23/11/2026 19:37, Mark Brown wrote:

> > The PHY driver is bool and depends on ARCH_QCOM too which doesn't help,
> > people would need to do a specifically arm/arm64 all*config to hit
> > issues.

> Sorry, but that's trivial in this particular case. Whenever one touches
> subsystem wide stuff, author should AT LEAST build that subsystem, which
> is trivial:

> ARCH=arm/arm64 ... make allyesconfig -j12 drivers/phy/

> Followed by W=1 clang build. This is bare minimum and is fast. We do not
> speak here about full allyesconfig build, which requires some build
> machine, but basic build which my laptop did in 10 seconds (I mean, 10
> seconds to spot the error).

Yeah, the issue here being you have to specifically do arm64 - I know my
coverage builds tend to be on x86_64 since my development is on arm64
so it's much more likely to actually turn something up.  It would be
helpful to have better compile test coverage for these drivers to help
avoid such issues, the easier it is to get the code built the better.

> Author simply did not built the code they touched (by touching subsystem
> header).

Clearly.

--texP8MAS4Is3315k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsEjNkACgkQJNaLcl1U
h9CQegf8CHtuYsaEu8eFD6mRroYOEt27uZXABnp07hNveHzsId8nED0jOuNoMk2e
MnNi/wGLaqQtsehGJWl7S1fs++dXtSIzAyibGU5GLrhAtYIqq6VoCkAarNjnBhbZ
WrwguKj00aP8Iw96AKT1FyeHdLE0heDIYFT55wAUKU2GNeJEzOJRGzXd0BTjslkQ
izla+FQKdlEk1aci+rOZQdDqvcJnvhDTmBGBo12XIYs9vOLzmB4R0RekRbL3hMVP
zAOHfvc+CkgBoFJOSzz2gpoVxIAVXl9HmfCqenBLqZEa0k21Lbv8tLyNZV9A45vg
eIISliUcXh264PN6p6uBn8ufz03Sjw==
=xicj
-----END PGP SIGNATURE-----

--texP8MAS4Is3315k--
