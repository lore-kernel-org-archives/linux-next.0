From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the spi tree
Date: Fri, 30 Jan 2015 14:02:28 +1100
Message-ID: <20150130140228.399ed64f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/j4hzaD3TuFyh_NDRf.1ly=X"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46081 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751554AbbA3DCg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 29 Jan 2015 22:02:36 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

--Sig_/j4hzaD3TuFyh_NDRf.1ly=X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

After merging the spi tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/spi/spi-xilinx.c: In function 'xilinx_spi_probe':
drivers/spi/spi-xilinx.c:391:16: warning: assignment from incompatible poin=
ter type
  xspi->read_fn =3D ioread32;
                ^
drivers/spi/spi-xilinx.c:392:17: warning: assignment from incompatible poin=
ter type
  xspi->write_fn =3D iowrite32;
                 ^
drivers/spi/spi-xilinx.c:398:19: error: 'ioread32be' undeclared (first use =
in this function)
   xspi->read_fn =3D ioread32be;
                   ^
drivers/spi/spi-xilinx.c:398:19: note: each undeclared identifier is report=
ed only once for each function it appears in
drivers/spi/spi-xilinx.c:399:20: error: 'iowrite32be' undeclared (first use=
 in this function)
   xspi->write_fn =3D iowrite32be;
                    ^

Caused by commit 99082eab6344 ("spi/xilinx: Remove iowrite/ioread
wrappers").  Its not obvious why this is so, but reverting that commit
fixed the build problem.

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/j4hzaD3TuFyh_NDRf.1ly=X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUyvRJAAoJEMDTa8Ir7ZwV508P/2emcaxFJ2ZOj/9rGrc0C4kc
3Gjb1cFRmpjJkqwyKSIFPD8ZsxnhImWELv6AFSNoDIcFZc0R50OEhvmZsHgUWokj
CSNme+O0RHgKwn1akwItEBv3nt4v4JVWzRvBbIvKKHcAzmMK4rM4k9nJ+1WFwIpU
fz5QIBs2ykln/IaeKpFg1aq/oAF+dWRtGpWCjvZCmt5qA+j9jNo4qdbnzT1g8++3
iO+ODe6uXFW01nZfhigcZ4tTc2MOSOGbFf6U9QTjXtkeDg6Nc8oEfRsZ4xlz48Gy
eSBvywurApmds0vSrGQtDOMh+f/uY46WDcvBFMrvNlEbYNz7yqVQgLu1IcX3BjXl
1k1CK3inzdapjFZkZohzUB3x6wTQmhBtskxgjChL9lmCdD1+nc8ljsPyPCaRMurO
ht+yKuaWq4Dxs1i9LKwYsMUtn3Hr06t+1sf1YdgGdaOhP+2zsAHbPal8zwXNtqEu
jDxPtgvmiqPEe3aUQnF5UI+C+MU0iFhr+sjFd5ysXw9ho3DlhbOv2LBQW1f7kEBW
Z0GQESGOpMi7fRunwPTtxs/HfJL0/6VXzQZYvE8wVxIzJQpWgVMej9L6bwxSdaq8
CHJ2Pe9051OyaLxt5pm+PpRNpWF7C3Gw/iIPWQBIXfPzIfq8sTnQ4H9fr6e5hXM1
TVyn4I6zWD2bqTz7UBqJ
=IsUb
-----END PGP SIGNATURE-----

--Sig_/j4hzaD3TuFyh_NDRf.1ly=X--
