Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4535947D440;
	Wed, 12 Aug 2026 16:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786553132; cv=none; b=fkHJ18I1ZcE37lT1hBUvkerX164+h7LjyQI8J32UQj9eKP7iK1IQSfWC3/SCyM6kf4gg+5HSTyhO1ZHgoYVePQn40wzAj5w6PeHVyd8IfFhyEFAZIyerk1mbEsyFkJ+x/jecRwSsCosA6ipgO6TH3yt1k/JNN/RKFmJixKES2vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786553132; c=relaxed/simple;
	bh=TQHXuHPhsjnx1xR2feFhKfg1lyR1LQEOeTRBZM7p0Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UsvRNGLXSfcSNT/Az57lnjg6Pfq8HfFucZ5MaAE/THm2U6b2AlIpnZnzXEZSrqcUXcgnmexAMj/3CGo3FFNbpsshkiHq0g0JGKcLaHzRrvn/jleqv+KYEKsBWcH93KBTdsX+wpBfFQetbZOh70tvTLETbGXTKxKtWTWJk3aeuVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MQ9iNs+B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MQ9iNs+B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11F0A1F000E9;
	Wed, 12 Aug 2026 16:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786553131;
	bh=BvFVVlep9vFMeh5MZgAXQf9ORT2C3/s+8FvGqtkfdA4=;
	h=Date:From:To:Cc:Subject;
	b=MQ9iNs+BNO287mh4HFugKnZe3VrAVvPPlQHBpaMVP/jAjJsDdVKlAwygcKSBrMpz5
	 r7NiI9JJBXsRPkWTHMwCDX7XTzS3ZavokO3DOr8Hf0XtwS49c4gTZlvUnoGb/HDd2t
	 dWGibsG28RWi0qn8b2YW1waf96coVxO9YIYvgsHbCuHLQ4JkSg4FD1z7sHu87kKdXp
	 YO/izusYswYocIuS+n3o8cPbqWniFyc0uhl7lm9DokT7UvCUMMa0ayMHJmnmTUT3SI
	 imXsBD+3UgE1OwYi+tIuY8DAjUxZyKK6f8+YblRNUjpBN5WZLdreNGXE+izCojUk8P
	 NK352V31bmaBA==
Date: Wed, 12 Aug 2026 17:45:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Alex Tran <alex.tran@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the gpio-brgl tree with the origin tree
Message-ID: <anyjJ6DSHWCjuB97@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+8I3DUiYXKoI93HH"
Content-Disposition: inline


--+8I3DUiYXKoI93HH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio-brgl tree got a conflict in:

  drivers/gpio/gpio-by-pinctrl.c

between commit:

  67ff4bf723c8b ("gpio: gpio-by-pinctrl: Apply initial value in direction o=
utput wrapper")

=66rom the origin tree and commit:

  408866669ce01 ("gpio: gpio-by-pinctrl: Apply initial value in direction o=
utput wrapper")

=66rom the gpio-brgl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpio/gpio-by-pinctrl.c
index fb8440acb31d9,f54efd635f139..0000000000000
--- a/drivers/gpio/gpio-by-pinctrl.c
+++ b/drivers/gpio/gpio-by-pinctrl.c
@@@ -54,11 -54,11 +54,11 @@@ static int pin_control_gpio_direction_o
  {
  	int ret;
 =20
 -	ret =3D pin_control_gpio_set(chip, offset, val);
 +	ret =3D pinctrl_gpio_direction_output(chip, offset);
  	if (ret)
  		return ret;
 =20
 -	return pinctrl_gpio_direction_output(chip, offset);
 +	return pin_control_gpio_set(chip, offset, val);
  }
 =20
  static int pin_control_gpio_probe(struct platform_device *pdev)

--+8I3DUiYXKoI93HH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp8oyYACgkQJNaLcl1U
h9AEtgf9FMnPRYP73JQsCcLZcJnFSgzP+lUoZJVbzeqCp8cPWQ2Cv6/YtDoACvyt
qKYYk/w72hG2Om1rNynIFXnJqqu2l+UdRDKuRvlZiLCx7ANAi83sA0+h3JPWrbgA
tXma6CC+APP4rAvo2bcb250bTAtNcSltsSmXcCwApflSq1PoXNScfOMPNZggzaSE
eoaR3sJ61UA+J4cRnvlmKF9ULCeUYsAqliejxSBn2LGWTwjg5ZCyqLePPYyK6hea
NOAyHkGsYQKQk1mHhdqkiTZxDnM1QvM/6+s5/5lYBvn11ichwaPulK16WnaOJCRr
zRE1XmBCa/OJqH9LoSbNYGB/PWEtfQ==
=Qh8W
-----END PGP SIGNATURE-----

--+8I3DUiYXKoI93HH--
