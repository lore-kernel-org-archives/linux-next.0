Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A37E40F8D5;
	Mon,  3 Aug 2026 14:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785765832; cv=none; b=JZXdAQWozuGfuQPpwGcjJjsGhxh2D8oZM6Lee+kGTd+o74a2boOJ6H7RVWw/Ja3oBfv/oVx46v2fqi45XBw5fSBByx6/nzeb0+I8xdOw8FgagiVki8ZHITqHdu/Z9DpNLAwFwJEsbd5Ts3uqBGpn8QyyaaV96Bnx6vU7NOjQVj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785765832; c=relaxed/simple;
	bh=QHQuZymiF8V+8tTOKKSiP3y3E/mu4zslNoIvwqu7aqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tTpEX31ijRLffr4CsXyNHN1iWzn4rq+wFqMMxC+tJv6wqNrpBa2cNAJmx0Noq/JH0fLisXiYOPHFF5UZm6MIJmC1cZ4qk6acPB2An40dAY70sCYJUPxrMXXkhNmocnV1weIPZeLCyi7QxOTC5PGevl5w731pbvS3uF0f/zxRLfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kAK0PYnZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kAK0PYnZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B9A1F00A3A;
	Mon,  3 Aug 2026 14:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785765831;
	bh=SjmflIrkiyEA18Ih65cSxa1AT2LxiLze1bzUUJXYcYY=;
	h=Date:From:To:Cc:Subject;
	b=kAK0PYnZUxjsndRqKlWb7+YNBRZ59ftAhTT1+mhX4hA/7q2gtDj93x62NqUWliS+L
	 5U6QYAWyZjpoDiGQn12MxpxV9tXy/BgpBbFux/BMFl64AmAYlGkFv3V1U/BjkypYuX
	 uFDjE3MwTi341BECdb3Rh214AhnpfIqK6tza9ECwVeKpV4PAuHaKORgJmJmPM3NEbM
	 a8Wj7c0VdyAhozD5A+Blgxtlt5cl5uXBYKkadwVKmjDt3LtoLCrzUPn1CefYHCgJwu
	 fwAoIYsZUL384GQZpnlGqkn7HkOBqaaZ1moItZujEqOWpO2COGIgSkroZzqNUbVuNN
	 H6wWRLoQMU8Jg==
Date: Mon, 3 Aug 2026 15:03:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the iio tree
Message-ID: <anCfw-jqDKUZ3kXs@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q08HvJ9qWJVC17Vu"
Content-Disposition: inline


--Q08HvJ9qWJVC17Vu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  e0484d62e8e1c ("iio: light: tsl2772: fix ALS calibscale readback")

Fixes tag

  Fixes: 3c97c08b5735 ("iio: light: add TAOS tsl2x7x driver")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--Q08HvJ9qWJVC17Vu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpwn8IACgkQJNaLcl1U
h9B8Qwf/S1R7vhClfma9i0AbmxnrUshCWtMXvmB+QgH17wGBXJ8gEu+7cX2zr3+z
8k/rvs0ERcKjVhJfkq3ybqYWigQssWSiKnhrrEFbY3pdEUicsv0ckq4P/lH48xlH
rhmXVbL5ahrYEL5amXjpQaNs2fy1FtJ/Yuu4NavYEpTLTC4HcFmd/+9kIESntchy
AhNUeMvlyLXftYnu7Haq1tK4pB93bGbVZ1wVFPsUV/K4rSeU0yFOkRysSxipkN9F
T/aPz9iOSWa/IY//3ejdr36jFGZDuQQru1fb1loccrVtJPEjfSABUNo9/z4aruQ9
hvvBBODv64uYAKQIQ979yi4k+9kIgw==
=1RdZ
-----END PGP SIGNATURE-----

--Q08HvJ9qWJVC17Vu--
