Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444164;
	b=zdDernD/KdxK//JHZbM7UNpLqqwksG7zFRtk3taZuraAnSvd4GCeXbwUXvT1hW+uJCKg
	 Mt3rBHA6tFHjdrTTm7eQNuz0n5E994Hu8uEYwAsXFBnTupbHi2IKOG0gtFKV1NK9lDv0K
	 Yl9hI5V3EILDbwsLsEGG8yja//96Q236DQxRSBn2sr46JU3CME8KD4dwIkJTKLALd7ROl
	 VG0Mj5/CRFloF+v6OHI2ZabDBd9Ci5zG41T6AkUeD6JF9iBrl7+FsODIWIW/H8El6WC+4
	 MH/nBzaQoHwlMXukk9DCtKQ+qgzr/w6iKmE/zwSanoUczE0dCwXWMS9Pltcht4/8tjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444164;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=2DKeGxOrlXTkh3jfoRdpXWfaHKZBI98WSnTmSPMlwvA=;
	b=gGzoi5b+9Dw3Y6BzdA6Hu+e8B3ANOr+R/8Wd23GtNR0cH0LF17WfPwP0rxKdJjvg8ODg
	 5tNkGWkRiGJIVQuuSsgCFbDjgWN+YOo1EAWIlsEGMZB1EBEhP9WaX6CuUmnjN+ZEBKdn4
	 lPxdBm6xFcGvs+8qz2S4iTiUqfrUXf4RIA96XDThJ1U88hsvmDoTbnXhj+ug1rR7XD88k
	 AHCIApJODv36GYrBKx0OL1FMsjL8g1DWsWYiGxszeB6Unf87cEcxtlJbSKCRzc9QgNMfa
	 znnHpfRVFyqUVXwXKK5a3iDFUG++LfTksM2fSKxVPziueC1taoYzI8cRKiqt+1/ublw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EOFxaD8r;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE417606A31A;
	Mon, 23 Nov 2026 14:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EOFxaD8r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 736E61F000D3;
	Mon, 23 Nov 2026 14:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795444163;
	bh=2DKeGxOrlXTkh3jfoRdpXWfaHKZBI98WSnTmSPMlwvA=;
	h=Date:From:To:Cc:Subject;
	b=EOFxaD8r2nBhfalwTlrTD7gC6uJ9O1rEpTWaSzU1u/d4hUOh6DbCgX3t/9IeVnq3h
	 W8uCRAptZE0agAHd3tXBuerMqKCh6WXw5kTl0lKjDMZRBEFpFEhGXB1brX05aP/n8w
	 eAsIK5T8chHdzE2bx/5w7fFjBnvkmkH72e+2/7wvaQLpoG7PIDG6fZYwKy6wHUNKJf
	 icVP11kroxzveSgeT0sfez6TlSDuxXDdvsn2c+iU3ATLVHZSzolrfN6BxWC26jxkgF
	 V6mXkzm601bCeDTQTmT4a5+T8yBeBrb6bW/K+/vUldZkK/tokpkJ0HtTNo0W1NRKxc
	 I4aXQiSrTA+pw==
Date: Mon, 23 Nov 2026 14:29:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kees Cook <kees@kernel.org>, Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: linux-next: manual merge of the v4l-dvb tree with the origin tree
Message-ID: <awRNvzJzGfwCbnm_@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="JyKQGAlvRjt55MIp"
Content-Disposition: inline


--JyKQGAlvRjt55MIp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the v4l-dvb tree got a conflict in:

  drivers/media/i2c/imx678.c

between commit:

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")

=66rom the origin tree and commit:

  371d2cfa91880 ("media: imx678: Rework into a common Starvis 2 sensor driv=
er.")

=66rom the v4l-dvb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

(Deleted the file)

--JyKQGAlvRjt55MIp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsETb8ACgkQJNaLcl1U
h9BlSQf/V+JS5qbkDxv4WLvPqDQVgoBGBilCMZnvdR4H1M0/65RUjSQWXw3mCj8w
+QUA1y8j29NAgV1l06nqSeNqqE24w8oqbe1Jh9ODysNtm/fM+rcfqPcHu9x2ttXO
rXsNdzI2gtTbvrDq5cltEWak3aEsvW/PLBwWui8BoWhKFVPREK6xixSMFD5ZowI7
tMk/Uk1QuOIZM2IKI8kR6+UVpbDsxaqbpwiVQlS5Tl+AGYXMKirmPf6Z2N3dDT/g
whvvy0uI1sPsmGMbt7qoHKrMysa0bw9VYMxH7ymLOvJYD+jN+zt/piq3TXqJrUpG
ogJuGCwTUru73U2u1XYIEq4oxQC6cQ==
=yHMF
-----END PGP SIGNATURE-----

--JyKQGAlvRjt55MIp--
