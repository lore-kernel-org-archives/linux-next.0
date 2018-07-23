From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the tty tree
Date: Mon, 23 Jul 2018 15:39:14 +1000
Message-ID: <20180723153914.563af11c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/JThGx3CUaLtSkoddMj+oiW4"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/JThGx3CUaLtSkoddMj+oiW4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the tty tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/tty/serial/8250/8250_exar.c: In function 'pci_xr17v35x_setup':
drivers/tty/serial/8250/8250_exar.c:380:31: warning: unused variable 'board=
' [-Wunused-variable]
  const struct exar8250_board *board =3D priv->board;
                               ^~~~~

Introduced by commit

  328c11f24b57 ("serial: 8250_exar: Remove useless has_slave member")

--=20
Cheers,
Stephen Rothwell

--Sig_/JThGx3CUaLtSkoddMj+oiW4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltVagIACgkQAVBC80lX
0Gw7egf/Wu5CCVzZk+VPQvsuw/2M8rL1UtId6v08Gb8Pmt5M4FMrzwPdzO92udyK
Cf8+JHJGmLQkzE6V4fKxpRdb/cKxhSeff/JtM3edrfctwKIUDKUkoLaMJIWzSSp4
jEv0Xq4pV1BJeWdXcyk6kgUPtPAYcsYY19rsMHA4jlzRLhpCC8F/X9jduyN2nVHW
eYX+EK5VWGd0hjRh7xLkaku3zxXZ0VFSCptXTDLa24xF8187XWxZ0qVrqPG2wsTV
QGXTO0oUpV9dSA5GZM1EZs8MAq0O4UtdOvJoqkQPbFSnr/f6vcP7j53cPAAaDBb6
f5y5DmBnxD/5FSG27mLEs6hWr0gr9w==
=Za2y
-----END PGP SIGNATURE-----

--Sig_/JThGx3CUaLtSkoddMj+oiW4--
