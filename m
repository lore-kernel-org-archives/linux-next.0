From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the staging tree
Date: Mon, 14 May 2018 14:37:23 +1000
Message-ID: <20180514143723.2227c8a5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/D6XtAKlfQ2gPC2mW1H6jmmC"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>
List-Id: linux-next.vger.kernel.org

--Sig_/D6XtAKlfQ2gPC2mW1H6jmmC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the staging tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

WARNING: drivers/staging/vc04_services/bcm2835-camera/bcm2835-v4l2.o(.data+=
0x0): Section mismatch in reference from the variable bcm2835_camera_driver=
 to the function .init.text:bcm2835_mmal_probe()
The variable bcm2835_camera_driver references
the function __init bcm2835_mmal_probe()
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: drivers/staging/vc04_services/bcm2835-camera/bcm2835-v4l2.o(.data+=
0x0): Section mismatch in reference from the variable bcm2835_camera_driver=
 to the function .init.text:bcm2835_mmal_probe()
The variable bcm2835_camera_driver references
the function __init bcm2835_mmal_probe()
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

Introduced by commit

  4bebb0312ea9 ("staging/bcm2835-camera: Set ourselves up as a platform dri=
ver.")

--=20
Cheers,
Stephen Rothwell

--Sig_/D6XtAKlfQ2gPC2mW1H6jmmC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlr5EoMACgkQAVBC80lX
0GzU1wf/QYYW7t0+CcLI/wcrqPR0Wqfx30JpHdVDIHuk6SAVhox+nkdmfud1lNUu
1cgujGkmpVJrrfjFr1uVmHjbPEQR+l3DrU2stdQZD9fTmi7CWpcozUdSmTP1ee4O
cxifICSTJ+E+ahlt9yitIYHHzc0Q4PmeiUMtKRntpFEMFw9SHXVu9mI/tQ/sPr6X
IJE2InvIxz19ItnGroESK+pTUjnRueGAcKXEWhC2k1xPDrrVmWvG68eaoKTugR43
BF6AxZ8zAqntFf5R2zXS3k7bgZmLetj7h7/tJde1MZNGed9XBOnexKlL1OeIug/Z
wvAR6v4EnV5d1FTdqCAFzChg3slqxw==
=zRyD
-----END PGP SIGNATURE-----

--Sig_/D6XtAKlfQ2gPC2mW1H6jmmC--
