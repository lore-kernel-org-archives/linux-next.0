Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106505;
	b=lONnVIF9VCYrw0zK1qvLSt7WKdhAx1rRSjbtO8nn+7FBeOlzuMLvxqn1JajBWc39w4px
	 ymdCz1BorCA1PNzbq/36eLBT/YHKA5HXwlu75mb4JlYCRneG5FgBzkdTHKk6JBPE5gBom
	 /YOhT7v2JIOuHdeOa+bl5XfJuwtzv4crxKoPhvkJrVHtiym0zqyI0oiAvXGAEhXD7jNjU
	 weZyszgPyGh6np464lmgMQLrNze4uPp5JmukFVVlvAeDh5yYHk5LFTXYxhqqQo4aNrW8z
	 0ivAJpCn8W5oVEggMNi8qPfEIMk1XMN/JO1KheAHKI8oQgJjKTO28qMlcYG3za99I7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106505;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=/1NlOMdmQFxJ9HF6KW6HuwTUQRhZjT5K3TYCsds6K38=;
	b=dzEibfdlPUFpbYmTs9UYft0UPcF+kZ281vOnUzCFs6ZuqlcCrrcortk/32LC4m9PxXhg
	 M9U6eJPIRdr8eycrxsH8pCwc2s2jGiBCjYn4Fn+qSl5Z1ber5/F6rijMWBN86r6rHIoeo
	 6ohcg44zudKHrsDaTJGR5Yvx1WCYePR4FJbZqkz2OJtHWOufIQU1ehEiZ5PMYp50ZsfbB
	 8THAzm1qXP/d2bxHPjxBuEfJBKgXjwqnoQU9Jt0+bXm3AMfzw60l/zMoQaKsN2/ZrO01O
	 lR9RIRfO5EoIG6TiGiKgoN5u0+6f8O8qjHWnXDyHZ5DUiMkAs28OQ1Xs14CPuNdwN2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XSoJNLlg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE41606A320;
	Thu, 19 Nov 2026 16:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XSoJNLlg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C72E31F000C4;
	Thu, 19 Nov 2026 16:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795106504;
	bh=/1NlOMdmQFxJ9HF6KW6HuwTUQRhZjT5K3TYCsds6K38=;
	h=Date:From:To:Cc:Subject;
	b=XSoJNLlg0GBYG8CHpMLzvi7oNmq0ANk/AlH+weHxH5C74pEfxyO81Ee+WckEZxMzD
	 HbUhyJ5/XINu6d7vkoEJJhabedpptgGOjK/FHzjYEHVwXbL5l8dXBj/etwCpctkV5i
	 jyfH2F59nP+oAP0aIZ7QLbV4gKEd8pwG03zi84z58bEsHe2DloXDXsCiRynncJ1Z3j
	 Qr7/r/Dv6r0ju6/+2WHVeMw7MV+z8nmC76nFoLvu00hIxYcv2o8FWbeDa+EIlpMfiM
	 lQDZb9Oi7t+DoQ5A0+UoayBBALULrLFnVvbG6CzjI3dBsmyj7uAz77Vgh95tmOdCYS
	 IL24/VURNlcyw==
Date: Thu, 19 Nov 2026 16:41:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Kanak Shilledar <kanak.shilledar@axis.com>,
	Kees Cook <kees@kernel.org>, Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the iio tree with the origin tree
Message-ID: <av8mwr3uacGrAamJ@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="fW6r/cQB+7HZZo6W"
Content-Disposition: inline


--fW6r/cQB+7HZZo6W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iio tree got a conflict in:

  drivers/iio/imu/inv_icm42607/inv_icm42607_core.c

between commit:

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")

=66rom the origin tree and commit:

  c99b3501a5944 ("iio: imu: inv_icm42607: Implement MREGx register access")

=66rom the iio tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
index 2c0a15d6344a6,f73730493e529..0000000000000
--- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
+++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
@@@ -578,9 -861,16 +861,16 @@@ int inv_icm42607_core_probe(struct regm
  {
  	struct device *dev =3D regmap_get_device(regmap);
  	struct inv_icm42607_state *st;
+ 	struct regmap *regmap_custom;
  	int ret;
 =20
+ 	regmap_custom =3D devm_regmap_init(dev, &inv_icm42607_regmap_bus, regmap,
+ 					 &inv_icm42607_virt_regmap_config);
+ 	if (IS_ERR(regmap_custom))
+ 		return dev_err_probe(dev, PTR_ERR(regmap_custom),
+ 				     "Failed to register regmap\n");
+=20
 -	st =3D devm_kzalloc(dev, sizeof(*st), GFP_KERNEL);
 +	st =3D devm_kzalloc_obj(dev, *st);
  	if (!st)
  		return -ENOMEM;
 =20

--fW6r/cQB+7HZZo6W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr/JsEACgkQJNaLcl1U
h9ACcAf/bGKL55FP/KkObNPRox9LAPTkelZNtf9ZaspIq0bb3Jw7G+2wI+JGFavG
a8FfKqejMrN7TZkoo9SEgroumD9bCNLAwHo1oAb/1rcyFiy/pBo0JPms8AnoVCZK
i3TVyz18ioXun8yApupcfEl186XxPrDruTbvUJOzns99FI8/aN7IRGxyn0ztjjfp
R+BZrvM0Iat4sbO+iexTwWtnpnmJy7nFPFmnthVD6fK+TIilUyScHXGNJV3EUUU8
OdcsuIVvMIsGGfB0WqcdrtqtPCcaMEgMTJqqxXU6jkPzZbto/bmdauQ4D+eNaSIW
LLiaM6ZuhQ2SeLdpN09I6O38TyZExA==
=4lXm
-----END PGP SIGNATURE-----

--fW6r/cQB+7HZZo6W--
