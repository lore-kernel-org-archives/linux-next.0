From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: usb tree build warning
Date: Wed, 25 Nov 2009 22:35:08 +1100
Message-ID: <20091125223508.c0924e2d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__25_Nov_2009_22_35_08_+1100_PQCrLoFNtk0SG.cn"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758721AbZKYLfJ@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Nazarewicz <m.nazarewicz@samsung.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__25_Nov_2009_22_35_08_+1100_PQCrLoFNtk0SG.cn
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

drivers/usb/gadget/multi.c:30:1: warning: "CONFIG_USB_ETH_RNDIS" redefined
In file included from <command-line>:0:
./include/generated/autoconf.h:185:1: warning: this is the location of the =
previous definition

Introduced by commit a8e2db2fc35a9c4599181730ef5772376232e881 ("USB: g_mult=
i: Multifunction Composite Gadget added").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__25_Nov_2009_22_35_08_+1100_PQCrLoFNtk0SG.cn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksNFmwACgkQjjKRsyhoI8wQjgCbBFVD+MynrRghLqCfMK1TFq38
HzsAn0A+tKe1AaCzCNehK0xmam1PY7hS
=Np71
-----END PGP SIGNATURE-----

--Signature=_Wed__25_Nov_2009_22_35_08_+1100_PQCrLoFNtk0SG.cn--
