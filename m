Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791675;
	b=wep189ni8pjnVzxwVEI649QtnM7jf3SGJ2qYbQDIP8YqPaFm9/VGuO41+iZbKRrLrn1B
	 TYr0CHPxVTH344x/sj+RBpn31LU2O5XuylcZcgRsycS3m/pEK5LLK3EP+mGaNJXpGsNbT
	 1KSlHR+04o1JaEa2c8Rfx8WxR+COKBs6/WhPdfuZZsj6mQKqR/FQNQWlu+ydUX65VvZMB
	 CBSQkfAuIS9Ser+sCPtRGB3y5xf5b4AWZuwauQ/xgOfta6An6MRL6fsd/NI4ndPe7U42M
	 iB7ZCZQlfUZ0Hsl23Bxbft/Uoq428qsuVc5LIrff78/UJPU0+2XNWl5/WZATPSC0GUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791675;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=2NiEh6K//sJoPpZ7kaxePah8TnfpnE+PIBk+oV60UcU=;
	b=yqrvKBtU29vDbWaqqwuL6EGYuPgxwTVdnRzqVDJCYBdALvdKRXoAafqADJEbqjlGB43O
	 3+blYWL2fhxTsFo/2JKSGyBWe/9rngXZyZOQYLRPF4/FooDnFcvO2bokdjm8aZbUWsWvN
	 6O2Md6vzEd9yJzEIsfssIOfPn6Vt6VMZGQe8fL7mDCZUssbHMiVO0KtlPnhe2lmyH7hW4
	 7s45KX2imTP20D6XcwNEsKrIOz3pFdhfeBBt/jI9E8lCFDQ2sgrNSZ4Xt9+HkOs8PEz43
	 VakzH221O1v9uS6y1BQ3LKwWjFL3ZKHrOUitptIXN7lCukudXevrZQpeUnr57HTpTjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hbQqvIRb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D102606A324;
	Fri, 27 Nov 2026 15:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hbQqvIRb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 700451F000C1;
	Fri, 27 Nov 2026 15:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791674;
	bh=2NiEh6K//sJoPpZ7kaxePah8TnfpnE+PIBk+oV60UcU=;
	h=Date:From:To:Cc:Subject;
	b=hbQqvIRb8YZXLHGH4sBA9twocdxxtKMqi6kTxhkbdv6JBP53lphIZDjlAuaXaOsCM
	 5xMy15BCHcX/rBYUaPF6pDWQFJ1KptqYHiD6y/XD2hZJljBvJe2QF8v3s2LdUeG0NJ
	 pvlRwqwLrJMxePCYZ7ZqkboRO4qWO8uWpqohKiIiqM9UUD1XDNLMtvXXqoHajoCr79
	 UCESqoDIpyoVHHeJPfJWnWzoAX79j7TjtF4Yl5pWE44m+BoPA5PTc3BRmiJ4ULvm9L
	 W798p1kEQ5NK+0MDAwzLbnFJm3K+L9q+r22VMmSr02UB7Wo5RhF3N9TEyDrEbluw0D
	 xOJV1zq8vweJQ==
Date: Fri, 27 Nov 2026 15:01:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Joseph Telaak <joseph@telaak.dev>, Kees Cook <kees@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the leds-lj tree with the origin tree
Message-ID: <awmbNiVvKNtylm5Y@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="VSpUf4yXD9Iv/8WV"
Content-Disposition: inline


--VSpUf4yXD9Iv/8WV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the leds-lj tree got a conflict in:

  drivers/leds/rgb/leds-ktd202x.c

between commit:

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")

=66rom the origin tree and commit:

  84c670760a749 ("leds: rgb: ktd202x: Add Etek ET6326 support")

=66rom the leds-lj tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/leds/rgb/leds-ktd202x.c
index f1822281c3e61,2e84fed016f9f..0000000000000
--- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@@ -540,7 -903,12 +903,12 @@@ static int ktd202x_probe(struct i2c_cli
  	if (!count || count > KTD202X_MAX_LEDS)
  		return dev_err_probe(dev, -EINVAL, "Incorrect number of leds (%d)", cou=
nt);
 =20
- 	chip =3D devm_kzalloc_flex(dev, *chip, leds, count);
+ 	caps =3D i2c_get_match_data(client);
+ 	if (!caps)
+ 		return -ENODEV;
+=20
+ 	/* Loops over the LEDs go up to the number of channels, not of child nod=
es */
 -	chip =3D devm_kzalloc(dev, struct_size(chip, leds, caps->num_leds), GFP_=
KERNEL);
++	chip =3D devm_kzalloc_flex(dev, *chip, leds, caps->num_leds);
  	if (!chip)
  		return -ENOMEM;
 =20

--VSpUf4yXD9Iv/8WV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsJmzYACgkQJNaLcl1U
h9CjyQf+LbAXqb/bwi6kccWGxkoAEgt1a8G1ZVzJFcVC0uqdEtztypsdmqhQTGv9
gXZoxB/mO9YMRn7jFF+xwVGGqq4bIb7JIWsesiremafqyO6EPpPxoukhetY/+i4G
m/dzfdGm2dTEBP1xGV8h2FVSiSb8pR1esklgFJJgYyXCtxgVSx5f2jUdkdG+Bp/o
ZyjSD5ryqZuMOHB2oc9zXkWPtQ6vtCQd2EE97eYqsyD851yAhDx6uTLApvfd6slj
KH2LKUhjRoDGQOXgm0svB72YFisWrJAG4JXfN43ZZjZ5no/1P0cJBF3muBlxlLgy
6Wr1dqbSyD7VvEZHi4qjWfVNWCnicg==
=zVmr
-----END PGP SIGNATURE-----

--VSpUf4yXD9Iv/8WV--
