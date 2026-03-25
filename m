Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAFC3FBEC3;
	Wed, 25 Mar 2026 16:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774457847; cv=none; b=L9o7DszFO9K7s2zZq1V3+RFTYjlfeyv+oldnY1KY4kHJjqWBVezcko/uyM7EE7AIUZf0HbcGe4XvG+gUIgrOYGMZe2pD3lsZlgxs3XSlK7VGxZWGIcihXvHJQOPSNzjjXZTVJQ0NIEHZsZNYtg6JiVWOejzOqb+110OKATWe+Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774457847; c=relaxed/simple;
	bh=Jmw/HaBM/+H27X/iAAUVe2eHLoryNsj+P9Airdy3RS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OqqmHPbk6oxhCxCul9KOzcoWiKcMdM/X819YcEUSG2u8t7IXihnQHY2M0n6Deo/A7wDIQfmc8Y6GhaPXbjSWaGsz8xrRMyZ3isTEVOoaBcaraCjCodA3eH4KMNtKUPmuKY3YA0LI8L7gOg0LN9JWwqckdO5HDwHwimVjcwqefSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YiWytlA4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YiWytlA4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D707C4CEF7;
	Wed, 25 Mar 2026 16:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774457846;
	bh=Jmw/HaBM/+H27X/iAAUVe2eHLoryNsj+P9Airdy3RS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YiWytlA41YtB6QdNnfCVabaTNewpc6v+lrlSilokg3pOBt/I4yYBK3fOCxr99td/x
	 gFBE37lOlM/tTE3x/P0mg7KpnmymizfCijL2Yy8kfrx4bzDVYDpuWPLoGIBEuwVz3v
	 8l5fnGm5GlzXOdTJfCdCV9gC6kTp6WGRxEMMZGSRjaIu7l5tXkGm7YlQsqVK89qcWa
	 1e9WJLN6k+nGt4FljpeZr0M3GwhT+CRgVL158KQq+x61ADSnUuqZjy3B1tnKR66AdK
	 kGWbOEu+iN72mQEJ/mFEhWZtLNmNbMrdwL7w2+o6GeY+y/FrwWA2O8+pU97Dv4UlDG
	 eP11g7AG84qvw==
Date: Wed, 25 Mar 2026 16:57:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>
Cc: Jens Axboe <axboe@kernel.dk>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the block tree with the drbd tree
Message-ID: <be3cce14-c069-4325-b093-12dd26892119@sirena.org.uk>
References: <acQCDMhGqwhzLuzt@sirena.org.uk>
 <c9512d9a-e654-41ae-9d61-9e3af53f815e@linbit.com>
 <899e0337-9642-4ca6-9050-aeab14fa22ef@kernel.dk>
 <9e8b388d-ca6d-4e78-bbb8-3b6cdd731777@linbit.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EUXxIJme1xlKOCW1"
Content-Disposition: inline
In-Reply-To: <9e8b388d-ca6d-4e78-bbb8-3b6cdd731777@linbit.com>
X-Cookie: -- I have seen the FUN --


--EUXxIJme1xlKOCW1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 05:47:34PM +0100, Christoph B=F6hmwalder wrote:
> Am 25.03.26 um 17:30 schrieb Jens Axboe:

> > I won't submit the changes in for-7.1/drbd, but just expect you to send
> > a new series against for-7.2/block when that is a thing. The 7.2 one
> > should be closer to going upstream, and so forth. Within a few revisions
> > of the mainline kernel, we'll get to the point where for-7.x/drbd can be
> > included in the merge window pull request as well, and we're done at
> > that point and future drbd changes will just get submitted against
> > for-7.x/block like any other block driver.

> Sounds like a plan. I'll send the rebased series this week.
> We already have a few "get it closer to going upstream" patches in the
> pipeline targeted for the 7.1 and 7.2 merge windows, but none of them
> are truly ready yet. So this approach would fit very well.

> Exactly, once we are done with all this we will adopt a "normal"
> upstream-first dev approach again. We've already discussed changes to
> our internal workflow to make sure we never digress this far from
> upstream again -- I think that's in all our interests :)

So I should just drop the drbd tree entirely from tomorrow?

--EUXxIJme1xlKOCW1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnEE/EACgkQJNaLcl1U
h9CeqAf+N6xCE23NdVkfYNs8+55eY/Ily/kqNvMKZLMNVZmjhsmzLuxo7aur0LDG
BfqiSYEm0LRYSwdVWyXlKd2ozmjxUEFgMzhIKnXY+uvpCmDSdHgbYNg/LGsK3A1m
NHt3liWKVzanN+9BFwBRPkGEhWCDir8fRLeFnqP262TW6WpCMn2FR56Eob4GRktZ
QswMnRNw3ZJAyWkBzvmtJP1CFv29A1JapJnvKY7VnVgiFzB6k3f+0F4RKt/X9kNW
HXlr0M766Frvn8qeiLmqdTT7CraJLSNkCNz/GykB6Mu+rLxxrwRhKCVH6jD4nx5p
G6V3OHwJGJMF6F9PocmN2/ALYD9HJA==
=5a9y
-----END PGP SIGNATURE-----

--EUXxIJme1xlKOCW1--
