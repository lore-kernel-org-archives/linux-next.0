Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0703E8665;
	Mon,  1 Jun 2026 18:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780337900; cv=none; b=DHL3UyA9clw6HDaijR5lOunsJgR8DU6HambmaogyTxLGzY3CSskMemkjrMJTRK/6eE/Bqit3buoxyo+yhqpC+WCxyEeN1pPYUiGsjir0PrEqrHUdUasL5rN7mBsRXUeUJaWEWmRGss29YTQKw6YplyiZDGO9kYOEHl4Q78yP0TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780337900; c=relaxed/simple;
	bh=Jz6I6UeNc/GK4IpUj/DseWrwIn0YaqbpJXECfOcj2D0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U8IIAm0gl5d5+2JLwI5N/Wclro5+vjyXFQ3R1ekQQW7OQCIt7PpJ4TbV2/8Dh9CiP4lkkCSCipW0ECacFco8DkIgbMZO1RhVWX4s1BKDd2qsaMgYZin971xBjn42UfuZDAdw9tWfql6HskHPgeyCq5wMxbeF6xg/YvIyjGK0xJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nQM2HEe+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nQM2HEe+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5476E1F00898;
	Mon,  1 Jun 2026 18:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780337896;
	bh=0usou6oEO58r2IcekN95eSR7vikwOvfOfVNHbcxJxvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nQM2HEe++nWz22KDfrQjOVqyELizpeXt5fvz3L+Vfj8pHvC8TtKQk89BPmZGRP51m
	 +bF6ep+8NPVJpEJoyPcznkY1A2a9ppx3mXEYqa8yvZ38vfQJ2zkuHtnw+EkyCodh73
	 Sq3aFlCtCA42DKnODIgOk1SEm6wZ1qtlCAwhA6Tb2ct6bWhLLIieCF6c1g/pBMkA0v
	 qvnkGI6WYX3NbMjGW0040z/rc/FMiwslpC7WOszXUt7Z+1MWRyf2SYIcIeH/lLKWeN
	 hW9dF9guFUO0Swo+nejquV92uXQ105DcxVfcdm5uhqKDH8zunQBdLNXui2Zw4FSCpC
	 VCyoi5r26GbRA==
Date: Mon, 1 Jun 2026 19:18:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the rpmsg tree
Message-ID: <56ff5dc4-ac28-441e-8884-e8d0278317fc@sirena.org.uk>
References: <ahYObZ9AWrcYwHhP@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hjQf5+r2z13OkIL+"
Content-Disposition: inline
In-Reply-To: <ahYObZ9AWrcYwHhP@sirena.org.uk>
X-Cookie: Filmed before a live audience.


--hjQf5+r2z13OkIL+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 10:19:41PM +0100, Mark Brown wrote:
> Commits
>=20
>   49abb5d6e1ac8 ("remoteproc: use rsc_table_for_each_entry() in rproc_han=
dle_resources()")
>   0590420c2f90d ("remoteproc: Move resource table data structure to its o=
wn header")
>=20
> are missing a Signed-off-by from their committers

This issue is still present today.

--hjQf5+r2z13OkIL+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmodzOQACgkQJNaLcl1U
h9CJRAf+LLuz0khOxyGHDHTXlwselWdkxL9cLcYzsF2z7XdQP8XZy4V/NSgKOnnW
f+rhUsL01KQfHU4RPDsS1mc9NZoZaxzVaHutyqEDOxQVtHxTJg/fJn6d99ViYix1
iUHEHDZAr9bdAW1/zhIVAPmw8Y/IOLZgwqXoW/MnyoMikIeKmTbpY2AxDQo0E2xP
AlKh+JDRaQKDwzIx0ICe2DQhQcY635fD2H7CgUFevpOe7Z9TZSJTPhN2f9xjR4+m
HiQpfhdKYNj2Kqp0R29JSnIDHAwDrzw3Xp45yMxcuOR5j4CNcZyrFddp50DbR0UK
H/s7EHMuQ174+YAoaQoglZPEAbIa5A==
=9brf
-----END PGP SIGNATURE-----

--hjQf5+r2z13OkIL+--
