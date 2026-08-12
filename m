Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B782D0C94;
	Wed, 12 Aug 2026 16:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786552658; cv=none; b=ExCjLz+5a1yoN33A3kjJgNuwuIewFxmKymzlQ0P8PuZsabiOazz2B0cOxVHLpZ6Y0HU3GxmXQIQhJZHNWpgIjfVlnHpupG/6cmR0MgEstGAw6tYbLVD66XUG4n6KExQLtHC7cmxXuqYxt4w4zdZuvaTE3wlYMygYsCA3BIaBTNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786552658; c=relaxed/simple;
	bh=v/GuzztOgxXF5umDuzngZIgMwcemolG6efOWKCsIeRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q7JiMA2inCGe8334VFyjqMlMsah9Ek/pcQnjfNXrcBg38MA0oYdWm8muYa3WGt5nW0VS9f0hPMJCupb2Ff/Ma98iiKfLAUGXrMc+aK9iCBzyQ7reMf01Jn6dPTzCHGIt2JjP00ewV37V2Ux0fvz3Kqlntk5TKqKyKEMKnGnul1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D3441F000E9;
	Wed, 12 Aug 2026 16:37:33 +0000 (UTC)
Date: Wed, 12 Aug 2026 17:37:30 +0100
From: Mark Brown <broonie@debian.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: ksummit@lists.linux.dev, Thierry Reding <thierry.reding@kernel.org>,
	Breno Leitao <leitao@debian.org>, linux-next@vger.kernel.org
Subject: Re: [MAINTAINERS SUMMIT] Any feedback for -next?
Message-ID: <1a34c486-2fb5-41e3-991f-23bf82468412@sirena.org.uk>
References: <1025da50-3e21-43c7-a761-4f65ed5e5069@sirena.org.uk>
 <anxTFWS4KAMqGNGT@monoceros>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s+3JbgUSFNNa+Jye"
Content-Disposition: inline
In-Reply-To: <anxTFWS4KAMqGNGT@monoceros>
X-Cookie: !07/11 PDP a ni deppart m'I  !pleH


--s+3JbgUSFNNa+Jye
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 01:19:05PM +0200, Uwe Kleine-K=F6nig wrote:
> On Tue, Aug 11, 2026 at 05:54:59PM +0100, Mark Brown wrote:

> > Any other ideas?

> One thing I recently wondered is if it would make sense to not merge one
> tree after another into the same tree, but first create pairs, then
> merge two pairs, ...

> The advantage is that if commit B breaks something there are less
> intermediate trees that don't contain B and you can still test on e.g.
> D+E.

> I'm not convinced the advantages outweight the additional effort, but
> IMHO this is a bit similar to the request by the filesystem guys to have
> a tree with only filesystem changes.

> So this is just an idea that might be worth to be thought about by more
> than just me.

Yeah, there was also Sasha was talking about something with trying to
make loosely topic based subtrees.  As you mention there's a scripting
and comprehensibility cost to doing something like this, both when
building the tree and when trying to understand the results.  If people
actually want the intermediate trees directly like with the filesystems
stuff then sure, but if there's no demand for the specific combinations
of trees I'm not sure it's worth it.

There's also the issue of incremental build benefits.

--s+3JbgUSFNNa+Jye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp8oUkACgkQJNaLcl1U
h9D3NQf/aScGH0r1a5PEx5bUto3Ma98X94kl9y8Itae3xkOaeQsSqSW3j2QoztmS
w+XXsCH8DFOaNpvN9G8hw1mya6XfjJYEtFdHe1x+HDxFRoVFPhn5OKYCX7mr918N
q+3rPhX+VDSo6KnmqbCzuSMlGY8rkHC90EI7Xu+k3SgNhhNTBnyG+EhlnMWYChJC
KhtDkgtBjMkjDzEl3mXdwLFLiQEbgHUAp7VrofBx0900vNG8OExHHqtdrUJS8lbQ
W3SCPrc6HsjHT5avvNh48vcOImKhJhtMuCMFVHGQ38IfDQJEepfzCsElg1WHFP/g
Lr6FzVm3i6PFoez01vl5rAj5KLyzqw==
=9ldW
-----END PGP SIGNATURE-----

--s+3JbgUSFNNa+Jye--
