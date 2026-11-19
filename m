Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103076;
	b=f1PiR05XwdCIrQ8s1DQnfeQ5KTfdAhA3rZ3p4fIgBh8zVjhO1cGLK1p4kOn4aJKkSB5F
	 KYeStzKt7x+etr0OdL3CX9sfkqmMJCsGQZJvIA+tMzUePIp9wh3hxBlYvlHFXyoEtrbJ4
	 Ac6cvmsMey6B158V4iH2FDkMWz8nQn3HGQihK4pS4vYYPljlnT5bzjopdzC6r35+7128W
	 LNqyeFuZuRU/05470lYQTeYqc0TVg4klg2Zy+7syqT4pzvK3UFAWWgCfJHCrpFK2KsJfG
	 3wAyCBHJR7drxwj2FpIX+1hmF1pygciOoXQ87XLMphdbgoRvqKKEHXdX6Z6DzBdxB4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103076;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=fKajALr1SOuiezqPFQXO6ObieeUylMrOu7BvN80jN5Q=;
	b=S8S59+0VfzH7HNuoBlYYx4k7AsXk1nIuXYJJHDZglgilf2AM+UjI2bJ1ajeWHje8VBJY
	 8snPyB4BbeTRc/Toa1IT1we+FRdGqpPg9pPuYwcEgzSAgU+ODhrIS4PDvVdajZF9DmI12
	 1LXrliz26OARrs3R5x5g+WzfaTIJHyZopG4VBEuccBbzNSuXgYveGY7jsv5mNW6Dy6rSk
	 NUBYuGoNhKuW737SB5X0NCdOd9t/KZ7/gMqJrBEoZJ7ExPxapBxGRr8x6ltxLf3qIUfrW
	 M0izHyqgIZTkzHVwiBpGcqsGlmmMWHtkPFS3BK5ZV2hYCM9OsKf+6u4Z3jvFuf9PVIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hHvZCRIi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BF060A260D;
	Thu, 19 Nov 2026 15:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hHvZCRIi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC8F1F000C5;
	Thu, 19 Nov 2026 15:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795103075;
	bh=fKajALr1SOuiezqPFQXO6ObieeUylMrOu7BvN80jN5Q=;
	h=Date:From:To:Cc:Subject;
	b=hHvZCRIihe86kTQRhG9R6hll+ozOF5fll1k3HaxjFe6WAw7SKeDJgTROE8kgRwM5+
	 WJYJae0I3l94j93NSo7X0Rpeqb/FbK/ZVsg3Aq8giHjzJdR455rZ9eW9eW4dfKjcQQ
	 vY29MZXdoEEMnVM3x6aJxpGkop+hpya9PUMgB//lUF9/G/winBPWRjsnIAYO9BQoZJ
	 IFD3it/S+jCYA/ejr1cgkf+fcudayQoRdoYGn2XCH2J38g0RCpYRRphysj1ssDcVYB
	 j3K5LoV7Peci+/78N2T+2Q37yWlCkeOARYIMXdwG0bjTd1o5VVjrmbx4mZEQ5DY8ih
	 wjz1WWGBpcoGA==
Date: Thu, 19 Nov 2026 15:44:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the ext4 tree
Message-ID: <av8ZYMRMN2w-w0om@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="kPvxn0FsyR5Jlwus"
Content-Disposition: inline


--kPvxn0FsyR5Jlwus
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  42be4bd54735e ("ext4: fix the logical block counter overflow in indirect migration")

is missing a Signed-off-by from its committer

--kPvxn0FsyR5Jlwus
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr/GV8ACgkQJNaLcl1U
h9Alxgf/XAXQ/jyjSBD96HznCE4JC5+kht+qVfFk24HsX+eDVOOQn6fCXDIg0ZRN
BV+LsuxCJG4x7Yhwqyi9T4kGUohuFK7Php0viUbKbUnSuYuriLMNzen3ge6QZiKj
for7K7wFIBpdvRxKEUepyWmsp5+3VMcKKTSZRHcVwIC1HZk6nZFA1GBN6IKmeHf/
Lbnym/tyujJRCmD6HSSINmM7akdoHDL2v3bwRauVLMvCPm3ZYhe4kg/bDvKCdyEy
9g0nFzc8+2cFxnoi3szdHKgDQJtWvbjKoI7s/zyU+LfmzGL+yZybHr36SBZLRIUL
QqkMqB5gsmVEck6zFmbGoMLZex1QLQ==
=iblp
-----END PGP SIGNATURE-----

--kPvxn0FsyR5Jlwus--
