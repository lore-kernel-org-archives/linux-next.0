Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795459028;
	b=Y5DVp4mgbOpV+s4CGDKpHgdWUSXIooYH6m4l6mSXCaxlxqVPwmBfYemBlc5Ku0Y+NJPT
	 k6naVj526wPgzdJVjC7SQbI7QNV/YhAx4qJ9Ijyu63/mn2fCg85TcoAjbFLYzGwbWzd3/
	 X7Yg5gUz6nJ4seCVKC/t+HJanvIOdsf2flJ2qgTOr3qtSqD5Q13Y5r2XsI8sbzxqqnEi/
	 w4hna8qZE89iBL+uxnoYXoKVxaQfVjeAdp9PrI9UDW+CydtsQeyW3wUKJUl5dosWJxld4
	 YaWU9elSgcKlRprszP2NFLKTa7kxS7KwI/yG+VUaJzkQVxXgD0VuReZxLZvxti4BMUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459028;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=looxWG/+q5/Vw/t7DxJr6OInAYdJMZv4YPrI/xd5DsM=;
	b=IVT40Fp/9AfuxZGl++2Vr83JbPBE+0iZs9mrg9M5D8mSOjE0lu6DF+0vIkv8zldecNSG
	 BulFnJo5+VuSkwtGWODEZyZQt7xusS/B8Qjw3xtJfMj1cdTKNzcDcfJo6nEUjPfRCvNeG
	 IfDeFK5hEi0Fh0uepozdhCbTS95TfxdxT/chDc0MlRt0lLQGf9q8rZ5A8850ptgU/+4wM
	 HVllLo+6+UxMTdxJ27txBktvhGe5NVmppftVf+YPhhMROZyo8UOmxeZV3urA1U2TQApiV
	 UJo4KB4WPsSxgJRX3coKQvKhwCN59muoBlh38EYI+MaeBnwUsNruSmcFIuLQrwYacqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BtICSjZC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293F6606A31A;
	Mon, 23 Nov 2026 18:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BtICSjZC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C9E81F000C0;
	Mon, 23 Nov 2026 18:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459027;
	bh=looxWG/+q5/Vw/t7DxJr6OInAYdJMZv4YPrI/xd5DsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BtICSjZCnUxpVNbhjaiGsFc6azflAvQIYz3MxIpoCEKPJIQuMK2PkO7nnGRDAUJIi
	 wSLPa8xGB5STGau4MD3W95LoeHR0WnM/vl0L7nRvR2NRqEx82KQpOZfYXDWzZHreAO
	 vOFwO+6XRjXF8KE7M4flLAezMX4l8SW6dRCfEEpVYd4BX5Lx6t9NOkBXXcNQcZgHVM
	 1485RTb/IL/rccnVtG457EM7rbHwHH1WDzp8fqJB7MnxzFo6h3GOsrDYgnkDB9kThA
	 HV0uX/uGsQiQj/0FqprwH2l2mXf4YdQB9GdueUqygFczRkbO8KPToYLHBDjZAS2sSB
	 cPQPO51xHVZxA==
Date: Mon, 23 Nov 2026 18:37:02 +0000
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
Message-ID: <b7fda918-8355-46da-b7f4-40e1a104279b@sirena.org.uk>
References: <awR7nSOWkxRm-iP6@sirena.org.uk>
 <c631c19d-4fcc-4881-a6ec-9dad24419fe4@kernel.org>
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
	protocol="application/pgp-signature"; boundary="lnXm83msk9DjZBfg"
Content-Disposition: inline
In-Reply-To: <c631c19d-4fcc-4881-a6ec-9dad24419fe4@kernel.org>
X-Cookie: Brain off-line, please wait.


--lnXm83msk9DjZBfg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 23, 2026 at 07:29:57PM +0100, Krzysztof Kozlowski wrote:
> On 23/11/2026 18:45, Mark Brown wrote:

> > I did not specifically identify the commit that triggered this, it will
> > be some include file reorganisation which causes PHY_TYPE_PCIE from the
> > DT headers to become visible to the driver, clearly there is a
> > namespacing issue going on here.  I have ignored this for today.

> Commit b28eecc89399e5371483f03fecded33a26a8e655 was not really built and
> exposed all drivers to DT bindings headers. Referencing other headers,
> including bindings, from kernel-wide headers is another suboptimal
> choice here.

b28eecc89399e (include: linux: phy: Add phy attribute "type" and associated helpers)

> Greg, that's commit in your tree, how about dropping
> b28eecc89399e5371483f03fecded33a26a8e655? Authors probably built only
> defconfig and thought they are done...

The PHY driver is bool and depends on ARCH_QCOM too which doesn't help,
people would need to do a specifically arm/arm64 all*config to hit
issues.

--lnXm83msk9DjZBfg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsEh80ACgkQJNaLcl1U
h9Dl2gf9FCt7MFuVWqJ2QuA0uGRmg4tYheJXab2Tfeq/ssU9WbF9GWal1gKWxWIf
8oPxsX90GwEkJkPRQpJ6UjmPkHH8rbv5WjCNj4lJJjohObVTgiwoqdhsyHLgRe5v
qd3OfnJef1m9ZMMqPgSgwfzOCmsDPdDzOIirX7TLrJqfM7Xem4dcAJfS1yJcm0Xd
IR5pH9o1DyTyAM/vOa/lGT7H1kbm/wVXq1AtwwPyfyx/WwGC3DXiOfXpoPn4POss
tvr09T8051n/ZJzlHtFZ/rwjrTlFslhAGfDI532M1GUk0MI1Cjay5JB591LbnwwO
Y0PVIelL30OBocbwkmUJC83Tn3U8NA==
=c+yn
-----END PGP SIGNATURE-----

--lnXm83msk9DjZBfg--
