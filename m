Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8011496919;
	Thu,  2 Jul 2026 13:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782998527; cv=none; b=pkex06hsG/dSWpHOk35sbs2KWd7fxaaEgx0vqJ92Nzic6aL8MnYxIGKAStHVOx82iokZd2eQffdIESoRMHB+veZn4fxMrEpJuOYLQhdqB80n8Ar5xP6EzRnhBtwlwcoDxD6+RiRssiq/hdXY/I63ltpO2QCgctXNO5Vl7MUuVP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782998527; c=relaxed/simple;
	bh=3zdLHMlc20BxN7riruKBkyr4/5KG8dRIcQHmESF3qTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+61HH48IgME4jeFK10z3cO2x9QoNhhfZO0AIj8QCmBIZUGANV4700UzMvb5sOMDV0Wn2IVKfB8Ctm2nE+T5HzmAX0+ov0E7x1QZ47DV3V2qn7e0yuwodgHxVGSqTzMHwJt/rgMUIeGduZb6zcqTBylBa9vqqv7ptmb86lDY0gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pa4QPvHH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pa4QPvHH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A44F1F000E9;
	Thu,  2 Jul 2026 13:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782998526;
	bh=LAtx4/qirqXTunxLAajB8kvlxSoB+zVRzKg374t572g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pa4QPvHH5GIl3ROMpPKSb7OJvHthW3ZPg7WQzLYaUfqHmPW+GmswqtzNzTlIZ0QuQ
	 abz/8YL5f5SzEcfbpuLPjk9HGZbTVBUqUmeCgEFwqF79D8/Y0WhsL6587AJYkBCBGX
	 2N9YwTHNNJSgdpWpZ/f0qbBNr44IY/poouZH7xxucIkeiXirg16sdwz62DYkU5VK8j
	 XpK4YNe/uo0UD+G1HkuJ3VNsCzk0ky9RcuVI/BvKPx7EKsO5W8lOZeeM4qFIXF3Cxu
	 iDVGJ8gPrqVoJW+9vappgyY7BjLFmmJ0hgibyICyDg6e+KjOD3I9Y5g3ebUySqDi0Z
	 qsIqt0d6TDzhg==
Date: Thu, 2 Jul 2026 14:22:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Gary Guo <gary@garyguo.net>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Boqun Feng <boqun@kernel.org>, linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Policy regarding linux-next only changes
Message-ID: <c662ef1d-30ba-4c15-94cf-a9ed054e11d2@sirena.org.uk>
References: <DJO29EZB2BIT.2AQMSG44P9M46@garyguo.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8b+W9WWmQeQOBLDg"
Content-Disposition: inline
In-Reply-To: <DJO29EZB2BIT.2AQMSG44P9M46@garyguo.net>
X-Cookie: Reactor error - core dumped!


--8b+W9WWmQeQOBLDg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 02, 2026 at 12:49:39PM +0100, Gary Guo wrote:

> For obvious reasons I have concern about this practice; being a maintainer
> shouldn't mean that you're allowed to add random stuff to linux-next. This
> reminds me of another case last month
> https://lore.kernel.org/all/20260604210704.41751-1-ojeda@kernel.org/ where the
> added stuff via TOMOYO tree breaks Rust build on linux-next. I think this
> practice is questionable and I would like a clarification on the policy of
> adding stuff that is not upstream material.

> I recognize that there is a need to add commits that serve as testing and
> debugging purpose to linux-next, but I think any of these changes should be
> temporary in nature and have acknowledgement from maintainers of touched code.

Yes, the idea is that -next should normally just have things that are
currently intended to go to Linus by the end of the next merge window.
Obviously there's some flexability, especially for things that are
within the tree itself, but we're trying to get a heads up on things
we'll see in mainline not just do random experimental stuff.  I'd
especially not to see people putting in changes specific to other trees
without some coordination with the maintainers of the other trees.

> Perhaps these changes should also be in a separate topic branch which gets
> pulled from linux-next temporarily.

People do sometimes ask to put separate trees in for things like this,
it does depend a bit on how the branch that goes into -next is
constructed.  Some trees put a merge of various branches into -next but
send the individual branches to Linus for example, they can just add
something to their merge easily enough.

--8b+W9WWmQeQOBLDg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpGZfkACgkQJNaLcl1U
h9DyTwf+MJnr4OVRkBOXqIppfbwj3rkAQXOLwGY4r9Vw129q0p6npEcb2bO/Ri7j
x9SUl7LoDDk8bio4bG14ktyvjUCXiV2fhZV0c8eDKtQxTBWBIpUYi9V+3l/Vshpg
Ha9BuNEjRUpJHh9+MlCtzfA8wlXLFne9cNt8AQak+L2rtsgGrpw37KOxYTFA2y87
03DbBGAXMw//aH5q8SHMc7TMo84+VYJCREPNBhTUKVWSC0bwdczBFZ/Lx9ISa3TA
ndMwQyij+Y15yMXIfkcd5j1nQdzq5LsyL+TL1X/2t9KL97JGtaj4kUxQWCyoPrZ5
DlOP2havag4iQhxdz0Cb9MYcXZN8xg==
=QK5n
-----END PGP SIGNATURE-----

--8b+W9WWmQeQOBLDg--
