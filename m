From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the modules tree
Date: Wed, 1 May 2019 08:10:54 +1000
Message-ID: <20190501081054.387820b2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Q=rOSKQXD5Xm/TG7tZop55S"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jessica Yu <jeyu@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Prarit Bhargava <prarit@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Q=rOSKQXD5Xm/TG7tZop55S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  7e470ea99bcd ("kernel/module: Reschedule while waiting for modules to fin=
ish loading")

Fixes tag

  Fixes: linux-next commit f9a75c1d717f ("modules: Only return -EEXIST for =
modules that have finished loading")

has these problem(s):

  - the "linux-next commit" is unexpected (and not really meaningful
    once this is merged into Linus' tree)

--=20
Cheers,
Stephen Rothwell

--Sig_/Q=rOSKQXD5Xm/TG7tZop55S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzIx+4ACgkQAVBC80lX
0GwXIwgAoZ1nAGUCkVKR7DlCwgC3a0AI0gysq9HFiSmMTfjuMP/IsZrmh16vQ98j
U8klRm/O2eF8evd98zkV3cuwt84Ug2B5nJ195hgTsKOShtgprx/0kqdTHmAD8/Yj
fwg37JlUUFKTRQ0XUuUrjs0a4zwKCEIVhxWoa4YR3qOVP/vK8oM3iUI3E2SALSRZ
Y06LDZB/7PWq4ZE9su7TqRelsXD9C+8pTXVTaDywmK6MniHDCOlrp/Csb/KQ2yrJ
WNgzqv3gJlz62MwFqK1zdc9MLcG/tSPDlgFfkqSryrqO5FPEeXn8o9AzL7p2kFGA
8dMHoi2YAu+rQ+xZansvdVbh5PmgVQ==
=9xru
-----END PGP SIGNATURE-----

--Sig_/Q=rOSKQXD5Xm/TG7tZop55S--
