From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: arm64: build is broken on next-20170609 with merge-commit
 9afca2c4e379 (arm64: allwinner: sun50i-a64: add dwmac-sun8i Ethernet driver)
Date: Thu, 29 Jun 2017 09:48:25 +0200
Message-ID: <20170629074825.pgeg2ut3nb3tj36u@flea>
References: <20170609124325.p7b6fhdbwtki4w2z@yury-thinkpad>
 <20170610092944.4022d550@canb.auug.org.au>
 <20170628160711.08763ee7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qrfx4bxeq4fkaby5"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:56450 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751638AbdF2Hsh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 29 Jun 2017 03:48:37 -0400
Content-Disposition: inline
In-Reply-To: <20170628160711.08763ee7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Yury Norov <ynorov@caviumnetworks.com>, Sumit Semwal <sumit.semwal@linaro.org>, "David S. Miller" <davem@davemloft.net>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, LABBE Corentin <clabbe.montjoie@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>


--qrfx4bxeq4fkaby5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 28, 2017 at 04:07:11PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> [Yes, top posted :-)]
>=20
> With the merge window approaching, this is just a reminder that this
> merge problem still exists.  I assume that the sunxi tree will be
> merged into the arm-soc tree before going to Linus.

It's already been merged in arm-soc. I haven't had any news from Dave
on this despite my mails, so I don't really know how to solve this.

Those patches really should never have been in net-next in the first
place.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--qrfx4bxeq4fkaby5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZVLDJAAoJEBx+YmzsjxAgimUP/imEFGm+PLqFR1DXmUYcc8EC
jSOn0GWbU0C4Z1IjURkK5mu69IlaYces8vXOg8GtnrrOjVhgUgDtzp/cpZGAJlwW
WS/ouOWhN0Vh226MEQGxlAsG5dNVXdAAbTd0tG25Y3b9YD5EEtQT3ybRmbjHh8WI
j8ORKinCI5ABPcGUDRXzlKJFe3tFXLE9Z+avarKIY2+ZsWppQ6YHCFU6Uxb5Y0Xr
ccDDjTo4HsUCGeu53K44w1fFkQxXdRYQfv1QPZrRAdE8YOSrKFPuVSM+KbDaDjwl
lDBgKf7wn6WN+1EitFsnl0JYdR3Xp/YlxBvUnC3MWE18lBzFmVo3uPijCdiggh/P
6mAkBJ+/lOKx2NsVP7lV2+QE6AiDEEBzh61g0zU2jNCUk2VvrF3OBEtQjbYaqs5C
pciZtrU4GDRa2BaHztOPg9yHSqDZhyDcD9/CHdMy96eoKYPTyb0wmMmGPK2eb68q
GgrfbPJH3t2jwlZZ/kf5l0HlR1Wml/sSzALX/xk02recbd7TIPDcbNI6IRLQBpDh
Ks7Lb8Jm+wVikS4K85zeBXGGLpnZSyw/48Uy+cU3SQDPSDA6ZGs2PLqWIy75bTu9
ajoVVwXQAU612pm6gFHIm0Oqz9G+XYO9dFjiNYMQ8lf7qOFXvz7FJqzI5VlGEZM1
QT/6h/bIkw5Un4twXejg
=FLU9
-----END PGP SIGNATURE-----

--qrfx4bxeq4fkaby5--
