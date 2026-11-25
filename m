Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615968;
	b=IE8z6knv86RCmleZnLhfsUlfW0aKMdhwLdKSENFUz1S0iSscOyeGoAQMxhM0zJLtreS/
	 6Ob/JVY9n3PDtzu9alLIUgWNfgdEL8/hDSmGSyxDo+PPo4e1Sy6XqXbQh6LsWtNZf70b7
	 x9CIn2+btP9U1mQwCvFrUbosxgYSrWoEE2uPDGACyzK3CN5VC60zt9VdK4/EgHbl2eVyM
	 hWUPzxE/j1nQoB26TxV6RT6CaRdJ0/+ihI+GAIK++COdmSVsMFA7Il3Og8qIiIElmP4g8
	 K4uwQ2r9VGeqaCcTZwSadxHZRdsdlOz5p/I6laRaK7tCg9+2d1g8AAmC2THouFWVvfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615968;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=jhW2n5HOR04fx7wWnO2GvflLAxU7Z2JX520hWK8bFeg=;
	b=VVmLAILbkov642kN05hOp74FzQjSPBazOHFVx64p9Z3SnbD6pmiDPt5OzaowGTJcFhCV
	 UMT/V2U8C/otqI/RoQCUnrkdzZUVTszG+VCigIQnEw1kCTIMPkvepXnjIcxsXIfz9Aqqx
	 Y8y1jD7Wsrq2EUgcCV02kxDOlVlDnBpmyflo83FoeMqoHdIkXkuXTd7Ctho0ENHwVsd67
	 ySNnTlA2jCRMfJ6aAkvIDoveju5Wsxvl52L+8c5RqAZd53uBRYfA3ZUN+dkHWgz5vWzll
	 b3oVNJx+mj1UrNqRHxoO9lbcERdIQoqTr81jMEpRiNNigFw8tyw75MItVWGL1/TbCgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OVVcTIwq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41388606A32D;
	Wed, 25 Nov 2026 14:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OVVcTIwq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B8761F000D0;
	Wed, 25 Nov 2026 14:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795615967;
	bh=jhW2n5HOR04fx7wWnO2GvflLAxU7Z2JX520hWK8bFeg=;
	h=Date:From:To:Cc:Subject;
	b=OVVcTIwqgAKy3a1HnRxHDWKBPdOXnzCH78xu5155Haadbrl/dfuqfbvCy+kUzxjvR
	 e600uhlAeKOeYjeHw6kyrgYdm+GAvqKC3mX4ZS88l8D4c6rZiNc4W3JqJhhArsBpUo
	 IzxZXL8WfUEgL7DxwvsnThYK7q2czqAV5AvTPX0JtySVdo0tQN7rbWQwcEbILu9c8z
	 ma4VzT5NICKfKaT2kpH0jfVVsiECX1oUsbC/h5dTOrq1sKdyaaZlOfU66j2Yf92zls
	 kiWauWGO9Q0t9I16+uPlnTPareC3miE70PfGSGhnR612k28rfCJjzSb5fWRjOupDri
	 JrQixesy2lIkQ==
Date: Wed, 25 Nov 2026 14:12:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the imx-mxs tree
Message-ID: <awbs3IFaujlC8454@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="5G85GjkgiU3lt2CE"
Content-Disposition: inline


--5G85GjkgiU3lt2CE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  643255dffcca1 ("arm64: dts: imx95-toradex-osm-dev: Fix USB_A source PDO to 900 mA")

Fixes tag

  Fixes: 39be5a7e3ecc ("arm64: dts: Add Toradex OSM iMX95")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--5G85GjkgiU3lt2CE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsG7NsACgkQJNaLcl1U
h9AKPwf/a+Z//lOEKwaQZMD7OdU1UiKFcYcnsUfajUNwcZx1aScNoT71CDZoi6+6
8jOAuNU1g0kysXCGE2YW5/O4kdYrInrSbGEW879bHekH4qouJKZ6SBZEgQrFBNkO
pFNQjKD8z9asrPiIxUM/OSHJh4rhQNVDL/5GnWPuWG8cA1o+wp4jLWUh2/E7nGHY
7OZeNShDyvQ/cl/sLtnudIJk7CA1ZhcVgGsbkJakJgOj0BZiyP0bgr0zTTisx4EP
pwOXCrF5MRCFtTK+3yU0lkWHXzmDL4eHNmgj4cIV/h4tzf8+8K3e4cvOYCvRU0DV
lLuMeq8NE0D49sd06YjtyHqbi3F9Iw==
=A/BO
-----END PGP SIGNATURE-----

--5G85GjkgiU3lt2CE--
