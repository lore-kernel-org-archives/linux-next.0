Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7185C3537D0;
	Mon, 24 Aug 2026 11:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787569215; cv=none; b=vGNUnck9r6gXkaF320rGNMyNtQAQ9TzsL/J5OJLHT8r759g8QV+tkymiglbTNU2hQE3aM6zfoIVkpAy41T1ft+KrmPL+eMthO3MhRCSSoqgLiGErFqX1w4BO6BhyXbJZUy2fhq5olst9nhQL+4PgcIZATmnnjdD92NxGEOVVOBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787569215; c=relaxed/simple;
	bh=F7Ox/5OaPpkrt6Fdn/JIYnK0IRSj4Go2NJz0FUCXgcM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=maC7d/aePzXd9uC35RIew0slSNmCLkBUJquV1lGiTDrXS8DFBBGsocjYxdnsGkU64g9WYExZ2J4FkheRMfYS9bMawTHTnveslrarUSS4Np63rrkYYSZA+nuvnQCYezlxrpvTwTajwsl9VYgvFHKHnrXGBx9g5o8VQV9wqjacmIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FOS2RLeR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FOS2RLeR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 336071F000E9;
	Mon, 24 Aug 2026 11:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787569214;
	bh=a/kP+CAKsnayZNs6FIsuqQXO7DimtsB3fgXkDw1fdQY=;
	h=Date:From:To:Cc:Subject;
	b=FOS2RLeR03FikvWoeAaYf+nLNYdN0ukbdzGQZm1/HIu4ubRmWb1/3o8+8wqxr69oP
	 L1y5XDA/sru4qfB8+OiLYZqYDfruham+3gp6vLcn8R2d97CxpWWNOmTVWdoCStkSh8
	 GcIrSBrqymp7rjPkAiVLFBuU4HemxwVVMjd7gdxwL8iC38vs0CWHmWwWDMqEREjiqp
	 977yrZyg6Vz/DFjQxpQmmkbWZcvUbXERg9aNyL1u5KGPWhcloi4K/LII5luxYN4WGG
	 /NOsw5dtxD1m4CjvbV8FkfHdDrJwT3feBKlsgbbGK8duXVC1ydPkAVUDZA63ux/oMn
	 kR38s9Qu7IKow==
Date: Mon, 24 Aug 2026 12:00:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the fbdev tree
Message-ID: <aowkOuXbx2unZJ67@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KvnFN9kc6TCBi8rT"
Content-Disposition: inline


--KvnFN9kc6TCBi8rT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  5a4abc340e7b7 ("fbdev: omapfb: Fix __be32 sparse warning in panel_enabled()")

is missing a Signed-off-by from its author

--KvnFN9kc6TCBi8rT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqMJDkACgkQJNaLcl1U
h9CHwQf+LnDAN8aE47OquLCQOKGZu5bIwN2XDKK3yfqUcAL6lWlRRUISbBUIdGgH
XCazwOK9xLb65cjubLM1pECHehcKNUmGV6YYXhzxdf2cmd4+lNK/eYOEkkdkUBu4
0uYPH9KHkE8ASFnQRybDspMIl06/97AKwl+bLCLOYHxuRDAi5xohZbGK1Qq3nDPw
4hUv5myUO7L8sTbXbTz7ROJh2hjgb6coumJifjyleg3Ewaz2h1X9yfhH9WDnSwgf
wflp4EkI6XKKZ+7DJAv1ycjaCiqiMVzxwkU1HpHcbre2/mpMX/lIW0g60+Xh84d9
J2mqXwZIXCLZnKsbROTP916qNCE/4g==
=fBPF
-----END PGP SIGNATURE-----

--KvnFN9kc6TCBi8rT--
