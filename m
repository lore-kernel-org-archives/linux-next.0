Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795189285;
	b=Mbs2hK/TocgcXQtzMQR0MZQTmqvTT+fENy53NGWkyW9DVcp3nT9AB+DPNtaMdiLwcsSH
	 edhWCrGKen2ixkT4m7fzsy0yr/o7U8gUzgPqQzqmIPk3ONnIg4k/KAIJPV07QTV1/VqLQ
	 OMntFOGt8VyCa+elIOgVSnhzhCbhhGm8VEubtHE73kNh9fZLPwKbDjMTR6I+jxTJ2EwgK
	 KdJHYVe6e+CZtxknffvzkPDrYLZ5H2q4g0sFM/xggS8+1p5LSP2WiNPiDCodEc6RYr0cG
	 UXjlid61QHI+QJwLjujRHSLMNSg7RhwUW5UtkGePIjPCIjLs01RpCt66KRFCdDm6zCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189285;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=0u/wpmtFI/u068He/pgxo/Q3EgnPvVreDBo4E3j09uU=;
	b=mz9vsgjOgA5IVGOUXDRyqiH1lAJ6adoIl8sJozmQY9r7nlPNoMCjMkQVl15tY3RPLbTO
	 AYVrp0roaNl3OIQtc2JEJptf/gHIMSHjluPo3jZP2fNA8wHu7r/nrOfMxeiOXnaicfAcm
	 GwhYtr9etnh5DQZIJHBG6MA33lkJ7k6K4zbHlQ3caDkPnKMnkvUX4D8SPoZWjHso2xMqj
	 F+fHywCDVMdzpS7sA1Pkzz27dqPZsQnbsxmkwAkue/0pAOeCjdtq8M03NvuLmg3x9kitQ
	 YtbKFK8ssukwJMqB6pEPTRC4QOgSpyeFY7cTLlDeyTpYpWpO1QwLgQmg2oDU4KkseVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AFsil3rP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EDB606A320;
	Fri, 20 Nov 2026 15:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AFsil3rP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E591F000CA;
	Fri, 20 Nov 2026 15:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795189285;
	bh=0u/wpmtFI/u068He/pgxo/Q3EgnPvVreDBo4E3j09uU=;
	h=Date:From:To:Cc:Subject;
	b=AFsil3rPBoRQp7d19lkJaygaOxKHQbnkQTKD4ndQEYjbbi9A5VWkx0sx7LVfxlKMf
	 wi+mfy9jOpVD/wOVT15Ijwn7bzzXoTWm94fqB8GCh/FN+eOTi27WsxEzw4DJNrXUo7
	 9QkKQh1WI7jd3sFxonVGoxAA24Rlv7JZU/cM9MCrzTlIeuaftYOhwelZ5aZ5BEP/Y7
	 ddJn9lR2wmdYiYSEb1IX7scNtsF3I7oWEfM58x1+z2VJBQ69hq56n4HWzy/ViRbcU2
	 V5S7ieIS85xV3lHUF5/D/JSglSNhIqlsvy2a6cPW1mYz3rGuzOAMC4vjMQo+NBTwh5
	 x5Bq9UMMN1X1Q==
Date: Fri, 20 Nov 2026 15:41:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: linux-next: manual merge of the leds-lj tree with the origin tree
Message-ID: <awBqIVPvQaRJN-bU@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="429Z+Q5KRaamHAFV"
Content-Disposition: inline


--429Z+Q5KRaamHAFV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the leds-lj tree got a conflict in:

  drivers/leds/leds-netxbig.c

between commit:

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")

=66rom the origin tree and commit:

  41ea2c75f886d ("leds: netxbig: Fix platform device reference leak on succ=
essful probe")

=66rom the leds-lj tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/leds/leds-netxbig.c
index 6f59f91fac6c8,3a0456eae2c32..0000000000000
--- a/drivers/leds/leds-netxbig.c
+++ b/drivers/leds/leds-netxbig.c
@@@ -461,32 -461,30 +461,29 @@@ static int netxbig_leds_get_of_pdata(st
  	}
  	gpio_ext_dev =3D &gpio_ext_pdev->dev;
 =20
 -	gpio_ext =3D devm_kzalloc(dev, sizeof(*gpio_ext), GFP_KERNEL);
 +	gpio_ext =3D devm_kzalloc_obj(dev, *gpio_ext);
- 	if (!gpio_ext) {
- 		of_node_put(gpio_ext_np);
+ 	if (!gpio_ext)
  		ret =3D -ENOMEM;
- 		goto put_device;
- 	}
- 	ret =3D netxbig_gpio_ext_get(dev, gpio_ext_dev, gpio_ext);
+ 	else
+ 		ret =3D netxbig_gpio_ext_get(dev, gpio_ext_dev, gpio_ext);
+=20
  	of_node_put(gpio_ext_np);
+ 	put_device(gpio_ext_dev);
  	if (ret)
- 		goto put_device;
+ 		return ret;
+=20
  	pdata->gpio_ext =3D gpio_ext;
 =20
  	/* Timers (optional) */
  	ret =3D of_property_count_u32_elems(np, "timers");
  	if (ret > 0) {
- 		if (ret % 3) {
- 			ret =3D -EINVAL;
- 			goto put_device;
- 		}
+ 		if (ret % 3)
+ 			return -EINVAL;
 =20
  		num_timers =3D ret / 3;
 -		timers =3D devm_kcalloc(dev, num_timers, sizeof(*timers),
 -				      GFP_KERNEL);
 +		timers =3D devm_kzalloc_objs(dev, *timers, num_timers);
- 		if (!timers) {
- 			ret =3D -ENOMEM;
- 			goto put_device;
- 		}
+ 		if (!timers)
+ 			return -ENOMEM;
  		for (i =3D 0; i < num_timers; i++) {
  			u32 tmp;
 =20
@@@ -511,15 -507,12 +506,13 @@@
  	num_leds =3D of_get_available_child_count(np);
  	if (!num_leds) {
  		dev_err(dev, "No LED subnodes found in DT\n");
- 		ret =3D -ENODEV;
- 		goto put_device;
+ 		return -ENODEV;
  	}
 =20
 +	leds =3D devm_kzalloc_objs(dev, *leds, num_leds);
- 	if (!leds) {
- 		ret =3D -ENOMEM;
- 		goto put_device;
- 	}
+ 	leds =3D devm_kcalloc(dev, num_leds, sizeof(*leds), GFP_KERNEL);
+ 	if (!leds)
+ 		return -ENOMEM;
 =20
  	led =3D leds;
  	for_each_available_child_of_node_scoped(np, child) {
@@@ -540,14 -533,14 +533,12 @@@
  		ret =3D of_property_read_u32(child, "max-brightness",
  					   &led->bright_max);
  		if (ret)
- 			goto put_device;
+ 			return ret;
 =20
  		mode_val =3D
 -			devm_kcalloc(dev,
 -				     NETXBIG_LED_MODE_NUM, sizeof(*mode_val),
 -				     GFP_KERNEL);
 +			devm_kzalloc_objs(dev, *mode_val, NETXBIG_LED_MODE_NUM);
- 		if (!mode_val) {
- 			ret =3D -ENOMEM;
- 			goto put_device;
- 		}
+ 		if (!mode_val)
+ 			return -ENOMEM;
 =20
  		for (i =3D 0; i < NETXBIG_LED_MODE_NUM; i++)
  			mode_val[i] =3D NETXBIG_LED_INVALID_MODE;

--429Z+Q5KRaamHAFV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsAaiAACgkQJNaLcl1U
h9B2BAf/YNL3IUKoO1A/dncxOaCzbTBahV/kLuktorBy0CHaODrOwllUqXHphI5R
V8F76p67WZlttFCGZQ2bPdCRTWukczJ6CFnc3R4LyHVXftnN5Gt3C86bpsPu95qz
8RdQUL239MJsxzBD6GX/GWH52mO/5OPTOC5xqPKpeqB59sj9b0RFyZOFC6RuhV6p
eTzH0T7kQIhziOcFK2MjlmJfaFA4Si3pjH3q0iiyRG9jijLARoDazhVGk/mhegIa
6HXZoSJJDbDQD5Sl4OxUE4MZin4wcw3yOLmnZcGGB2AAhCuTdDJVtqMTewjw8Qr6
atOuT9boQ+v9C0xNiGvQpooP9OrC7Q==
=eMKi
-----END PGP SIGNATURE-----

--429Z+Q5KRaamHAFV--
