Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D605F376A09;
	Thu, 21 May 2026 09:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779355555; cv=none; b=aYWRjNEWvjWg30eKbRPOrvj4YmYc17f65yG56SzWgct+wH8Z+oqaUsRqI5w85Cz0KXNXgQ5q7Vqm3N0PRpUSopt1F4z9jYsgm2O3ICYMaBVFqWG8h16uhD8JZUNvt8g6k01BxwQ7+/pXcqU8slaIYrZuHciBkpeZtbLbKUdT03A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779355555; c=relaxed/simple;
	bh=AsqloO8LBj3FFWkH1h5nFqLD5/6JedzAKwMU7yJWoPY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jweX7jw0uUvUoRZCizQoOMBnVDHbUd97temuU9e3+r3iNTxiU0RTKMCOT/AS3xaJ1TdB8xT6wTu7FQxtXa1rudepUKj1BkPnAxl8nl4VtNBCLydAQFBVgdyxA0SzwDVwsFbdcJA6owDtUsVnHsQRDGLyrzW+l3D444NTL9627rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HduNjMP3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HduNjMP3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBC1D1F000E9;
	Thu, 21 May 2026 09:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779355554;
	bh=yoLdrFQF7kTawkjoDmpOztFB9gtrME2O3nh5QOyH29o=;
	h=Date:From:To:Cc:Subject;
	b=HduNjMP3VoNSZrHmQUsrNjVlL+s0UwP7i5AAZFRE4jho4SExWDaU2XbhFYHCktaGZ
	 n+8fXeubuBhsADE/1L9TDIgbizD5pXrONnYLrsXOp+3E52x0+1jsF4cQfe34T4eTsX
	 +Fec3czdcIj3QXcm/0VUkw4sTdh/xag9uaIic0iM0kYZBn5ASm+4kfZf0Io7s5M5Dl
	 dmeK7W7J5Ew0Z5NatdCr3zid4OM29Zi6xVR8C/0Xoriej7z208mWaS5W6b2BcoG36I
	 4+8zrNeuul65p59vH0A5gMGLE+FLEErWV/xOkDInkrNOL7jNZgkAtA7Xg5zqbD77Pe
	 dMpu4t428aIwA==
Date: Thu, 21 May 2026 10:25:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hansg@kernel.org>, Mark Gross <markgross@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the drivers-x86-fixes tree
Message-ID: <ag7Pn82N5dQGs4DH@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QftW5iWGyCbeM3ry"
Content-Disposition: inline


--QftW5iWGyCbeM3ry
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  dc334b9bf9d28 ("platform/x86: acer-wireless: Check ACPI_COMPANION() against NULL")

Fixes tag

  Fixes: f7e648027d7e ("platform/x86: acer-wireless: Convert ACPI driver to a platform one")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--QftW5iWGyCbeM3ry
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoOz54ACgkQJNaLcl1U
h9Boogf+OvER0tvH8HqPFVSDDt5flrir7yw41tE2fGKqEbI6+pXW8H5wSwzsovTt
BaftskRXSIh/tZMMfYHUpd0HmprHwGLNw3yJWAuCn9ek7bD5YAZn7AlOuaG+5T9W
tQLvd87hYNEwXNrgqlMpma0rMhR94Xf6rDHa5Q8TbiPANnl0OISTZYfwqFGaQ447
qE9MHmxvLBcckT3ld/wKX9dSMUp4Yr8hpwQKNpkG+jUeLBkb3kOulAy5r0EX0pyh
65qrpEIpl1LP2XwbCyDP0sCwed9/hKM7gkCHjQ3qGPpTw7qTxm3pMZJuL1nmQB9X
O33wuOY2Vrrd0jubKo5yqRxwQZCuDg==
=PPOu
-----END PGP SIGNATURE-----

--QftW5iWGyCbeM3ry--
