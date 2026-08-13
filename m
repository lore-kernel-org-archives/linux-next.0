Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A253B27FA;
	Thu, 13 Aug 2026 09:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786615164; cv=none; b=sKjXvc6QiYkPMHalc1b7DN9kMosuY5mkia8aNZfNW81mZjYy08fBhEG66v+zDtBxv/1fEiT8BkzbLlrrXiDQNAcZJunpLV91X1w2KnQpxIVOFfQlzssLUCP3m6NVssRlk8vLTcrPTyr/CjHRkJhKgUQy0RxG7syvBU0PnhK4XHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786615164; c=relaxed/simple;
	bh=y2NRyLfqYCBm2ZpnZT+XCxAevNb1tnVy3IxcdPNm7Pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEP2vvYCczSzRwjRwvxpjt+n9QaALhT3AZdMCfCB1jqCCFCygCrr+uKgmRFPqQlMHsA9xvlg14Urbuu33e2j7gI0QV63nbayjfMQjBNkyphhjWSKUsweZVmoK5eXOrTc9deAgkb2uz4TXafU6lVholR09aCBWpiDGzS07ySM0go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/rmjNL/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/rmjNL/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE9B1F000E9;
	Thu, 13 Aug 2026 09:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786615162;
	bh=y2NRyLfqYCBm2ZpnZT+XCxAevNb1tnVy3IxcdPNm7Pg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h/rmjNL/XXtioXvQNyC3fXPABwu2fRu3uvpnOBMgBvZ5YhaIY27c3Ik4cBelDE2J9
	 lDkl8Lbif37DYb9r+Xa5CPYca+tMBIHf6E6mqRTGj1NWvfLo/V/Hi/vB9SKZ3PC5Oz
	 jvhY78ph+wGcQdB8YRrDhITXYE7X8tBZNz6o+ddqI65BfPMRjAGi2qLCg4Ly5+L6yT
	 dO5cSBqHoWO/NFGn0VyUb15Tpw4KMtCCFmVvGGNmM+z94NebEeVExDE+1rwHeB2ZIu
	 HCQUXshu7J8RuOn0V+HqltZTtw2vaqXdg5lb9aCDTTEZkNZgTYrWeFy/ONltwW7mcP
	 reOxdRihtuW3g==
Date: Thu, 13 Aug 2026 11:59:19 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Mark Brown <broonie@kernel.org>, ksummit@lists.linux.dev, 
	linux-next@vger.kernel.org
Subject: Re: [MAINTAINERS SUMMIT] Any feedback for -next?
Message-ID: <an2T29K_NNR2vrhq@orome>
References: <1025da50-3e21-43c7-a761-4f65ed5e5069@sirena.org.uk>
 <anxaYg9XL7nD9w40@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k5thdic6bsiusphe"
Content-Disposition: inline
In-Reply-To: <anxaYg9XL7nD9w40@gmail.com>


--k5thdic6bsiusphe
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [MAINTAINERS SUMMIT] Any feedback for -next?
MIME-Version: 1.0

On Wed, Aug 12, 2026 at 04:42:21AM -0700, Breno Leitao wrote:
> On Tue, Aug 11, 2026 at 05:54:59PM +0100, Mark Brown wrote:
> > Any other ideas?
>=20
> I'm new to this area, so please forgive what might be a silly
> question: would it make sense for maintainers' -next trees to keep
> a stable git history?
>=20
> Some maintainer trees are already stable and append-only, which
> gives linux-next users/testers stable commits to point to, instead
> of ephemeral commits that can disappear later due to history
> rewrites.
>=20
> Would getting rid of these ephemeral commits make linux-next easier
> to work with?

I think this is a problem that we can easily address using tools. next
already has scripts to detect these issues and I think perhaps we can
provide a variant of those in a way that would allow people to set them
up in their tree as maybe git hooks so they automatically get run on
pre-push or something.

On the trees that I maintain, I do that using a set of scripts that I've
found useful. I know many other maintainers do their own versions of the
same tests and I suspect the maintainers that don't are in the category
of not knowing that they should be checking for these thing or just
don't know how or lack the time/motivation to set this up. If we can
take some of the lessons learned from linux-next and distill it into
some scripts and maybe documentation, I think we can catch the vast
majority of these cases, and the rest we can catch in linux-next, or we
can ask Linus to run this set of sanity checks on merges as a last
resort.

Thierry

--k5thdic6bsiusphe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmp9lXcACgkQ3SOs138+
s6H1exAArhv5hGlujwIl74IYGeaDglBj6cHgNlhjV7nmkbXZ70/LpTgC2sQ0PCte
aBoYbvwHYV9EGW5/IDJoFyQ+MnqVSylIfwDnkZsbFXRDrHn7RHbz8mtMG4j3hkDK
+IBRj/s41lhyAW0nbqESMocPfPsXszy5bsbkzS1ATORKw768IYnV05fuoGVbXMlD
Gp+P2MLXxD6+P4hLn3d0E1OGXdoN159v5BhIaNuHcqtM/VPmhdS/TSsAOIATHRcG
cRWLAdpntpelpG7r5pS/WvAk8DSDfA0s59o6n0HMImEcHAhKU46uCDm6AU8ltxXl
qa52M/Pd6KJHzbLEtJwxMKJOTErk5pIdYt8nmaU7EbZVjYrFW9reetiqLdLR0DUm
4TeazCPZ9HFDgij7/92g7vfca6u2W8vTiB0Gr+x5EAsdj19geS0sbrqps2Dy//nH
ityWPwWyUATuDV6jbzJgC5wfGiZMILaH0xxv6UYo9Y/kE/mZeWI+fIjHNgEMNvlV
P0+6DP49c38Up0uZTR243tDIvvUilvoQq5OtSifg9XhBpdgxplrz4EWh0H13dsYe
0LLJWIx9Iogxtx4nyH/DwAHNeseH+F5n74eN8ssohqyCLpa1j3jkjINbg1GCCg7x
IXJpk3FdjD6mPoZlZWXj3jFBGMcQdyRIrJsj5aMU6OgUBaIcMIY=
=ynwa
-----END PGP SIGNATURE-----

--k5thdic6bsiusphe--
