From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the jc_docs tree with Linus' tree
Date: Thu, 19 Oct 2017 12:32:50 +0100
Message-ID: <20171019113250.uwpyhsxknnva545j@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="72whdvbffq3bucun"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--72whdvbffq3bucun
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

Today's linux-next merge of the jc_docs tree got a conflict in:

  Documentation/process/index.rst

between commit:

  9ed95129ffcab ("Documentation: Add a file explaining the Linux kernel lic=
ense enforcement policy")

=66rom Linus' tree and commit:

  13277782dd4bc ("Documentation: add Kernel Driver Statement to the kernel")

=66rom the jc_docs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc Documentation/process/index.rst
index 61e43cc3ed17,68454319f006..000000000000
--- a/Documentation/process/index.rst
+++ b/Documentation/process/index.rst
@@@ -25,7 -25,7 +25,8 @@@ Below are the essential guides that eve
     submitting-patches
     coding-style
     email-clients
 +   kernel-enforcement-statement
+    kernel-driver-statement
 =20
  Other guides to the community that are of interest to most developers are=
:=20
 =20

--72whdvbffq3bucun
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnojWIACgkQJNaLcl1U
h9BYtgf+I+1z8q2e62dj+El2gDPbJEx9/fL2ux0RPmMtgc0SW7TiUYLyLLXv3Ax3
vMzsopTlAmmzAYHLgZtIqK/IGSE5khqa7JJj5D6NJK43Xl5GkkjOuVMmCZc+9/EJ
8Fwcnoal+zE252qiLGMTQdDVMSiSPcqz1EP4ziGi3AN8+u1Oc1QjHdQhOwZbf1Qf
SCMrzgIQmg+/z48wxMp0kRK/Ik3XC02YfL2K7TfNExV/SF7EL0loGRv+M1woaeQV
aPBAhxjHhL43UGi1x+m/szrxqnk2jVS3I/KkczvircgSLgI89ghjYpakbi1IOwsp
7+kPpr6IXwQFkfdSSG0bASyQkR2+WA==
=nwjF
-----END PGP SIGNATURE-----

--72whdvbffq3bucun--
