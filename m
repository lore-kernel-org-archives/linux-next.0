From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the input tree
Date: Tue, 24 Jan 2012 14:25:16 +1100
Message-ID: <20120124142516.07860a401ac9216cfa10a6ad@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__24_Jan_2012_14_25_16_+1100_yoEXx9l/m9kYXoaz"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34936 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754071Ab2AXDZ1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Jan 2012 22:25:27 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>

--Signature=_Tue__24_Jan_2012_14_25_16_+1100_yoEXx9l/m9kYXoaz
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

After merging the input tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

ERROR: ".ktime_get_monotonic_offset" [drivers/input/evdev.ko] undefined!

Caused by commit 04f2c50e5fd8 ("Input: add infrastructure for selecting
clockid for event time stamps").

I have used the input tree from next-20120123 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__24_Jan_2012_14_25_16_+1100_yoEXx9l/m9kYXoaz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJPHiScAAoJEECxmPOUX5FEPzUP/RuEeilb7HoFZO2CbH530wDW
Q50EeWqHcXTtczX4qEio1bW7aefB54exDrvpchzObxGr4IHMJAFteFhm8kl3kDqY
T66+ixG+ocenZgi/RO+bRYvz5650bVzw+g50yMBQ05dJS2PbAJ6q4Cay1OP19+5m
iLH3yo7TTwbJetmdJwFI7AwF/fS64FlkQICman6/a0XoqoNFhqO/bZZt6exdBkSI
EmcdHa8CAnWovkoRuDdQOtYE1atoX+ne85faYBiZbRw/Fyts+FyNxjPuShCLHm+F
IuldmqdZohKHPoHldEGiRUqUl/Ra25p9vT0D4DV60MLyczfayo+d7iS3ngR8t2Su
eRhgre+phx+RafRbFsH5go1MaYXsdjKBFhzrHWzHzt8vqO4CkZ1wcTah3eUr/BW8
HfJCT3uXz9BBWhVnmFWZJNeqAmVzIw7pcXFiaCmwDCYCBbUWfvnLCeYNVYl7ClFf
EVUHTRdvOvbV2wHl+E2YZgYBp3T8HvqSNTvx8o+9mT22tfk2CDN7n6hpa+G1KlRI
RHYWWvEmIyXe9lRN2SjO9krSRJYT/91qoTeQvSU4w2TDGvuIjG+qSAsWzHei0e5v
6djT8DbbIlyvRtJbIjt40ObUckMGLxqPAjXE/52I2RZE3l1L66PlsEieGa1NExFY
NGzyzqhvDvNe1BHxh+6R
=05gt
-----END PGP SIGNATURE-----

--Signature=_Tue__24_Jan_2012_14_25_16_+1100_yoEXx9l/m9kYXoaz--
