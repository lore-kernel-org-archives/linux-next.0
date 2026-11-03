Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714899;
	b=O8/lHRjXeS3RhOeKe5goRic4L4/dFf0y3C46Jjardc4uq+sbH0zT/AP2w8CYhEh7jYAu
	 rYyPDLCTrs/vtGlxHngD9+q7RYEOWEvGfXWqIO+bey3Gnlo5C6XnCr+IGJ7n/qDwUhaPE
	 Ict/f2LFjefGPyYrK4WgGYWis7cNj+4ZNNQNb02tc+0NROnMdz0gUf35922MhuYJGAzxV
	 ACWnLUdr7PU/auDtLM1UYIJzFGg+ysukadlVEe26mpADkZvPN8tGgtvgdKJtARnAgNwcJ
	 +0TxKh03OgA5jzGNboU2GQbuzfyU5RPJ0KMhcaRU6r3UOi/pe36G7dj2CjKlDSZbhAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714899;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=G6/DjyF7KKrhq2ihxZk1jTJ/qEo49ZkCozqJFemoqt0=;
	b=hDxEFuRFEZPckORTDHB5FoJyepN0MA7uHCnkQC4sMR9wveixjNg6DVOK8gblREJy0Wr/
	 0pwq0y3BHAKzEO915IlfhH95XL8JwWQBzY7Lg31ONYhcOvU1BUYbzkP6WHDtyn2KHglK3
	 uRFs1f8hnb0mBJfbqPNJfXnpEjV3YpqA+oMpK52C46oGXOzCW2NeJea03kO2nP5jz8Mxy
	 F9vw3/dQCUoTpSSwP8b5gMPaAXHEzkxn9AalcbueHkCT70Yjl9pRkRHrK1oTHpM6MMACC
	 OG8csHUrHcdhY6b7WTJP9EoiiTG8AviFxV0wlW2iRdu72Tlf+bFFGROJPVRWMzkwAFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PPd+6hml;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7377C606A324
	for <linux-next@vger.kernel.org>; Tue,  3 Nov 2026 14:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PPd+6hml
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D1EA1F00919;
	Tue,  3 Nov 2026 14:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793714899;
	bh=G6/DjyF7KKrhq2ihxZk1jTJ/qEo49ZkCozqJFemoqt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PPd+6hmlGgrKBYp1ejEBhCd+A3l3J6kZ4YKjufZHg0xVuhKhtRGQnfR6VxNqfLO1O
	 1mZdvltSnED+sesL/6U4HWMVPBwZDJpkdcQbDrfAj+STQYXV7m8ibteIXWKSyI0ABJ
	 cBOsV2D9YKgdE1FS2ZBHK913ReJ8evZLUdegJlPL1Al1xePasGtrIALIVZ5maFbXzo
	 m1vs0dyTBWlqMyFCVfGgOBEQmtUg0toegcAAQ2YzR89d1FEqGN7/TLTAYZJfW6rPeQ
	 C5Kr8xSbp2CrWoAFQ29urR/k9iMElygp3MzstzWLNEzV81K7buGsA1lZInNwAAZIyN
	 T5Y/AKnRGA6iw==
Date: Tue, 3 Nov 2026 14:08:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Matt Turner <mattst88@gmail.com>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: please add lindholm/alpha.git for-next
Message-ID: <53d08222-b062-4552-ac8b-237b78e856c2@sirena.org.uk>
References: <CA+=Fv5Q-iKk7qhN7TEbv4LuUeNau2iKwSb=vjx_a1w8-6mgEFw@mail.gmail.com>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tV7u7SYTx9CbHZfC"
Content-Disposition: inline
In-Reply-To: <CA+=Fv5Q-iKk7qhN7TEbv4LuUeNau2iKwSb=vjx_a1w8-6mgEFw@mail.gmail.com>
X-Cookie: Small is beautiful.


--tV7u7SYTx9CbHZfC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2026 at 08:22:42PM +0100, Magnus Lindholm wrote:
> Hi Mark,
>=20
> I'd like to wire up my alpha repo into linux-next, could you add the foll=
owing
> tree as alpha-lindholm?
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git
>   branch: for-next
>   contact: Magnus Lindholm <linmag7@gmail.com>

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--tV7u7SYTx9CbHZfC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrp6s8ACgkQJNaLcl1U
h9C4Iwf9FjRnN9/vrs40iiOfqcrPgACILWon0Lol21z1Ts0OT17TZ6iLPGS/WWqm
+zF7t/OjJs0+mgqeG9Y7uzsFTBec1ZkBzK+yATx/L+YJm9s/6xwmB15HHqcA0qPa
DrJlFHvRureIcfsnT4CcrpgMN+1tpM9QmOKqzU5DNrKvYyhgmCzwtKzRwTSPyz1j
Q2F5SVK7cUeiq8dPRTetH5mi8dPkMPe8Ayp5tzI3dCc5qssR0+Z7U2NOgjDL2BjK
GpAVkQ43RcFBS8IXLBtGHyBsUdQJISlRmciS97yo8LIUtZY4ez8/7iSxGYzVnHXR
ULv8eWf06Ghq3rYX5VSw8XCnvo9xzA==
=A18H
-----END PGP SIGNATURE-----

--tV7u7SYTx9CbHZfC--
