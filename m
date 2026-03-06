Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB7C35BDB9;
	Fri,  6 Mar 2026 11:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772798367; cv=none; b=Dz3KPW1054RQ+NIXbtNGlVDPIEAUmLBZ+OEph0Qw9aUSEg0BWy01BktCEln2DGt97Fqq2mrgBbMLsKU19MTUX0DQ68eT8C+d96eTUiP5rbCGpsXLOWMCCa1nL7wgX3/7DwrQHBsyxE9JLGnyOPiXkqHEl/F+nA+9c9p0U1wH1tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772798367; c=relaxed/simple;
	bh=HCK4ckJYAv8LxLaH5J/EcltsobtcDChBjE0VMGHBn1I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JcOOiQEZsjIXgBc1FzJgY0jdWiEdT28ZxW2XsYrrSTcRZ1Do3nUwXtFx123i6r1JvG8F6gD4kJOdDLKnUXbDe55SLUHRXjBASjNH8aN6QJp88athv3vWEmREmxUHueegu2cLUvzCZzNxvZtijZDH6vSMjUrgh2FKcUw9ChwDRsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VQrbvdF6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQrbvdF6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 840C7C2BC87;
	Fri,  6 Mar 2026 11:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772798367;
	bh=HCK4ckJYAv8LxLaH5J/EcltsobtcDChBjE0VMGHBn1I=;
	h=Date:From:To:Cc:Subject:From;
	b=VQrbvdF6Z/SDX9qjrJIUSLmQ45GpjPMDEFbFAbeDg3QcNZhUT+LUiIkeJbHhQnM4r
	 Lz26qRBFZMPrbhxjkoRIgkRApzyxeUFLj6LtEEX1BlxSMjunKxCNFh3Fp7KNYQmbbS
	 sh5k5LavievcoBb8EPMb/I9/jgr8UHnD7z7StNpunWS2yjGzcoDUcduipbjRupNsxF
	 z3t/eFX7LGL3zufeiuE9Tx0V7r298zRz3PyuDD1zMO/f+FjHQO+d6cdqSlSpxYQSZ2
	 qPBCgPNgPKHfa3q+azn/pwZc00BDhpxQVqk9YtgmirIsAX+lT0n9JBuT479uBHmwPH
	 lNA4ogdRQWflQ==
Date: Fri, 6 Mar 2026 11:59:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the rpmsg tree
Message-ID: <aarBm-e3NUl9XnY8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dtPSTYP3t6LB9ugs"
Content-Disposition: inline


--dtPSTYP3t6LB9ugs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  390045a24591a ("dt-bindings: remoteproc: qcom,sm8550-pas: Add Kaanapali CDSP")
  0af8802175d2d ("dt-bindings: remoteproc: qcom,sm8550-pas: Add Kaanapali ADSP")

are missing a Signed-off-by from their committers

--dtPSTYP3t6LB9ugs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmqwZsACgkQJNaLcl1U
h9Bqwgf7Bsdpq9QsXXZ2GBf7kAopQ68WL/3s73wuKbinPYyKm8uYo2qmFhtGfCLb
yTlFBPR5XS19mGr/cyxL2+oF1EgFJ1Qu1gVryRmhtIYbKPoreePh9vXWG7uUxMFg
joZnND66pQzTIClMdjhJxRsW2XIDOrOPSLne8abweS1PblcwueSiWDxwtrOKL+ey
XVrxAYHGKKU6LdLa9F2EtiA/86JLdM+dpSH+Ji1T3wqfrFND6XXPxhBEqduX+qgn
r8je1x8cbniaUsL7sc5cDNQm3EKz//3iWeRDKXjDmJoo2CX4k3kmATEPZdp0P3Zp
Ceflw2xxSvw9kYMwlMENskFbKzCRgw==
=snty
-----END PGP SIGNATURE-----

--dtPSTYP3t6LB9ugs--
