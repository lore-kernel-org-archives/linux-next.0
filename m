Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40B643DA31;
	Tue, 20 Jan 2026 14:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768918206; cv=none; b=gPYgF9blWJyqod834RIALqOAUJBN+AAEc7ur4W/7YXhtmYN67xmipcu8xsEuuwUdiZqIP8F+Jeavzp6EazyCC17beGNhW67baQ09yd6o+/3X3nCSPEnmX6mrhCuJzCYsaparjrdynKAFh93Vgrj/gpWRYengEKrKxvpXy60QsB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768918206; c=relaxed/simple;
	bh=xiEWWvYXjQGoblDkR+TM4RZ9DpoEl26DG4bqYZLk6wg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QsFOtc1zVVBcBl1uD5JjqqmeL9txurfDX9OYghgimP3n8Y5oGQcRf7c8lOjdaBRKiWufvepP75HAx6aQcJHqq9QuY8s0s2MuqkYhg16hbJnvH4oqOFVAD9Q3l9x9OlynZyhD7DnHqPwql/7RFW/bbBhAwJlcWoSM+TNCows8ODo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IxrUrPLp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IxrUrPLp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 840C7C16AAE;
	Tue, 20 Jan 2026 14:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768918206;
	bh=xiEWWvYXjQGoblDkR+TM4RZ9DpoEl26DG4bqYZLk6wg=;
	h=Date:From:To:Cc:Subject:From;
	b=IxrUrPLpYAqRxkAbW1T/quTDOj14Px3VWVUYtPUqqC1paenwjhSnC5wNHgHmlmmpH
	 FDsgZbYOf0I7dSRJOTmjgNbMf2+jP0gs8bwwgt8gJoSoa2Z+SW5H3nBo5NV2rLNw75
	 +jzyE3JYbIUH3JL6X7VU6u1TdOhQ93S7mOSir/WLx4AAJZBIHq45/sdueV8uLyovZp
	 mP4pR0yWxxS1x8Gfi7LLSIwI4C9D55iO4UnBlFAAOi51sQkGBoRiGzrHzcRFMDro3n
	 nbND6dhTGTBw+it12bSo3v0UWy5WqKsHoerGXwrb81uqRe230yT0heqheeEjdv1cac
	 hGaB1gnBR15fw==
Date: Tue, 20 Jan 2026 14:10:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the at24 tree
Message-ID: <aW-Mur4VZrCg5gjM@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wmmTrZ6Zv4D3BrZg"
Content-Disposition: inline


--wmmTrZ6Zv4D3BrZg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  c6e79d34bf80c ("dt-bindings: eeprom: at24: Add compatible for Puya P24C128F")

is missing a Signed-off-by from its committer

--wmmTrZ6Zv4D3BrZg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlvjLoACgkQJNaLcl1U
h9AYsAf+PB5QhE8HPzOcCYw74NiNKANtd5R0eZRRer0COvP46HPMhg9+apkcaoUC
Vxrz1OEYwaeOAEFPHEE/6vcwX/AIJOew8P5UBQx7jN4t5mphiM3QPstxketPPWYs
vGLxPmfBTHcBgjqgTlxiOh4ucTki3sKvC7fNzGb1bwpWuNqHEVfhTstb53i5tT0V
jT6Q/tM2aFvMZIJFhHbVwbHH6w0yAsHt2yGSMAHo2wsjn0ngKQ1+VurspJybRk14
t7mpeATBQ4T3p9Jcq/PCflXN2x/A2McqdLUM/+cUfDL3l0CJ3WIc0cha5pg4HrsL
xwvrawmNikx2SlKyrzJh50RAK+2XFQ==
=SibU
-----END PGP SIGNATURE-----

--wmmTrZ6Zv4D3BrZg--
