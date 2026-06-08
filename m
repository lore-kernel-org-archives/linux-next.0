Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB433DA7F6;
	Mon,  8 Jun 2026 15:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931536; cv=none; b=ZdetO09pAO14uoMeBBu/CkbDykGwkNDpqWopdDQJPj1bE5urZsYqKfv+PRiA/l10otYv5ZYz3nk9NFCKCUDH7r6LUtyca/yo5t3nmwvErMeaBTVKTXGob3NM3cD5EuQYs4tGpiqi9VGUXZxCkgKMepfIOhKmA5HdxjetCiycplg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931536; c=relaxed/simple;
	bh=2y4hJoflBw+W1tK9Aaip5B64R6HMLGg2WB8w/mFniL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SjPKOIaDHHaD9DoFVEQs2dV+xaf479AngRnLIx7AOrv/WoRfXGTX/e5wm9wnBKVTNt/B7hFXRKx+sCOx8AdKGAu/FVjN1H1aFaotc8riTIiyrXs4EnMGBl+PEOWq5uDKMGIW8iRdu6MxnXgxW4UW1GlnwUZ7gmgDnbW82M4vHVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C8OFh9Ga; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C8OFh9Ga"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 266AE1F00893;
	Mon,  8 Jun 2026 15:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780931535;
	bh=ViwTMhldy9qwLzF0u2Y+xHPIxdJ1fukeFNAl0ECCJOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C8OFh9GaJRNn+S3iTY2nAeTuIBEpJ3QXNaIF1WUteV31Vd1AvNUKxDTMKcpx5FCIO
	 cjPi++EfGC45CbVwSemznTrMyLrWWHxgMj0U9myd8hXY7gckFo0ATj6ULfOutV+RlA
	 dtlQS6Onx+PrSXE6kUVSx/whFZx+BfL0Q4snc6MEJoEMHw5V+sHPBEZn8S2icz/GHx
	 hrUx2FKKdxcJt+hJNu46K5YyF/4nbLj6ol7t4nsX3SwV82xAcXHyQCJW7mXrFibEH5
	 yQ/ztEagBlKaFzpEABWOIuAElPXHzY4yugJRku/XVYnk6qX+SIv98oMJXRtHuR3imJ
	 TMJVEm+35DHpw==
Date: Mon, 8 Jun 2026 16:12:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the rpmsg tree
Message-ID: <403ba343-266e-4436-b5ed-3f1591f9d918@sirena.org.uk>
References: <ahYObZ9AWrcYwHhP@sirena.org.uk>
 <56ff5dc4-ac28-441e-8884-e8d0278317fc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lQchfHPp8TBSIveb"
Content-Disposition: inline
In-Reply-To: <56ff5dc4-ac28-441e-8884-e8d0278317fc@sirena.org.uk>
X-Cookie: Programmers do it bit by bit.


--lQchfHPp8TBSIveb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 01, 2026 at 07:18:12PM +0100, Mark Brown wrote:
> On Tue, May 26, 2026 at 10:19:41PM +0100, Mark Brown wrote:
> > Commits
> >=20
> >   49abb5d6e1ac8 ("remoteproc: use rsc_table_for_each_entry() in rproc_h=
andle_resources()")
> >   0590420c2f90d ("remoteproc: Move resource table data structure to its=
 own header")
> >=20
> > are missing a Signed-off-by from their committers
>=20
> This issue is still present today.

and today.

--lQchfHPp8TBSIveb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmom28oACgkQJNaLcl1U
h9Bvfwf/USfcCIPbfQy5FbKdX7fuVKP3r3pJnvgthqSzQq2Rj31NgJpge0+78OeB
hqbfOzV/Xj1yoCfXiJ+KtTeZJkOeD0hAmNYwyWatCzYb5piq7gtVtuvlK6eDAYHB
fwozMD85GQXijJqCXmdh3yBzA83PfnOAog7ocMIScpMZmzwVqHFgDFS4hRfas1ns
RdHsGh6EixpjgH3CRa4jDeX9YQNHHZa39lN/zakpd/zLjZrgINEphCyOsBENAURI
MBCf6XF4UYo67xwCaZTUzIKihIkAZFaxuzBaaAx826ivwA1vBpxzW3+5xmtls+Rj
2Pk1GROrH651CNYXHV5YN3Bulh8lfw==
=SrPf
-----END PGP SIGNATURE-----

--lQchfHPp8TBSIveb--
