Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD5C471436;
	Thu, 13 Aug 2026 12:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786624600; cv=none; b=i8J6IBujC4Rhq7ZPRONA1zS0OQozQCE2qk/RY3njgw9c58qFb0YQh82Kt/FqZzCtEHMGQtnaghJT8D2IdEuTQznOPHZwp5TDl0CRy1cspMQr/C73wc5RtSpsDflTxWhljdQW2GkXeIS8ITry0keIDHLjwsUFDtH94LSe4eeFkB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786624600; c=relaxed/simple;
	bh=jujdjRVVQLsr1FENvBUXq47QOxtvRBOLN7T2jlCXYtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m37/YjA6wgUkybJkrwUX4oSKWFOoLEs4Bkcu4/VZcKvcrTRkjBXcg8FTjGTwTKlpx9YzXl5iCP4ezKeM6AMihFDSRMfKjMSiLR77nrE1hpmQUOjpBd5un9Lk0Op1ZwGAyYnL8CY3vVF5S27KARHDib0BiN+ELg5R4uawpZVlmj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 051C81F000E9;
	Thu, 13 Aug 2026 12:36:36 +0000 (UTC)
Date: Thu, 13 Aug 2026 13:36:34 +0100
From: Mark Brown <broonie@debian.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	ksummit@lists.linux.dev, Thierry Reding <thierry.reding@kernel.org>,
	Breno Leitao <leitao@debian.org>, linux-next@vger.kernel.org
Subject: Re: [MAINTAINERS SUMMIT] Any feedback for -next?
Message-ID: <a0e4b0ac-41d1-40bb-b704-67ba71e8ce43@sirena.org.uk>
References: <1025da50-3e21-43c7-a761-4f65ed5e5069@sirena.org.uk>
 <anxTFWS4KAMqGNGT@monoceros>
 <1a34c486-2fb5-41e3-991f-23bf82468412@sirena.org.uk>
 <CAMuHMdVEejuG-Dyr4DXgg3MhtDY6n5cDYPotRiGXeSGv0AcA+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lbzmob6C3cucPftz"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVEejuG-Dyr4DXgg3MhtDY6n5cDYPotRiGXeSGv0AcA+g@mail.gmail.com>
X-Cookie: Immanuel doesn't pun, he Kant.


--lbzmob6C3cucPftz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 13, 2026 at 09:31:58AM +0200, Geert Uytterhoeven wrote:
> On Wed, 12 Aug 2026 at 18:44, Mark Brown <broonie@debian.org> wrote:

> > > The advantage is that if commit B breaks something there are less
> > > intermediate trees that don't contain B and you can still test on e.g.
> > > D+E.

> Sounds like a nice idea to me!
> And you can put the trees that usually cause the most conflicts in
> the same subgroup ;-)

> It may also help in bisecting an issue.  I have the impression "git
> bisect" on linux-next (against Linus' tree, not against yesterday's
> next) shows me more "a merge base must be tested" test points than
> expected/optimal.

IME it tends to walk down the linear history of -next until it find
which branch introduced the regression.  I've never investigated in
detail but my feeling is that the inefficiency is more driven by the
size of the branch it lands on.

> > There's also the issue of incremental build benefits.

> That should be more or less the same as before. After all you're
> building the same number of times, it's just the changes that are
> reshuffled. And you do use ccache, I hope?

No ccache, it was enabled in the past but it got turned off by Stephen,
I suspect the reuse over what you get from just doing incremental builds
is questionable.  We did have mediocre experiences with it on KernelCI
too.

The thing isn't just the number of builds, it's how often those builds
change headers that trigger full rebuilds, and we're only sampling the
builds rather than actually doing every single one so that the merge
completes in a viable amount of time.  That might miss stuff, but due to
the way trees are ordered it will likely be only things that will get
resolved before they go anywhere near Linus anyway.

--lbzmob6C3cucPftz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp9ulEACgkQJNaLcl1U
h9DPRgf8C01n6omewBHClQ6oaoY+PihJcK+HwKZ6dF90liRF6k32I0vFK+zcIYy9
dLMhDrhJn8rNRJ19WI0UuuAMNzczJy9h+Jwi7i8S2e3T/1u6Z5IL9OzkYO7fdrOq
Qo0U7l5SWSkb18FnLk9BSq0wO2azdKFxI+xplQcorT0+P43xUE34ONOQTrAArbK1
Zmj/YKgv+jYC9owGcJLj/02+QtQJYG2Hydz0qGm6l8Ixkvs+eP7dZObjjmkJ+qzy
UrD8Ml9zR2GdH2GAFai7cdHeSWtfJgpLZF9iaLfHYeltLXEL0Lu+jqnYhLXOmWnM
bzi96QOfkpSGaCBGu+PUWEQo7lz/Cg==
=S7mR
-----END PGP SIGNATURE-----

--lbzmob6C3cucPftz--
