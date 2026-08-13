Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C0946982A;
	Thu, 13 Aug 2026 11:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786620355; cv=none; b=hYThpHST1zsi5HU0/7lOneHcxp3zaGrVnS+G7HWwkp+aQIMSklj04lkqEkfHfqq9hWObLZsr2wrmOO5lEFs4ZlEedPbqdghqpIH5wHCXiNpyCY7g6oEpkCU4ZKSgoIoaKEulzfr+42Q7HPDz0L8L2cUuGMbdCPMMQhoAj2CVD8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786620355; c=relaxed/simple;
	bh=dAaisWuthH6BnI1tsUGE7X6eM2GYBv1dFLk48zd3y2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mfkW7onUfGXzWSClhacF6qR8mz3R9lM5a3NEf1NlEYdlDwG1YurUftFE4QYhLCslegIDUhAUEjnw0/7IcB9CtZQTb1RevQXFj5nQyKJxU22L5JfMMMwQSPxY5ZbBsQ+MHyLI3WzntRmwlFnj9pqEwmr0stpRiMmT2qtAggdAvJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38DEE1F000E9;
	Thu, 13 Aug 2026 11:25:50 +0000 (UTC)
Date: Thu, 13 Aug 2026 12:25:47 +0100
From: Mark Brown <broonie@debian.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Breno Leitao <leitao@debian.org>, ksummit@lists.linux.dev,
	linux-next@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] Any feedback for -next?
Message-ID: <88c68516-9402-462f-9b5a-df7123f220e9@sirena.org.uk>
References: <1025da50-3e21-43c7-a761-4f65ed5e5069@sirena.org.uk>
 <anxaYg9XL7nD9w40@gmail.com>
 <an2T29K_NNR2vrhq@orome>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nQgA6flNuavP89ji"
Content-Disposition: inline
In-Reply-To: <an2T29K_NNR2vrhq@orome>
X-Cookie: Immanuel doesn't pun, he Kant.


--nQgA6flNuavP89ji
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 13, 2026 at 11:59:19AM +0200, Thierry Reding wrote:
> On Wed, Aug 12, 2026 at 04:42:21AM -0700, Breno Leitao wrote:

> > Would getting rid of these ephemeral commits make linux-next easier
> > to work with?

> I think this is a problem that we can easily address using tools. next
> already has scripts to detect these issues and I think perhaps we can
> provide a variant of those in a way that would allow people to set them
> up in their tree as maybe git hooks so they automatically get run on
> pre-push or something.

Krzysztof Kozlowski did a bunch of scripts/hooks that the soc tree
people use, that's probably an easy thing for people to integrate,
though since I don't have the URL to hand I guess it needs more
publicity.

> On the trees that I maintain, I do that using a set of scripts that I've
> found useful. I know many other maintainers do their own versions of the
> same tests and I suspect the maintainers that don't are in the category
> of not knowing that they should be checking for these thing or just
> don't know how or lack the time/motivation to set this up. If we can
> take some of the lessons learned from linux-next and distill it into
> some scripts and maybe documentation, I think we can catch the vast
> majority of these cases, and the rest we can catch in linux-next, or we
> can ask Linus to run this set of sanity checks on merges as a last
> resort.

TBH given the volume of commits the error rate is very low.

--nQgA6flNuavP89ji
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp9qboACgkQJNaLcl1U
h9B84wf/T5jYiah5f8tX/KD3Nz9oFw0b70WQGEAMiwpUD8VNS6hNPujH5TY3VHu3
3msyqK0cCl5L9FQ5dIdhO8CeT0unqWxGb4A1hQds/j4r6Xf7ZmrWCafRq01jbJT9
LOnUcN6bMUhQw26jUIMGJVR5SUOauelPNqUVaPqCWmk98usrm0panZ3m0E6hZkhU
s8POaKEh3HG0CKxnDyYA8BEZglFXUZSbNfl8gB+flQTjCwvuBVP664Qrko5Dh+nb
Flsy+rBxFoylIkQy2epl6PjBXzH1kS67WgMyG6iB8BvYR3XkI1dJyqHh7iMPeTS4
34OYhtsKK1vSe7CEPVDVIpUV3VQ11g==
=y15x
-----END PGP SIGNATURE-----

--nQgA6flNuavP89ji--
