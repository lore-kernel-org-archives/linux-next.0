Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E253B47D3;
	Mon, 17 Aug 2026 12:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786970424; cv=none; b=WjrRvy8Wmyk7v1R3PTipDuZXeXfP1nFkcrE8UzwanOgneIVso+Xv9WfxocJDBpMO8LpT6SaBjg3JITKXm72BSGKv6euVNtYKACE7S1AimRhKP1yHQeBYIy7m4wrF61u2oAZEtk0pWWTmn8GdpPFzjbXVE604tgu4kocVDVW1N18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786970424; c=relaxed/simple;
	bh=DOmiot8SUNObg42unfbIxWwT/GbLezpkOWbPMtLqGSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cxMndn/JWbiXwO8EB6spAVEPvmi869fjCH1JBi44lg0AJg3Pv0iumWTvVjwbrDzvVeEIzf6qSl3qy3agMeCtw42M5T6NzZTO/OhJhl903lB2LGlsbxVrS8uiijxhse9aofaRfp9b4sQaW87sROw2I440O5hhHHLObLLlsOl+r5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d45yWIZK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d45yWIZK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2F1C1F000E9;
	Mon, 17 Aug 2026 12:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786970423;
	bh=+rgJnE2dOm5T4xMMtlwcvCsszB4lrAqyxIW7muAv8VM=;
	h=Date:From:To:Cc:Subject;
	b=d45yWIZK6n/HSZouEqUrZ/vKQ8EhNvO2zJWteOYZjz7kZIpxAf8/Ndg7ltLhrd5Lk
	 2G3Dt8AgyCLJcc7PAcawt9sReY6aX+TMkBFhujwlFsSY2077uxvmDD1I9ijQqh3gZl
	 TungI65Ypwv5cDKu4vAvsfefidUQDDjhfnZJp7mkw0MbvK6/MF9zknw1+AYKc9P43E
	 1+22mvD2xfuI6jOKdrvQVvstFDaLBIdrltwbKYL8/5Xftwsd0CsDnphCMEZugm9lRt
	 UUMxzC9UiOAEMsSdu5Czh35G+VlgewAbz/V5L8BK97rSOiGsk7KlsfklfbTlwfGQY3
	 50H5UmEkYUTCQ==
Date: Mon, 17 Aug 2026 13:40:19 +0100
From: Mark Brown <broonie@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the pm tree
Message-ID: <aoMBM9KoZItu0aNb@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GLHXnqZYaoTeXWCS"
Content-Disposition: inline


--GLHXnqZYaoTeXWCS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  68e3c5d8c128e ("thermal/drivers/qcom/spm mbg tm: Fix missing bitfield header")

Fixes tag

  Fixes: c3dce117333c ( "thermal/drivers/qcom: Add support for Qualcomm MBG thermal monitoring")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--GLHXnqZYaoTeXWCS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqDATIACgkQJNaLcl1U
h9D08Af/bOInHnbW8rFg+UcCZrgIhLTwsLhQsOtsUdhy2PbeiJ9U3u1VJqDmtEpe
B3P9OWsVF+MRPD3hIEwabNg4XRAp7aa0lz1h4yTwCFt/qT8botgd68NOzwzHiA6o
po3hKQ0I3efrN61SJSzjsIGJ11ay3TYyPxcdtb/r/O15E+B5Eo5iR2eXfD/auIEc
61sBZtM/6nXKkEnbHPOsq8VxHITnZcdagwFmklTur0tZ9/cqt5Y+gjHUoYx1Sri6
lvaAZt0TcFoMCRp/nDRfhh+cP7Hn6GnOu0MuzVvxqmtWW6znDxV/MqNwWskRfTd2
vsxQvrIFrtzOY+de22Q3HZOVaec/dA==
=2egA
-----END PGP SIGNATURE-----

--GLHXnqZYaoTeXWCS--
