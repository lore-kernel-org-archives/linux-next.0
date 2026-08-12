Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B73476062;
	Wed, 12 Aug 2026 17:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786554181; cv=none; b=NHfihdiCtb8FR1hV+81iTirOHdOKCpHqBuAR5a/buj2X9iuff7ihjhbkgW5XSvCkfyA6z+5T13Jpx5QetGh8zrNNvATKp/zVc7rShmn0TuqgNWtnL8Jw2wlAMBHkP5p/qaB5H5JDtUaF+cnkwVe4d9zSDabzVjGwQN4IYkoqzTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786554181; c=relaxed/simple;
	bh=7sLy1n0dzVSc/IKumf0swPxkdcgtOfpmWz8/Ielf2Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pe5WZzBmaFKi2d8SCAPFF+Dp68rpWyj/GW1queF+6CJqpYlMNqDme6xijCrNaWpJEuzZTO/xJ00+HhUBIasq8ejvdgaK8PI0qFSKO4uWjlq0Rj3b5Iw3ahIIm0DFJCawjTmDjO/zDXnHyLxbbRShSXeqJFEF3yVXcPorrVSERfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 117BA1F000E9;
	Wed, 12 Aug 2026 17:02:57 +0000 (UTC)
Date: Wed, 12 Aug 2026 18:02:55 +0100
From: Mark Brown <broonie@debian.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	ksummit@lists.linux.dev, Thierry Reding <thierry.reding@kernel.org>,
	Breno Leitao <leitao@debian.org>, linux-next@vger.kernel.org
Subject: Re: [MAINTAINERS SUMMIT] Any feedback for -next?
Message-ID: <f5d7c700-823e-4cc4-8d81-1743d19a93db@sirena.org.uk>
References: <1025da50-3e21-43c7-a761-4f65ed5e5069@sirena.org.uk>
 <anxTFWS4KAMqGNGT@monoceros>
 <1a34c486-2fb5-41e3-991f-23bf82468412@sirena.org.uk>
 <anyjG-mMuaDox3eN@laps>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8Y5zqUJEijjnY5yx"
Content-Disposition: inline
In-Reply-To: <anyjG-mMuaDox3eN@laps>
X-Cookie: !07/11 PDP a ni deppart m'I  !pleH


--8Y5zqUJEijjnY5yx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 12, 2026 at 12:45:15PM -0400, Sasha Levin wrote:
> On Wed, Aug 12, 2026 at 05:37:30PM +0100, Mark Brown wrote:

> > actually want the intermediate trees directly like with the filesystems
> > stuff then sure, but if there's no demand for the specific combinations
> > of trees I'm not sure it's worth it.

> > There's also the issue of incremental build benefits.

> Which is mostly the reason I kept silent on this thread :)

> My original goal with that work was to evaluate AI merge conflict resolution
> and measure it against the work that both the -next folks do as well as Linus.

> I suppose that if folks are interested, this is something I can keep running
> consistently, with the caveat that conflict resolutions are purely AI driven,
> which could be enough for something we feed to CI and bots.

Like I say if it's useful to people I'm not completely against the idea,
I'd just rather not pay the costs if nobody is going to benefit from it.

--8Y5zqUJEijjnY5yx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp8pz4ACgkQJNaLcl1U
h9AS7AgAgYGc7prywsT2WcPi8RizASlnCsJ5GrpFFgI9KpadEv8rDGEAOWVY7aE0
kXzkDDejC40jMnh13WHkI8pLq8+w7UP1/Sne/fn36MhY+8wz7UGY+CtV3e25iZzC
6Ss9BZGwVvyjccZB5cDkZgkGNUu7LahqxGKASmSoXceJ2VXcVr8FbV87xzYqe6Ob
ZVficLv/powL+/zCYs2dsQOAUT2X8WwOcX9tjIAxacSbt6qXkRHYCkpP1n880nhY
wQHhCWJ2sFms8Tbd3Xfppau6oWkUSXLblWferyfw1yqCYRW6OoPx5Hkm+JUBrze/
zPTeZOtsj7e8SG3wfXeNrg7raKss3w==
=+5M6
-----END PGP SIGNATURE-----

--8Y5zqUJEijjnY5yx--
