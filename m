Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791701;
	b=PA/4BqAhyHIemRcPxunsebR0NZ6oMwAZHCNnRfGldKFVzEAMTQOvFjjIc3afJw7tVGha
	 nPN50+CREAfPwsoayuV2iM740rQWFna3lDBSuZ1rhyR/LqEBD5KDGupM+qAKJVhiFENXe
	 eoqQLJSmtyuR9Xttbyrg06Db5MpNLvrWj+lwHWG55mQ7IkeG5z7tGkqYpMOWGlJ7Y/f+7
	 NzuDhH7mA0po/2HECvDTu14+mKdfdCg00EaYSzABavfUAa2oq7yjiaahUwlFL3cp0Rawq
	 JUZglbD1LQ448zSiSuAwWsrDkiOSeV+oo2TLrmmBeWHJdQH4986Y0RKhGZ4zgOt+e2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791701;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=Ssy6oZYcrnAr6VFnWm3lo0ZgtOfINwdh4srcUNQ1fz0=;
	b=hvefp9OyyOGNPzsMtmSJaw/TfI/PQSpcmchKD+8G/q+mNifYrgsritnwqpa93pxa+YkQ
	 DxGrqceiHh5pDRUHdVz8RPTamJbW5nUvjsc7aong+cBILGmLPLgXxEFaaD/FWnxvIf6rz
	 hH0HRoxsjx0gL76iTos2ryPS+I88TA7kJjEe8EQDfmTpz1Hr2+ZHddQ/63ZHnrps0rMyA
	 tHbOFrC2Yz+cvui/Yckt0sRCARV2Ghs79mvx0C7EK1ZFOzeeo84HLik8f417yTc2Sr8YA
	 +s5iExbwabJmGLdm5Wt1Z4KGJSaPFThXTM9hYrjzYRMvDml+NEonGSabB4Ky65k9OTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cLTVyyRb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F178C606A323;
	Fri, 27 Nov 2026 15:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cLTVyyRb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C8B1F00893;
	Fri, 27 Nov 2026 15:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791700;
	bh=Ssy6oZYcrnAr6VFnWm3lo0ZgtOfINwdh4srcUNQ1fz0=;
	h=Date:From:To:Cc:Subject;
	b=cLTVyyRb8u6p7OyKo9Ojtn4oMlqHQUWi4V4TzhiKQC7LltxDBKbL9hRK+bZCd6NVy
	 EP4TGluiPsRAyw8NvI/IP0W6XEx/QpTe61xxL0ROkNtZWS1rNq5acadUZoFDwsnVtI
	 zvGnIC+TpKJM5pvLZUAap2potTGMeafhy+UHb3Koopufajb62/93jCtthBAcknI1SA
	 wZs3/2OOd7ZAX8xW0hk7Qze4PSpkYX+PVJzkr+sXt/XRyKEKCyNuXa+EyBey9RZIO9
	 CAhoBpb6UZuNdLFmXnHMwnHcZuuVP5PesoVnd8SuxDpIVQxSwj5UcNiJbmfSbu19QT
	 MznMMCerC1VSw==
Date: Fri, 27 Nov 2026 15:01:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: linux-next: manual merge of the gpio-brgl tree with the
 gpio-brgl-fixes tree
Message-ID: <awmbUOUEgMuySbsM@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="juE2kzRNIhIir5Oh"
Content-Disposition: inline


--juE2kzRNIhIir5Oh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio-brgl tree got a conflict in:

  include/linux/nsc_gpio.h

between commit:

  d4dc896fa2bdf ("chardev: GPIO common access methods: repair non-kernel-do=
c comment")

=66rom the gpio-brgl-fixes tree and commit:

  b1e22d55d4a87 ("gpio: remove the legacy NSC GPIO API")

=66rom the gpio-brgl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

[Deleted the file]

--juE2kzRNIhIir5Oh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsJm08ACgkQJNaLcl1U
h9AV/Af/RQRx6fwWds0zLKbFtwQmUUaSk9qYhrIUJ6V2UcTVxNCcTDU1UjPZ16xY
S26AJcalBFF9GFAY3Y53gmpVSB96UCwlcE96BvCYZkKhV7WPP+muOieOIt0DTYjT
BgjOrOh8+aoOgTaIHkwBvsVZehMfPcE28ycRobK7EbriUCHxqPhm2SCDjqMNvUTR
cK2mQ+tMuPaIbfxsQi2N54kknFL66Audt2/o9pX3xkhZ0JkS5GpJYhYweDOxNlCF
jBDZtcNtrNVsgJFF6HFu03HpsT74nPu4QJI/uPCsSrs4nO3agflQbAOCewfpGDSB
XC5Ayf5gK5vwTjqFFZKup54WBcJqRA==
=rThq
-----END PGP SIGNATURE-----

--juE2kzRNIhIir5Oh--
