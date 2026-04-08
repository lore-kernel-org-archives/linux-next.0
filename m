Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF9134F48C;
	Wed,  8 Apr 2026 17:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775669526; cv=none; b=sMXqCRN+AtuA9vqD4xp+tCJOyjjDEgLSxzIL6Irzcnih4aRLu7Z2M21GuZmSx34HPhBEaJYKbm/OTyZA37cSTzEx/uhS9kKSjM5+vgBwXwVnMRzTj36p05D0ew80OK+5V8f/B4eQiTeCQyo1NZJGEQOMq9W3p/9xqCQCygfLDXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775669526; c=relaxed/simple;
	bh=bJnqq8/P6c8peo4N33OynGnzIxELHSWY95kxtsV6V+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eW1UwV40l57t6BHIJrhcw2RjskEFU5eEqRXkwrFxJ1bZiLa+P+ZWaPXG2uCwzY5jfq6M+IM9WyD7kr7b1uWc78SffD40Xy/Ri4+ZwtEL/m47R+J2sA8m9uQOFjPXMmbwrT+MLhKaWmFdsWqGHXV4tcaNdX7WcG5fvmVa0w5g4n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FuQy+GJe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FuQy+GJe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4DBEC19421;
	Wed,  8 Apr 2026 17:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775669526;
	bh=bJnqq8/P6c8peo4N33OynGnzIxELHSWY95kxtsV6V+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FuQy+GJekedTuugJiXg6opBLBYKHwRZV9PpP0/3c8p28/mdHClbuVWgO2pI1biSPv
	 Szaz7Tqi/4Spe6dSk2x24fsBT14wuXIiZCTyjAOnqAPeHwP2AcE2yHvOdGhXVbvKB3
	 i36BubHMRiPcQTvctpbncccW19QiGLnUA1H/8E1wZT1naAwG5jeN/VfYoE92yafwEg
	 IrmJWp2jJz7PCTNtSCyuF7Y8glGNlSs2cPkYPbbE3OJBb/Xq54nh9zDYdJylBlaxcZ
	 zCMfsbWg06UTiycJyRV8CBUt1WuDJ9Y5F2YO2y2oSPuRi8cvMM0nbq0PZd/3W4hdCM
	 cl8BxHSW6RpbA==
Date: Wed, 8 Apr 2026 18:32:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	NeilBrown <neil@brown.name>
Subject: Re: linux-next: manual merge of the vfs tree with the vfs-brauner
 tree
Message-ID: <11fe041c-da92-4e23-8a75-f69d443c945d@sirena.org.uk>
References: <adZNhv68QCxJt00c@sirena.org.uk>
 <20260408171639.GG3836593@ZenIV>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+r+opk39RNtacs2v"
Content-Disposition: inline
In-Reply-To: <20260408171639.GG3836593@ZenIV>
X-Cookie: Often things ARE as bad as they seem!


--+r+opk39RNtacs2v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 08, 2026 at 06:16:39PM +0100, Al Viro wrote:
> On Wed, Apr 08, 2026 at 01:43:50PM +0100, Mark Brown wrote:

> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.

> FWIW, I suspect that it might be a good policy to put notes on likely
> -next conflicts and their suggested resolution in the head commits of
> #for-next branches.  What I'd done yesterday was

Ah, I'll try to remember to look for those, thanks!  It's helpful to
have some ideas for what to do.  People often drop me emails about this
stuff as well if that's easier for people.

--+r+opk39RNtacs2v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnWkREACgkQJNaLcl1U
h9BM5gf/b9mmCyRo4/WUG5XWKUVICen9GCKZBBMrx3Z/0Ow3fM+ItR1e+vwVWTrj
oevoOUazYuD0yFU9IX+UA6Iz335cQamWRevCb5tQr3BuN54B6dzf+hz7847rfUL4
PMA3ppBCiN2BNzgE95QnIeLVd5QJsjeNkH0XFiBOxD2prPANoENwX3jRLEy/eDpW
o/YuuhfjXNXntvTTidj2qwqfaqSsClvujKeHFeANqCeK7sQM2N63SG7ZchoSs02X
wLaCFYJDtn/GTryBKc5fdwSKDHyfgKiyZqd2UJeNzZ80Xf+ehmgulJ4VN9RS0vYR
l9x9t5BHhW+9nylFagjV8/E6RnJXcA==
=FHYk
-----END PGP SIGNATURE-----

--+r+opk39RNtacs2v--
