From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the drm tree
Date: Tue, 20 Nov 2018 13:16:16 +1100
Message-ID: <20181120131616.139a4c8f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/cUx2DcwcpopJLZu4G_xYM5N"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Hans de Goede <hdegoede@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/cUx2DcwcpopJLZu4G_xYM5N
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/vboxvideo/vbox_ttm.c

between commits:

  a64f784bb14a ("drm/ttm: initialize globals during device init (v2)")

from the drm tree and commit:

  cd76c287a52f ("staging: vboxvideo: Cleanup the comments")

from the staging tree.

I fixed it up (the former removed the comments updated by the latter) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/cUx2DcwcpopJLZu4G_xYM5N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvzbnEACgkQAVBC80lX
0GyQNwf8DSZqSLWBzYeMudeN+V8gF6KOEZwIEidERw7FD7NsN7qpG7VDaSxfhqkq
rn8totQREaQP20i3Zh620QA18E02yW1dfB8GJuWq7a77Ak5TtqXpwB0vaAulaGE1
xV7FjznddD+NNOsdtd1tLEzR1NUp6hvFaoJvBZZ9PqswfWQNf8jmA/f9tBEZafl/
JzMuIA7Kb1baFqwHV/Vi7nihvX1NhC4B52VLoUom2oNW9Y9ciNiLMBCEzBRkuGBM
rMacShb0sBGM4NHMy29a44p1U3UfMm66G4ADH34T8UQGP7qO5GKWyZPlzWsrbA4y
wNj8MKYJYhWIT/KB6PCwx3ziPs7o9g==
=SeVy
-----END PGP SIGNATURE-----

--Sig_/cUx2DcwcpopJLZu4G_xYM5N--
