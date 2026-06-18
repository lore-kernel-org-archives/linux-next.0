Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DB93DB960;
	Thu, 18 Jun 2026 11:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781511; cv=none; b=R9oIuUteJJuNjC38JENeURGnDcvNfTtmrAnmUZVuusIIqcxGGqgbjuHV9BacMtCADolFvpyKI8fMM5WPJSwyLQwwwK9bSfsjD0V216/fYQgBie9XagYf3CuXCJ5lV29BY0rncbvBQKubKKKDf1szch+oBoHLEVuGN4/lZ+MxYLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781511; c=relaxed/simple;
	bh=vmPrGpKyX+Zbr8HNr4ElGjFmeXh2OkuSCC5kHBLRRxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VmTQ+uFcGUogKmqOKCLRzN1BiRNtsbBGMSk0BPBJldmxOsAZ0R90AT3GDZC2hky+KB2TrQtZ85U2Z4J4f3b7WUL2ZvtJyOhzk39BCpTDl5nbrZFYML4tvKDzLef50ft8X7gRiDEJX1Umm2uG0P6s4UxqZv5oXV9GWGktFJrRa48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=awrdtvKy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="awrdtvKy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4CE51F000E9;
	Thu, 18 Jun 2026 11:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781781509;
	bh=vmPrGpKyX+Zbr8HNr4ElGjFmeXh2OkuSCC5kHBLRRxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=awrdtvKyHqUMzHKnsXwP4HNGjSfGLV4tJmhVmnP/WygZPSdh5nVY5kzCzZcahE/7h
	 rtQB//gwwUz3mar3j+1LPc/pOII22NhPcLTNNe0WAPrARmev/WOdXmnvHXJRDAiaDD
	 b+6fYXD0isJlxIpzOHIrVzZVm02qisD3lPyNCq2QX44vCd5HeDaApiKK95gSm3ptUM
	 WrvjjdHWyyKC3vF5CwC1+YVWEk2sc7xrGXY2ano8aBUsfqImXDAoULjncYMCdjmeAB
	 tEPmx+GjEJnoGniVO0Rf4gdTsuZHOZ9BzXgts1UHSGlnUj+LBe7L7QhO98/zzNDbDI
	 nXcWlb+eFX93Q==
Date: Thu, 18 Jun 2026 12:18:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Jun 17
Message-ID: <3097be0b-de19-48d2-a648-f1b2550d8933@sirena.org.uk>
References: <ajK3HJdAhHJ85wYq@sirena.org.uk>
 <20260618051211.11310Bd9-hca@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rhjmqAKVr8pQXPbq"
Content-Disposition: inline
In-Reply-To: <20260618051211.11310Bd9-hca@linux.ibm.com>
X-Cookie: This unit... must... survive.


--rhjmqAKVr8pQXPbq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 18, 2026 at 07:12:11AM +0200, Heiko Carstens wrote:

> Any chance you forgot to push next-20260617 to git.kernel.org?
> At least I can see only next-20260616, including the corresponding
> master branch.

Yes, it wasn't pushed - it's there now.

--rhjmqAKVr8pQXPbq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoz1AEACgkQJNaLcl1U
h9CHzwf8DBIsZ2XejDHDFRglqXQuLFFyRRM3j254aTjzvnpJmtwWIFYJsY9nbcDv
Pfm2CJJnKaDi0m9QJ1itBcHyO9wkc/xgmj9BHiLWu7YXnHlpxOX7SqzW7cEr+Ni2
btHAbx1SeDwER7c7BwnETlF3RSj3dSiI9s5syAdjYVK7Jlr2sJrQHwqVipG9ycM+
eXSPyhI8t/IjJyHJxklD4IRs6kgC8/tNH6cS+Q7Mkqe52tQ9TWgF/pdRRc/Bq9Mh
thIj/Pr3CyCOSoP6+grS0NU5xP5gEaq80jWRc8tA+W/VTy7MfHpVPq6HvNgOE6Cu
12xfcewTdKLGG42eB5JJI1AE7Q4vKQ==
=hmn3
-----END PGP SIGNATURE-----

--rhjmqAKVr8pQXPbq--
