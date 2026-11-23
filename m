Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455906;
	b=uhYSXBJb3pMaMANxgsXxJtX9y3azrXg7drkB2CqJX/rskSjSmUC45PjlYDrI5H5+M9qM
	 C49ohfArQ8/608LWLJIXq2FDvPM5WyfyjE9GQlKYKy6ztwZcCYev6bI2kHOs17HlaeKYW
	 L+FFVgl+wMv+skYD+wB3tiU/qQkWheC6W1By3JNojab2KdlO904G6Hy5xbBVoLYR7mcyY
	 J9L9N7FhqJiOnRtnqydt5QOJD5qH+0x8dHoewPTTlWsrBkFEq/djjM7t94Tjo6264ZW05
	 cVFO3H//AqqEG7ojauquoQf44gQUmi0VPEomsSmWd/xKOECgxHSFozX5pq5EJlH8K4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455906;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=nLNqxhvAVwdAw8dAHf99r/lF3vOgN6havsFWG39HPFs=;
	b=AOIPLytQXGA4sGlMW0Ykw9lrFN7DmePxOZoBIAXoiN3NER39v3mrPnIGrpRaA5lBuhsd
	 JGLWmg4ddDNtIXSic0r5EOpwXL+SNO/T/LcScVc+dD6Cgm7cg/PGJmIS8AM7zZmibLgWl
	 3N7fwN8Gw+XewGUo0tHfuA+r+w/attqzn9xwZJELBRNeucgvZ9BW8dtTAmmhM+PQwvE25
	 SE9TYaRlaMN8kis+8YEUmmu7yyqTaQSxc4rBzq3Minh/bkTDV4+E8RI59hUmkrxxCrvVk
	 AOg+97v5uGtho8+zCzqLtTKRsceZtg/2mkp0bCZjnZzKfIoufArZ/Eb+HJ1YpKWkSMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="DNok/Xj+";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5392606A31A;
	Mon, 23 Nov 2026 17:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DNok/Xj+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 357AA1F000E1;
	Mon, 23 Nov 2026 17:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795455906;
	bh=nLNqxhvAVwdAw8dAHf99r/lF3vOgN6havsFWG39HPFs=;
	h=Date:From:To:Cc:Subject;
	b=DNok/Xj+as6Zve1Lal2pZqqRF4jL50kBlQ4/vZkt8zMNeyNRa0F7+6GP3UOdevG2W
	 r7qhs9X/PT2HQ3BtCjGM4HYQ59VNImMso8YxEBe+YhClSSH9UJGRRwkHkeKkhCf5sw
	 7XfHbOVkEU1KOFwKMSkG9KrP5fxijy6iCbE1WmOCIc2VVTDvk5Cmj8mVFNIk+lQQmA
	 03UbM0geD86nZZ6btyT5IVdGpvA8hHSWJ08Q7JSttWhY8Ryz6R1JV4Ko8sAg7A7Mva
	 nm82i2zvGRcpMgUALh6FSc+DHFdTMrhKBTrdyXEBzJ1SdQqvdHUMkl+4I76cql0/rp
	 wAA1o6FrAh8Ew==
Date: Mon, 23 Nov 2026 17:45:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure in the final build
Message-ID: <awR7nSOWkxRm-iP6@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="Vve03y81vknTHsUY"
Content-Disposition: inline


--Vve03y81vknTHsUY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Today's -next has a build failure in the final build for arm64
allyesconfig:

In file included from /tmp/next/build/include/linux/phy/phy.h:25,
                 from /tmp/next/build/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:15:
/tmp/next/build/include/dt-bindings/phy/phy.h:15:33: error: expected identifier before numeric constant
   15 | #define PHY_TYPE_PCIE           2
      |                                 ^
/tmp/next/build/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:47:9: note: in expansion of macro 'PHY_TYPE_PCIE'
   47 |         PHY_TYPE_PCIE = 1,
      |         ^~~~~~~~~~~~~
/tmp/next/build/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:127:27: error: 'PHY_TYPE_PCIE_GEN2' undeclared here (not in a function); did you mean 'PHY_TYPE_PCIE'?
  127 |         .phy_type       = PHY_TYPE_PCIE_GEN2,
      |                           ^~~~~~~~~~~~~~~~~~
      |                           PHY_TYPE_PCIE
/tmp/next/build/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:135:27: error: 'PHY_TYPE_PCIE_GEN3' undeclared here (not in a function); did you mean 'PHY_TYPE_PCIE'?
  135 |         .phy_type       = PHY_TYPE_PCIE_GEN3,
      |                           ^~~~~~~~~~~~~~~~~~
      |                           PHY_TYPE_PCIE

I did not specifically identify the commit that triggered this, it will
be some include file reorganisation which causes PHY_TYPE_PCIE from the
DT headers to become visible to the driver, clearly there is a
namespacing issue going on here.  I have ignored this for today.

--Vve03y81vknTHsUY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsEe5wACgkQJNaLcl1U
h9CHYwf7BluoM2ZZkp7ju7XWqJPpH5doRn8uawa/wjWWNvbQIETwbjA0HP4RcjG0
iylw9YZk4+Zh5da2lV1vCPRKZN86JAU5QQYcs1XYb04KyU3uPOSurh7EBNFVrI+B
N4rt8wnYvqd8IImHy2Zb3O6tXuPk5X5X3t9rynM8XDklrkdFsJQYUjQ6/el9Z5wf
hT5uppcWUDF0H1e+eFnMbK/+1NH3jXl7+9qurBUTyuT11lUqo0g9vxDmAvxuzmbp
ft6Qjki6OnNAex1qH/7eAQvm2X3omAbb+f+9NjhRiHZkeARqfEomWG0JF2/73Vnb
JDKec3bF8uELGhjSzTH1O48hmaTnFw==
=udOF
-----END PGP SIGNATURE-----

--Vve03y81vknTHsUY--
