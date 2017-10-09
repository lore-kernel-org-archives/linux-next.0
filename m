From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the staging tree with the media tree
Date: Mon, 9 Oct 2017 19:26:54 +0100
Message-ID: <20171009182653.5phanxtnwwtrx34e@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yhdny34lqngocs32"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Aishwarya Pant <aishpant@gmail.com>, Branislav Radocaj <branislav@radocaj.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--yhdny34lqngocs32
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_firmware.c

between commit:

   866af46e6ebbc ("media: Staging: atomisp: fix alloc_cast.cocci warnings")

=66rom the media tree and commit:

   4d962df5a7771 ("atomisp2: remove cast from memory allocation")

=66rom the staging tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--yhdny34lqngocs32
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnbv20ACgkQJNaLcl1U
h9DdIwf/TEW91PQO6fUTxft8L2v8s//4mCC/sDwkDhcJprJimaqhgOG74o0aSmsX
cyQN9noca2/o8gc8TrOPN6CSeYsYlAhHFlwVzkGY2nvHhr4aUDyaY/bEnlgYu784
NUYiZ22BwLKybxzKxGI/43UuH1S5vpspSScVBSN9E2umqWa7N4AJb+Tq7ApYvK3A
SUtWyL+PDB+q4KQOCcEupk76yoZjeTIgRNSTeHeCzxrVIlMt6iTT+zKpcXwedMjI
Wgm959+CHGnqantz8H0TChcwWm4DIDEVMZJP8eqqQR9JxTByo2YFz0FbSv+Itp9J
6f8NS6NLoWD+aDf/pJ7BOj5PmjUfCQ==
=lKhn
-----END PGP SIGNATURE-----

--yhdny34lqngocs32--
