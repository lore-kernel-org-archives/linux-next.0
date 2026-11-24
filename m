Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509974;
	b=AukfZ4/PUBeuaks9Zz7Kt3BQK8424mHOd4noiHm+1hL0mzk9rUlC05ChvRZSB2ebdl7y
	 yenpKicMMisnyMiMYvxq/LJEq9VUdxCRtLiSN8vAqyzUM91kudT2NKhiJX4Kac4paysfD
	 0pbIuz0ScqIN5cMnWe5qwru1zMq5r8vNAEVLvPLZ+FuEy5tJELDFcLWE2KDskQtPCYwLb
	 W2MUBpv87g2Vb/i1TCXgo76cMmCVoZK5jae05FShBzX3gEcBoRVG+UO/JWF+0VnwufoU7
	 Adx45z7eDI5j5Q15cc/RwHNS3/HwcEyXTbo83+2A/5feH8LuyLi7qFc8HbjEJkdF6sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0TvqhGwoqXKi1btWus3QmSvbkCq/HGEso+gSOvj9VJo=;
	b=tAhohES0ZIWq96ZDkK3RFOCGS2dwxl42IfpZzvLm9oJDDrf8k4pZEv9vDaV9geQtfqsG
	 tWtp6EpWGTwbAZ5o+B1q1XUzF+nLX8bThycn3Zd6rDbz0ek/p+78QloUdwE3q5Os4EiBf
	 KFUSI0eDIhnyhNi/DBCJ3mF6WazM21ysT5SgFd+V3ntiL84DDSDgnq+Gz9NFd1CZeLpIo
	 EqLgBxJf0G7UKtNMOR+2x7JqO7nuOQQBLDQiRQN+cvLvOq6qR1CsL7m72ifFCPkISOFjZ
	 NVTmUaRym3S5pBxAGgcX0fADbm/YQR50Nz8II85U6l+gYndJ9+QXFK+8XoJGbR+B0xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=iPPjisk0;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EF9606A32A
	for <linux-next@vger.kernel.org>; Tue, 24 Nov 2026 08:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69EF9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=iPPjisk0
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso46358395e9.0
        for <linux-next@vger.kernel.org>; Tue, 24 Nov 2026 00:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795509972; x=1796114772; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0TvqhGwoqXKi1btWus3QmSvbkCq/HGEso+gSOvj9VJo=;
        b=iPPjisk0qvM+y8GbYt8JwpGyacQ2fKofc3axRo+Kuza60a63bGiJobj5KMx+2f8aJU
         dUlZy+5BGPle3f3XHsIkPEyNaGFOnJqQ32WEkljcKV9gDVU93nDF9+o/0hEawAjHzt4h
         yzN2S1G6KjlxgGdolMg2tSlTjkooXgm6TIJqfwFnhNpAU/SDhAjLla251A7TphMZ0ZOZ
         JsXtAiTLfrzNxMzB5/cFjw9T/RviXuHqyHhPneq+dEE1RXyE+QsdiV1MYOAmX0mcFKLm
         v6zbnzTrGXcAuNU2cGYXlPyOGrzuod/S/cPN0P9pwoFehEX6sTCWg0DfgvtGZPmz3u2t
         VcAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795509972; x=1796114772;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0TvqhGwoqXKi1btWus3QmSvbkCq/HGEso+gSOvj9VJo=;
        b=bfeWAMM3+TsPbQr96eEIrKjlWxuhL3oCgiU46i+IP5VExuMq6UFCIUXg2AxEb5i/bI
         duZxIiV5Y7anuk9+rcXvKOD35v14fT8T7bJho+BRPjrEXpPGRRW+EC2BoJB+ljmo58Li
         AaCEdkro4e0Q7RFlT5YS9uZDDIlJ6yfwIgmZQe5P4T9a32PCAd5v9iVmhZSUDotF+Pls
         NfRoqKZ028dd+kV5F04Re5LyvINLMdM7CnWkxhnph5HsGMQlPXPnKPmZAzKxMbFBOy7b
         uxcY77xre7iXVWF1/JKFU/iVdLuJN1xrr0UbPrs7OoxGuvecQtvZqg6YmZ23N0GTIpt2
         lWbA==
X-Forwarded-Encrypted: i=1; AL+hErFrUuRfoOlVzbjhL9E6nJKvgPX6V3mpt27QVjbYwFIkFbuWZmGqMA/0Ajk/HpnxaAa9ZxOprWa30Ojv@vger.kernel.org
X-Gm-Message-State: APuU4Z/iihbz930Q8zROdc6e5hiGgQmO0jt8NLWbmXxleyELrJuoC/eB
	UZ08BKzzAeyoJfHzbUkc4a5eU23qX4zeKjLhdLdV3FhXEiLp58NUxM0KmA+P6mG/x7o=
X-Gm-Gg: AZFdTZfHub/7uPcwJjtvXzI2c5cPAqev4RNuow90VTAZXIXsVzbg5WYsQLdzFCdy95j
	8hEzY5A3UrL7b/ewI3COdDSRWCWA7ttI85iudnTbSqQRIxCB8TyT4uUnRbWtGcgeHOS5GsKlTlw
	uD5Y0nbZ7aYVVnG6bDYpG1DYe6qLkhvTQkXFWlRBrn1kKFoPmKzM/+TvLVTFapbSG03vTIRkewj
	EfrFycSu4hCEgwMSjO7bfQH52aIIy+zsQR4/oI2czFSSAw0tOGA0MFNkRFOcqBQHyn6FH9ncZol
	3LciCQUoovM3G3r5c4xvLy3Hw/cuwzH0NBYOx2aAOxpSNgs4Tl3+INewdYcoA30JGcPyyttGvkl
	/0lxR6lqxrfxBTH4YT60v2iYsCNbgU6Y+q7nbsxYL6oTCWfD/BmTNcV388k/QXgJEbF+DRHnxlw
	HQSeSpIW5m3sVnhrkKCFCkEjAmlvtLFbf1l5Vx43RH2FIn4yz7bLdzhVTOu9Qqt8W3DanvO0YCA
	Z22bvt3M5caYAnV7h92fbq3vd1Yowce1qV5FVDT0rt2/3WWYn9/kGxYt0foszLUFXTsgsEpGS82
	w2F+04lK5HTWWqy4bEPN8AdSTzx57piLCzpQ
X-Received: by 2002:a05:600c:4f81:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb88805902mr269806305e9.7.1795509971737;
        Tue, 24 Nov 2026 00:46:11 -0800 (PST)
Received: from localhost ([2a02:8071:6e30:8500:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb906c089dsm218993645e9.1.2026.11.24.00.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:46:10 -0800 (PST)
Date: Tue, 24 Nov 2026 09:46:08 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-phy@lists.infradead.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in the final build
Message-ID: <awVOJ5OgaqN9l-ol@monoceros>
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
	protocol="application/pgp-signature"; boundary="2v7ytnhtnhl44wdf"
Content-Disposition: inline
In-Reply-To: <c631c19d-4fcc-4881-a6ec-9dad24419fe4@kernel.org>


--2v7ytnhtnhl44wdf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: linux-next: build failure in the final build
MIME-Version: 1.0

On Mon, Nov 23, 2026 at 07:29:57PM +0100, Krzysztof Kozlowski wrote:
> On 23/11/2026 18:45, Mark Brown wrote:
> > Hi all,
> >=20
> > Today's -next has a build failure in the final build for arm64
> > allyesconfig:
> >=20
> > In file included from /tmp/next/build/include/linux/phy/phy.h:25,
> >                  from /tmp/next/build/drivers/phy/qualcomm/phy-qcom-uni=
phy-pcie-28lp.c:15:
> > /tmp/next/build/include/dt-bindings/phy/phy.h:15:33: error: expected id=
entifier before numeric constant
> >    15 | #define PHY_TYPE_PCIE           2
> >       |                                 ^
> > /tmp/next/build/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:47:9: =
note: in expansion of macro 'PHY_TYPE_PCIE'
> >    47 |         PHY_TYPE_PCIE =3D 1,
> >       |         ^~~~~~~~~~~~~
> > /tmp/next/build/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:127:27=
: error: 'PHY_TYPE_PCIE_GEN2' undeclared here (not in a function); did you =
mean 'PHY_TYPE_PCIE'?
> >   127 |         .phy_type       =3D PHY_TYPE_PCIE_GEN2,
> >       |                           ^~~~~~~~~~~~~~~~~~
> >       |                           PHY_TYPE_PCIE
> > /tmp/next/build/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:135:27=
: error: 'PHY_TYPE_PCIE_GEN3' undeclared here (not in a function); did you =
mean 'PHY_TYPE_PCIE'?
> >   135 |         .phy_type       =3D PHY_TYPE_PCIE_GEN3,
> >       |                           ^~~~~~~~~~~~~~~~~~
> >       |                           PHY_TYPE_PCIE
> >=20
> > I did not specifically identify the commit that triggered this, it will
> > be some include file reorganisation which causes PHY_TYPE_PCIE from the
> > DT headers to become visible to the driver, clearly there is a
> > namespacing issue going on here.  I have ignored this for today.
>=20
> Commit b28eecc89399e5371483f03fecded33a26a8e655 was not really built and
> exposed all drivers to DT bindings headers. Referencing other headers,
> including bindings, from kernel-wide headers is another suboptimal
> choice here.

If drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c was more defensive
and added a driver-specific prefix to its version of PHY_TYPE_PCIE, that
would help, too.=20

Best regards
Uwe

--2v7ytnhtnhl44wdf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsFTs0ACgkQj4D7WH0S
/k7tiAf/dew2lryT6QqTEvFx5msFUZSgvbIZlgyPgHvK86ZsrbcI2FIIYAap8U1U
BnjjyUNWxz3TNGrPHnIzqdgnG5LNbgBIufAaZW/WQ53YThImappJJyO4iAUtOlhO
pgoWl1KgbgD1DpnP/fwOAFdGo/XXJ/DiTqCdL98crYqs9ySIpkA2+sujb7jeyjYA
f/IWlA0PWvELCPs0Su2uNfuHWPHUz+5w0foyng9Crf4DyYZy5QqhRcN1wBzn69x3
DFXZqCUpE91s+G2BnS1FmoQGrAENkbtf8yn6EaIkdUYWxCI/9HTqixQ8YTegxpKP
MxAM/T2486aerXd9YUCUyw0yfMRgqw==
=gqwl
-----END PGP SIGNATURE-----

--2v7ytnhtnhl44wdf--
