From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the pinctrl tree
Date: Wed, 20 May 2015 16:40:08 +1000
Message-ID: <20150520164008.616458c6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/YSBTHAtwl..GI.7lgrl7e_l"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55294 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750722AbbETGkP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 May 2015 02:40:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hongzhou Yang <hongzhou.yang@mediatek.com>

--Sig_/YSBTHAtwl..GI.7lgrl7e_l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

After merging the pinctrl tree, today's linux-next build (x86_64 allmodconf=
ig)
produced this warning:

warning: (PINCTRL_MT6397) selects PINCTRL_MTK_COMMON which has unmet direct=
 dependencies (PINCTRL && (ARCH_MEDIATEK || COMPILE_TEST) && OF)

Introduced by commit fc59e66c4284 ("pinctrl: mediatek: Add Pinctrl/GPIO
driver for mt6397").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/YSBTHAtwl..GI.7lgrl7e_l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVXCxNAAoJEMDTa8Ir7ZwVqHcP+wRhqtPrUtWwgEjZXQkrMOjc
g1xkzGyhiO5jvo6k9LSUtDUbu9BL02yeeh5OeDW7AhhVqckC9plrJykcoSgYLA4s
gQu5jeW8jl5hFaoI4wIsC/MTBoKTU0Le0Ebx0+iLqfott8p+CVZVGtOA4Hi1tEU6
F4+GAyzhnRwZ2AaAXfVWw8hV0okbpI27sZy/8/GkTIIgrXCKCC1Xa+/v8Gs6NCtp
2Wli9B8M1lmnj2fF6vnDiEM2mw6ycKMOrjrgqU3nYUvwLIVmwtXVk7s4vzl6/M2n
oy7+BnFYy4IG3neUKhndtBtC5KzgXOGxW00RDWWtOXap5ZuJeSOs6g4TNe03xTzB
MsHWslLtCs3o4lpn9R3A5PABX0pf1qKmZLHNBP1jRJLhu9/yoR+hDYDNG+4e5Diu
pWlNDEj26OwZCb3kLJEWzgpfJdw2zJ9QlcTaKBCARHsZPH3GlBuK7u0CpedcT28C
chv7zO4r3GnkZdZ3TaS5C9JWRSECAEekaslHMuSmdVL7SRwAJFdeUD5G/Dp5P/Zc
c690zEItqvA2bnINqERwVEqnQMHKcGV5iTq4YxFHaqf0rwSyECvjS7Wqe+iUSyUH
klMHbS6KZWPr0nbiSgkKkLm7CXsgLdZFohOgyYmaFpp39aLOkiSaZUUcPh2hhQo/
6/hHNt4N/84Ml7P4nC4s
=zJQT
-----END PGP SIGNATURE-----

--Sig_/YSBTHAtwl..GI.7lgrl7e_l--
