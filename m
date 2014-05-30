From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the pinctrl tree
Date: Fri, 30 May 2014 16:08:59 +1000
Message-ID: <20140530160859.54642243@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/7LC5eY8ElYYZ+ADJHoroyDA"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42549 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932093AbaE3GJH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 30 May 2014 02:09:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/7LC5eY8ElYYZ+ADJHoroyDA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

After merging the pinctrl tree, today's linux-next build (arm multi_v7_defc=
onfig)
failed like this:

drivers/pinctrl/sirf/pinctrl-sirf.c: In function 'sirfsoc_gpio_handle_irq':
drivers/pinctrl/sirf/pinctrl-sirf.c:578:11: error: 'sgpio_chip' undeclared =
(first use in this function)


Caused by commit 294d1351ff47 ("pinctrl: sirf: switch to using
allocated state container").

I have used the pinctrl tree from next-20140529 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/7LC5eY8ElYYZ+ADJHoroyDA
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJTiCCAAAoJEMDTa8Ir7ZwVhroP/3JgKEjdcaTekiewTaRbH/BL
PKfCb+MiU+K1ACMotkRZzhRoxw47Ku326gZy4lExptv1+UA9LmQt9A0c5Q35kBGo
Sx8arLm4YfhFyHJuDqJg0vYBQEFswXXHlQYVoM+u5kL3HqAajOjkyf2kUnKyE/fQ
Y0YZCtlNbQip13f5qunzHCoNhIE7dtYNyXbten5YZVQPzUVtFwRfCH3tvbAv2bmS
RtLJ+k15QtyEd+TPuySBPuitjQ0yvR+bL7JTUH2/kM51Ngj0sJfShUXGt162CRDC
f+ccyS48XH5jniaZ8Tl6IMtkleCA31jiYsTuFXapqQOQqzEpwtULx7688LT2y9Mx
sskaxHjxyMX4jkgTBPIb8JFB8egit7kzfj7sz7xe7dolBu0BPqX8s1NgowIarnvS
D1BvnflNuH3uIj/80x60LK5yYCDtpuw4PdSs2CibYWXsV73Qik0AKNWg1uja8RjP
JFRSpWO1bmf1wwbdtykTLoJesl0kfkkRFgMHIdW8q3Va0QnbCLiGqwhRCiJ/fNer
g5B8xMqDfQW6rpSI29G2b0X7lsGDZKbqJ6ECSTaDhnE+NsDEQW0FHXD9hAa/EDOP
FMjrbfeBZcriJq7e5hXptjuqRZC5XW1yZDLWskkOdtyrRqY57Ed6hh4apw56Pzrl
+9aEbEkq65+08uprtlbj
=JPCl
-----END PGP SIGNATURE-----

--Sig_/7LC5eY8ElYYZ+ADJHoroyDA--
