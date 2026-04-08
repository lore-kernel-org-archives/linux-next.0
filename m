Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C8F3D47A6;
	Wed,  8 Apr 2026 14:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775659850; cv=none; b=PXHIIzz5jXuHGM211Ipj0fFoSvlSFLnMHhtLRe8J3OYPe4od6lIgGB2D597kfHh/t5xKojv0t8UdXpLxpDgKsTFCxvgCJ/8J3Si48W4rIq2EY6kDWAnitzIM/u2pUkjcQGmqnWy3ioKZAe8YglEWgwO21tS9VLD4ZorAuRpOGho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775659850; c=relaxed/simple;
	bh=E7kBvrCfJRjodevKhzcaHoDS1NO+QZZNh5T6l4PXZE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ad+JsqlTFteCgei0NAsqKgQBxwfOgzZNeGnCfqWXps5dap2nL1MtAzrFO+mlnHLshTSsuf2gfgvthzk6mf3j5IWlDUoFmtxzgEdrFih8iPssUlLVABHXhSfx8zhxEr3h6HMTE/9rPotXwpsxQTGwgvn+dvnLlVf/3tn16kCsvKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSr7dZmr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSr7dZmr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D53AFC19421;
	Wed,  8 Apr 2026 14:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775659849;
	bh=E7kBvrCfJRjodevKhzcaHoDS1NO+QZZNh5T6l4PXZE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cSr7dZmr4JENkca5GY3YAOp+Pu+KBoYSFUNxiL36qMelm+0impo17a3dGcTmLsfk0
	 qR9ztD74y1ZKtSy9lPWturGlslvRtyxuEmxjmzHLcYUphJInHq6w86+8Q1l9sI39VI
	 F1avSxonA2NmhFTFyUkjbPz744054hmMZpVXkDxzyVavhAQmRvapH0JiNPxIC8RYJv
	 pgnk7bd8ZAvpowIK/GS8UOxYORi3wR0Zsdv5NUZrWfm67IXXNC3hgu5SOnABHhcsj1
	 ehFWu7S5tVG2C6VYJeHbiJdpZxOSQjJ4PMNswM48JSOxJHbIOrZjshWRJNs4bj3ZCG
	 Skrza0BSuFf1Q==
Date: Wed, 8 Apr 2026 15:50:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Josh Snyder <josh@code406.com>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip-fixes tree
Message-ID: <d39364de-70ae-4878-bcd6-1b9497bb394d@sirena.org.uk>
References: <adZNmIpSOkd6P5c7@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7KBWWOpgejqHWFQo"
Content-Disposition: inline
In-Reply-To: <adZNmIpSOkd6P5c7@sirena.org.uk>
X-Cookie: Now, let's SEND OUT for QUICHE!!


--7KBWWOpgejqHWFQo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 08, 2026 at 01:44:08PM +0100, Mark Brown wrote:

> After merging the tip-fixes tree, today's linux-next build (arm64 kunit)
> failed like this:

> [12:39:34] [FAILED] <missing>
> [12:39:34] Testing complete. Ran 0 tests: errors: 1
> [12:39:34] Test results stored in /tmp/next/arm64_kunit.json
> [12:39:34] Elapsed time: 316.083s total, 0.002s configuring, 16.074s buil=
ding, 300.006s running

> which isn't super helpful.  I haven't isolated which commit but it'll be
> one of the three:
>=20
>   b81207470caf ("clockevents: Prevent timer interrupt starvation")

It's this one.

--7KBWWOpgejqHWFQo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnWa0QACgkQJNaLcl1U
h9BjkQf/bNrlC9tjRX9JTCduteMprak+vem7/0jkMVGu6EePdEEV5A5IjBiCDjdn
oqn4kVQ2tatHXeEU8e7+ejcguAvHXZMOXZLv6N1Wav00EieLZfbLojjg7YpggXY/
i0+lI4AWCIVRh+5PuxvwlAP8kexhKB4hBIFpg/2hZQ5FOuOpqBomwRFXM2VXhcay
s74WHkvn9qBLQZpbHlXSvcYgdLwWCH7clpMp4uyrXmLbgSF5IullwEbw3RvxbV+t
4BURbiJvcN4wt3AORTF1ftD2yPfffJ5UkCMRHljStKUp24kXgvyMQlVlWIHLGBT3
ts8Lsq5CzVEVyis3BDIafC4el/29aw==
=ky5e
-----END PGP SIGNATURE-----

--7KBWWOpgejqHWFQo--
