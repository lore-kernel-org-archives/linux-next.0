From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm-soc tree with the gpio tree
Date: Mon, 21 May 2012 17:09:52 +1000
Message-ID: <20120521170952.7cd6e01690000b93db80b2b9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6074641936814972708=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Grant Likely <grant.likely@secretlab.ca>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
List-Id: linux-next.vger.kernel.org

--===============6074641936814972708==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__21_May_2012_17_09_52_+1000_AXExm./6PE0R0h50"

--Signature=_Mon__21_May_2012_17_09_52_+1000_AXExm./6PE0R0h50
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm-soc tree got a conflict in
drivers/gpio/gpio-mxs.c between commit 3e11f7b840b4 ("gpio/generic:
initialize basic_mmio_gpio shadow variables properly") from the gpio tree
and commit 164387d2b4ae ("gpio/mxs: get rid of the use of cpu_is_xxx")
from the arm-soc tree.

I fixed it up (see below) and can carry the fix as necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpio/gpio-mxs.c
index b413650,429228b..0000000
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@@ -242,11 -283,11 +283,11 @@@ static int __devinit mxs_gpio_probe(str
  	irq_set_handler_data(port->irq, port);
 =20
  	err =3D bgpio_init(&port->bgc, &pdev->dev, 4,
- 			 port->base + PINCTRL_DIN(port->id),
- 			 port->base + PINCTRL_DOUT(port->id), NULL,
- 			 port->base + PINCTRL_DOE(port->id), NULL, 0);
+ 			 port->base + PINCTRL_DIN(port),
+ 			 port->base + PINCTRL_DOUT(port), NULL,
 -			 port->base + PINCTRL_DOE(port), NULL, false);
++			 port->base + PINCTRL_DOE(port), NULL, 0);
  	if (err)
- 		goto out_iounmap;
+ 		return err;
 =20
  	port->bgc.gc.to_irq =3D mxs_gpio_to_irq;
  	port->bgc.gc.base =3D port->id * 32;

--Signature=_Mon__21_May_2012_17_09_52_+1000_AXExm./6PE0R0h50
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPuepAAAoJEECxmPOUX5FEuZQQAKjPN6UjAtv4DiC9zV9lLQn4
wyXrDYkQ7Y1vkJhqH2Q180dFjVVcudFnP2tK6meD0mTnFwMcFnYGERi9ksLIkJHR
2Xh9zkqWraQ6njcyHMFjKQkVuNTrEQmQ2wnrl3DeSVkjQLhz38lf213QQfuubbQo
LGKDvnM4GOaWiEGGk85ZD+1Qd8cKFqZ6esNUdMWCjNF6sg/+jwdrtBObomNUW/nY
n83NpNgR7VNRA/KJu2yOKfEtTUPYRxkylH12cIDyyV3tK9DgctywA1TuEZsO0nAY
++Xuv0y1FiqTOA66Nw+v2uTw4Ac15UOKBLBmhFqxm5U7armHz5qnNcQ5QFtgQLT3
UsehFvZrImiWjz6QdmOAe+piaKkZ79ajn/HOtGFMjuwciyqb+dRcJsIFqFnrlFCl
GF0m/1iUf9b87HaFWiAP1BXkvAkxEols2Lfn3prrFeKF8jixwUl1YP+wflnNxpX5
N85WPORaCI1eciPZ6narG/YFQcr9qjDchCHxQEPvaIH+LVj//5ZpQeVS/d6PU3Uk
TbWlUE99E8HCAX4yknSfK/aouK4cIM1ZsquBuQIm/E0NaU6ivcUJRATf8SEpLLGc
cWwKDJxyaowZQB6gpM8ZMMEAlZoNmjNAXP/TSOCBT7XnBomt+0pgF+VPOUmvJwvJ
R37p0JGnGLc6e0ArCs5n
=2ZwO
-----END PGP SIGNATURE-----

--Signature=_Mon__21_May_2012_17_09_52_+1000_AXExm./6PE0R0h50--


--===============6074641936814972708==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6074641936814972708==--
