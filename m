Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103EA3CFF5C
	for <linux-next@vger.kernel.org>; Mon, 30 Mar 2026 13:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774876349; cv=none; b=EQ+g11XkE0FtuI4EBWlQ8qpQCBSHRNmYStYtE7SvsL7uU+7Qywh0SAIAnlewHaMAxb4A6+EP2QCbJcinUiv3Os/OgemsGfLn+VCIWyb32bKcO1pvgq3TgfMjNAawWaKARg+upRi4fSrxRq0LfL7K0Eac/4xktCCUdJqHkoHJPSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774876349; c=relaxed/simple;
	bh=0snltg1Mb8qeZxHCy4QPnp4aYEdQca3mog5GhFUq0K8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WzSa7tgHuXE90Qz/BcNTIDB7MAxDACiefeNGPMpvU6MGxhBMzT41sXgzUPHyBerz3+bG25dKRmktOwcfJGJPMBWyWQ1/OYPhQLT0vqyoZYlZeLYrRbDHvbdvW4D0FXa1TkeiT7a9lBFfpptHF8fsRAyvC2BiTR4kKD5PEIZc0tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QQPgFqX6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QQPgFqX6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6277C2BCB0;
	Mon, 30 Mar 2026 13:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774876348;
	bh=0snltg1Mb8qeZxHCy4QPnp4aYEdQca3mog5GhFUq0K8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QQPgFqX6KBJjXbPQix/HXJNWzdZxETTs/zBn05Robt22+tGXL2JZsfKdznVAp9mDl
	 l+aZyGPEgDAkCisRp6JlZAIop/XvrNeEczPGdkqJblEPDSxdkb5J7TZGBqoCPXAVzQ
	 7egwvd1Kd7SwKmGdB2ia745xuf5xUK/vb40QmsF1NRKWq7xNqLY0Z93Tg/w5pdfCdl
	 neD/mRQhHgkm+5RkugTUYX5X3kT0gL9kw6rFY685SMvTt/hoClA2jKbc0cQgC1Fh7G
	 E9R81ExRgx90LSJeaXe8kDQ920y22CbxlENygXC3K6OAlLiTob1rgWQBiewiaHyUgJ
	 IzGyJFBgLIFlg==
Date: Mon, 30 Mar 2026 14:12:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Igor Korotin <igor.korotin@linux.dev>, linux-next@vger.kernel.org
Subject: Re: Please add rust-i2c-next and rust-i2c-fixes to linux-next
Message-ID: <ec1752c1-a170-4473-9ecf-d6d93b31dcd6@sirena.org.uk>
References: <02908210-0ed5-42a7-b725-8bf70f936828@linux.dev>
 <20260329105919.73dea963@canb.auug.org.au>
 <b239bb2f-15d3-4d30-9b3b-8008864d8d62@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BRq/ucDBeYQY5NJS"
Content-Disposition: inline
In-Reply-To: <b239bb2f-15d3-4d30-9b3b-8008864d8d62@sirena.org.uk>
X-Cookie: HUGH BEAUMONT died in 1982!!


--BRq/ucDBeYQY5NJS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 12:27:55PM +0100, Mark Brown wrote:
> On Sun, Mar 29, 2026 at 10:59:19AM +1100, Stephen Rothwell wrote:
>=20
> > > Please add the following tree to linux-next:
> > > Tree: https://github.com/ikrtn/rust-for-linux
> > > - Branch: rust-i2c-next
> > > - Branch: rust-i2c-fixes
>=20
> > Mark Brown (cc'd) now maintains the linux-next tree.
>=20
> All being well these should be included from today.

BTW I note that both trees have the same content and that looks like
-next material, I would expect the -fixes branch to be based on Linus'
tree and only contain bug fixes.

--BRq/ucDBeYQY5NJS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnKdrgACgkQJNaLcl1U
h9BxeQf+Kdh+a8B3itK+/HjFTlGBuLEYbQ0zT3DdSQZUs0+7GRMoZUynwvpo4+E2
ScC6aVSwVUipeFhjI3wXt7ObnQgo4OhihFAMUWbqk1WJvHTItKrlRLgWWcIWLcWQ
wy/f1H5k2UCicB0mNpYIU2I8lwA+bolzats8nFcNXWVEmAlPhT4ptVA9z4vTKOg2
UokW6eSO0ZkIO2g7NqvwPEYtrZSglQGXc3sNrXtcPnbuMfh1SkEYuR3sMwbDTzBi
r0TTylXDiqCOYBSbvloCsGszgvJKz8JKbIPdZe8xBTiZjNGebgsx/TydbC1rGRj/
OK/4uLHYefoi9AvjFw+3aBWM+QcYsQ==
=ig3J
-----END PGP SIGNATURE-----

--BRq/ucDBeYQY5NJS--
