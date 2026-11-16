Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867946;
	b=bj7Xy9QNDPoy2EqNP1SpBu2jpqD1vrWN9S2EAKC6j7aFTXwZoVUhTJY2lLRvBwLKSGYd
	 nIqp+0PvJSQTEV55VGiYHKiVddqqjpF0z+qVWQd/+xmoRBeov2fGbvcjYQOLl+ytUfT7e
	 zXXp5vqoUuZoOhSl3hk4GWrVcN+N3sXiOn/DIYgFwh/q4f45s2aVfeSs9RdaBq0QF2V+F
	 Y7yqMfZDyD58DaYSnfASUK2y+FXz7mGjxkcOYiRvM1wKd7RE8KhwI65+YQlhT5hSDDFzx
	 OhV97BpXRC4LC5QDJ87AD5fIdOD6IaQcK9bbdFQ7f2ZlE5VonkOHdZK492Ah0vtyRSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867946;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=RJXFs6Tk3oivnpuAnKh37VNAJjES5oMcJcv7k/Z2+fM=;
	b=lhRyMhHpqEbXhrJYQ4z8j9PX1EtGd5a4yGKRMyB6K8toXERVassJAozWr+pWvwti04mE
	 a1qQchfr0zVYq/BI6ago6s+JDvtXxtQipjyopXxUlvpAWk1CfYWPb8pcGQPJ+cYoCkWyL
	 U7drL23vj8lTRyGamDWY9IDm1qtSXDsqWoyJlAl0ZB6GkMLMNX/U4OSZqGO8VhIFubXob
	 S24t94Bddj/mvd9gvW1vtaKJmkoIQUPnOdqHGwrbWnBCAI8UsMa27zk32PMl98twPRwYy
	 U0oh7neXw615+sRAHCAZFM+lxO2ToSibiin0GooK62X1T+jnfnb4x3p+fZ1lIKaX3sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OcF+2Rbo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A299E606A31C
	for <linux-next@vger.kernel.org>; Mon, 16 Nov 2026 22:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OcF+2Rbo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D00FA1F000C5;
	Mon, 16 Nov 2026 22:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794867946;
	bh=RJXFs6Tk3oivnpuAnKh37VNAJjES5oMcJcv7k/Z2+fM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OcF+2RboJr/Qm63cJAFCR66s32A1BNFIsoY2rgbZ8cML1XrlMqemPJVv9nwB474TM
	 VDaPlZy+a74BzGT1sfx2Oeegp4AcHiq1EghPxQQhiKdFzi42h67bS0A/uOAQIBjxNT
	 vhZStj0QDFdhpF9W/NyHW1tv2P1nphGDRai9FyCmlcQYOdcHKG1XeLBzzYwvgLsmVO
	 haFj1A/LK0g4Kg0Z6Zo52pQ3n4qXRQV3TmnDWRz6/1tToTt/2sB0aVAm11VDNOdbrK
	 SjjGdx6vfgxs/y/F+R4KBKMQk05Xtwk3K412kVXI/CF034AxRJBm2tQbPYpK9+R4rZ
	 ZlOG+/8f7h21g==
Date: Mon, 16 Nov 2026 22:25:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: linux-next@vger.kernel.org
Subject: Re: hexagon tree inclusion
Message-ID: <ed29611a-1942-4d7b-bbf6-32da4d3d15a8@sirena.org.uk>
References: <47317123-f03e-4031-ac4d-b1f06098e2fb@oss.qualcomm.com>
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
	protocol="application/pgp-signature"; boundary="btZ57j3FJIkiJau5"
Content-Disposition: inline
In-Reply-To: <47317123-f03e-4031-ac4d-b1f06098e2fb@oss.qualcomm.com>
X-Cookie: Madness takes its toll.


--btZ57j3FJIkiJau5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 01:02:54PM -0600, Brian Cain wrote:
> Hi Mark,
>=20
> Would you be willing to include my "for-next" branch in the scope of
> linux-next trees?
>=20
> git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git

I've added this, it'll appear from tomorrow.

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

--btZ57j3FJIkiJau5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr7guYACgkQJNaLcl1U
h9Clawf/d1p1XTqehMgO0obw5sEGi30aYoy06kU8Na4Qb/cj7R9O41nwz3JN51wI
W97QSgiQ1zHZduZ/csVBvNE/OuQVgTF6pgmAtZgbE5vUxWfmKnUiKQlq7Nf7X/d6
DmsyTCyqkX7Tb3cRo0tDCRD5oYKQv95vjhBfPNZKW/JIPwq/RBAPCduQb1a1mtjo
ZcmXRkXF6N6nEoPrUPQUrGYA5rSN6GniGFn+aZPfSorxtq5SHwrQz2MLRCzydVF+
W6iU3qSYGSNe/rLVTFqjUD1gyEk4sHny6uWPz9Cazcqb1fnR6RiVFxfU4IobKNbm
0i4BxaknhyMccS+GiUdZM22KDtMqSQ==
=vKXu
-----END PGP SIGNATURE-----

--btZ57j3FJIkiJau5--
