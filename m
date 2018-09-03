From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the staging tree
Date: Mon, 3 Sep 2018 12:06:17 +1000
Message-ID: <20180903120617.34f4f8cd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/8ziYdG5Rf3hx_8tfgX_Io8l"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, John Whitmore <johnfwhitmore@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/8ziYdG5Rf3hx_8tfgX_Io8l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the staging tree, today's linux-next build (powerpc
allyesconfig) produced this warning:

WARNING: drivers/staging/rtl8192u/r8192u_usb: 'dot11d_init' exported twice.=
 Previous export was in drivers/staging/rtl8192e/rtllib.ko

Introduced by commit

  c01f06b7506f ("staging:rtl8192u: Rename Dot11d_Init - Style")

--=20
Cheers,
Stephen Rothwell

--Sig_/8ziYdG5Rf3hx_8tfgX_Io8l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluMlxkACgkQAVBC80lX
0GwHdggAgsUPIPUGs/FsX2BKvsOElKbJGO/bHj6j+388kRt64nC4efKcknbQp5Lu
AY6TpfUp2XGg6Ce7C4dMtlBlL2H6Uxgow5ErxHONStD9SzIxLtGu/+EWvoDyfEyb
M4EpTX3f91XSbQoix/EGy1l41d64enPBYbUP1HM0pXowBCXNRF8910XnLbelH8yV
EPOP8J7zvIFgM7pCNapqhqgRF1b8OSxBT7Nejnty55+slycbI8Z2K+nevuB1iNRk
3AmBf0v8nLwgqBeEvL5ZyQytJNcN2bz1ONrHCjHF9LcvHhYL3AN1OLa01/KdYW8a
bzwRSlzt6HMlT4uynBWBeJ0esk0izg==
=wTN3
-----END PGP SIGNATURE-----

--Sig_/8ziYdG5Rf3hx_8tfgX_Io8l--
