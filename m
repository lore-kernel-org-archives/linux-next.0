Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791687;
	b=qKidx4/bktUftJ6hKAyTdcPf3rWHbaCJR0iLPwK1UnlEKT995rfso+pk5nvSy0OLoRcZ
	 vuLud0NJwef9uzaAOL/9kpk61CVeHiIRIDP4JUnOz4WmksrMuu2P4sWCY9rvcYo9PT4/z
	 xesjpD00aeZM9ds7Coi5veUtfcsiyEOV4HWUXWGdOz/KTXW/4kYQDrgIdpiaKrrq7oyDb
	 K2HEfEtFiVDGpqiRM8c6L2NIV6VZcSZWHm07D1Ex5TlebEKFcPKXNuJFPzfSozoEgzZx1
	 Ubk5+J/tIb7YV+iLwfW9Ki7+Yx1/phCK9VayyqZgCSCIB+kOawqthSpRCXYQSnMZBWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791687;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=2zI4qNnvuMdNK0PZDx7YwEUCh5vlvy21ubx95NsYxAA=;
	b=1Ee0XfEWHeF8OEhlmopFHlrT9tiJEiSY018QLuh7g6+06/HZ+0EctGF7YYnBQ5R/AM+i
	 ngq+qirpIyjCQ2nH7wnJuxOLbklBLElZtZdo2syxpG0TGdLQze0RsF+8J5/CA43oROZez
	 DRVnw/ziXEwZuGvBJMxA4xjTA2Sf7XsQsb4liI1QNLJMxrwRu9k50c3gzR6lg8JMOTjWm
	 lWE8uRSQvrn6k6wzAJNrYIGaDrJ4d4Mdselh8vKgnU8aPvOtaNaWOpT/AlswBCt8DeH+W
	 LnN5hEdPlhMZEpxYGHvlyNcZwk9YVBg4tPRVfeaKL5MO1IXPy8PABLyDGcEYmfIjC0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fI8JZ7js;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361A9606A324;
	Fri, 27 Nov 2026 15:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fI8JZ7js
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F1D1F00893;
	Fri, 27 Nov 2026 15:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791686;
	bh=2zI4qNnvuMdNK0PZDx7YwEUCh5vlvy21ubx95NsYxAA=;
	h=Date:From:To:Cc:Subject;
	b=fI8JZ7jsB4e4OW2pv4P3Kc8dGM4+MBD2L8NcKzbk8D9ZhIGN+LGcOne2QCGgLKFYK
	 BNlDiUdiaR4aPf+oDqiaq0T5UGnxWlarDKwYO6f2N9VtRDOoumQWHH34cOozDgTa8h
	 Wlfq7v/4bkhMtCyJOpiJeUbaOK9Qhs05jAdQZsQFGd4niEyOPP6yP7w2m4d+4apIwl
	 5WaGYgyNE6wbtpYOH0exdpGSVKxmW11DaFOXRebF/cZnAlrriCvNsedwSlEz1Num7U
	 YAPRTyi5zJU+O4U2spLOLJdLcMFrMRoRFYQNaonpWhORocIzJH8u0h2Rp+TYtZ++MG
	 qr3WTYnjgoKoA==
Date: Fri, 27 Nov 2026 15:01:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Yige Jiang <yigejiang86@gmail.com>
Subject: linux-next: manual merge of the leds-lj tree with the origin tree
Message-ID: <awmbQoTloNNaeRhb@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="wBKroB/oaNe25kpb"
Content-Disposition: inline


--wBKroB/oaNe25kpb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the leds-lj tree got a conflict in:

  drivers/leds/rgb/leds-pwm-multicolor.c

between commit:

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")

=66rom the origin tree and commit:

  68c7c6f993cb3 ("leds: pwm-multicolor: Manage the multi-led node reference=
")

=66rom the leds-lj tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/leds/rgb/leds-pwm-multicolor.c
index c8395fdbcbdbc,10527a64d1982..0000000000000
--- a/drivers/leds/rgb/leds-pwm-multicolor.c
+++ b/drivers/leds/rgb/leds-pwm-multicolor.c
@@@ -124,18 -133,15 +133,14 @@@ static int led_pwm_mc_probe(struct plat
  	/* count the nodes inside the multi-led node */
  	count =3D fwnode_get_child_node_count(mcnode);
 =20
 -	priv =3D devm_kzalloc(&pdev->dev, struct_size(priv, leds, count),
 -			    GFP_KERNEL);
 +	priv =3D devm_kzalloc_flex(&pdev->dev, *priv, leds, count);
- 	if (!priv) {
- 		ret =3D -ENOMEM;
- 		goto release_mcnode;
- 	}
+ 	if (!priv)
+ 		return -ENOMEM;
  	mutex_init(&priv->lock);
 =20
 -	subled =3D devm_kcalloc(&pdev->dev, count, sizeof(*subled), GFP_KERNEL);
 +	subled =3D devm_kzalloc_objs(&pdev->dev, *subled, count);
- 	if (!subled) {
- 		ret =3D -ENOMEM;
- 		goto release_mcnode;
- 	}
+ 	if (!subled)
+ 		return -ENOMEM;
  	priv->mc_cdev.subled_info =3D subled;
 =20
  	/* init the multicolor's LED class device */

--wBKroB/oaNe25kpb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsJm0EACgkQJNaLcl1U
h9BtVAgAhdGKAgaVJHi9+KffJw1w7Xo7vvsnkI8dD62CMtnlrRIMSgrrTp5Lu4CT
aqphKcGSgkYUbqqYgnQ175tIX3zPzxz3FOlk6hbI7Q6wE/BLA9P7HpTeB3V3ehpp
B3DRcxNFonOX5ybeUg+N1OKofKKNk+QACMEZg+8BYz3v5idtc1opiRy0fLaPfLTv
oVo4pBm4wY2hsEemYdRzWuaKUsp2g8B1/611xWpKdgHCk1jJY8Tsw5H2+YSObOkp
1aI4A5VObCQhp2M8B9EIkILI+nvIdf9HVAZczmtsKWwm1qLjHkkfmXm6O0UbTGQo
oEVCqq4caLAw1WDnu22A7HmsHv95aQ==
=JgEk
-----END PGP SIGNATURE-----

--wBKroB/oaNe25kpb--
