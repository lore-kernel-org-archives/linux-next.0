Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9444A2D372D;
	Mon,  9 Feb 2026 17:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770656466; cv=none; b=Rox50GRfjjoPCzZIx6IxqjBmAUrtb9g2nzc8Lv/HbcBUKxlN0uqmmVby8wAKrr8XX+snOmw27RDz5iUQU62eX9t+O8yi5ng+YEAhL+2uNHRsXibVw8hVLJBBHPSnS25P43szCioYKRKZRKygkY4UjCvwBFKQaN1jned6j1Bph8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770656466; c=relaxed/simple;
	bh=SKewjU7CYdvaDIEpLc94wL1gMWBWulcxkimjBffNuMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pog9JOZN18QcWo2EbOd5vImHuUuQRz91cCQ2Rq/GBO0JBFks7nsSn+Ka1YMGQoQGJ1H0wnVNyThhS/eeWLrVAJjtlPo0mwELTIkhiAhqBq8ELXUdvnPaaboX4yX00lR6T21vqoUjshSyoLpeBCvbJRtkBvTTwpYxkmLUr83CZoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=anKIre/J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="anKIre/J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB670C116C6;
	Mon,  9 Feb 2026 17:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770656466;
	bh=SKewjU7CYdvaDIEpLc94wL1gMWBWulcxkimjBffNuMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=anKIre/Jh1HtSnVt2tRbTo0o4ItdSkqas86oXaTNZw1I2hpQ2vRyb8oMxGCVK9gww
	 WRxe9hVDGCvgoEpYrhCXT2lwr3r8nkwNPtkdHcvs3yOPd7qj9A6/P08132Jzz1iJf4
	 khx1RWmqrD9TkTnWWe8/rYllIkfVgqoVHnPe1/HaeLE2lZcXYxkNnUUtbQn30tRbox
	 0zsfE0yNrYqfBhcE/GBur1yoL8NtY3m+PtUYGncKGMA+mw8rMun6mCmbbafJX+MJtL
	 kYK3XIKp9YS7XlJBtk8iuZwHse9QaCjNX4FGdy1OaoJjWV+3aZzPQfR5sVNHVOsgHo
	 aVMUHXlC9vrUw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id D1DCA1AC57F0; Mon, 09 Feb 2026 17:01:02 +0000 (GMT)
Date: Mon, 9 Feb 2026 17:01:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the device-mapper tree
Message-ID: <aYoSziMI3eg7BDAo@sirena.co.uk>
References: <aXpyXrnoOJI7EkyL@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u0p64MRMeRyXdFlJ"
Content-Disposition: inline
In-Reply-To: <aXpyXrnoOJI7EkyL@sirena.org.uk>
X-Cookie: Think big.  Pollute the Mississippi.


--u0p64MRMeRyXdFlJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 08:32:30PM +0000, Mark Brown wrote:
> Commit
>=20
>   218b16992a37e ("dm mpath: make pg_init_delay_msecs settable")
>=20
> is missing a Signed-off-by from its committer

This issue is still present in today's -next.

--u0p64MRMeRyXdFlJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmKEs4ACgkQJNaLcl1U
h9Digwf9HKVinxqAG5iN4sq8rWKU1tvgnOLZaCBglJTVyunvfCjwIsSCzGcZ9VE+
fDoE8ReUetk+TdLdu7xqTITAdzl1nN7sbu7GsH1SU6+VlOK2jWxxLc8HrgEgvVsC
dZyiv4Rfzjd3IaCIYwfE866j6jKOlUpWpMZBWMtO9sYKbKeOo4fbJkclmkD04SX6
HiDqwB+pX6MOyjt7v+v9UIQu9GheWdVlbtGxO4STdJLJVQRvsB4RWHoPGvKRS4dz
X6bOo+JOH/JBF7qRffVRpdXnrVu4gjVCOtBPOoIfs9JYt0X4qT2ajTAhtzoLO64m
vJD71ek/oIvMmvzvqhLghhUzopjeSQ==
=THl2
-----END PGP SIGNATURE-----

--u0p64MRMeRyXdFlJ--
