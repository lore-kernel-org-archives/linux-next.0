From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the char-misc tree with the
 char-misc.current tree
Date: Tue, 4 Dec 2018 15:35:13 +1100
Message-ID: <20181204153513.1e799336@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/F2a2ZLdv1BQwUDiogvsvK2o"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dexuan Cui <decui@microsoft.com>, "K. Y. Srinivasan" <kys@microsoft.com>
List-Id: linux-next.vger.kernel.org

--Sig_/F2a2ZLdv1BQwUDiogvsvK2o
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  drivers/hv/channel_mgmt.c

between commit:

  37c2578c0c40 ("Drivers: hv: vmbus: Offload the handling of channels to tw=
o workqueues")

from the char-misc.current tree and commit:

  4d3c5c69191f ("Drivers: hv: vmbus: Remove the useless API vmbus_get_outgo=
ing_channel()")

from the char-misc tree.

I fixed it up (I used the former version where they conflicted) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/F2a2ZLdv1BQwUDiogvsvK2o
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwGBAEACgkQAVBC80lX
0GyNTwf+Lms5sKywsYFNlg0hXRdSPdBjsz4pfJzqbzjUdzg2DpqkwurYBKTgfYvb
LmRTBu3Oeb6dL8K3kuM+wGPvbakkug2JFhE0vf3e7uMlPqTEdPBIZ/+37n9A0ikk
P8L9sgneUo05K0VWq+/Xd22AnP0Nk+Ly6m5vZFnmlS3hpurJ+gnw+9LulGNRtM2C
kg4ItWUw1dcPt4MFJwrD1fufIZ+aQ/5blDq+nruiChzFLwy6mhUBH8aeZYV/NdGf
0Cf19ddVX64gwkVb3bv4XtpT1jCf8c1oJ92U2BWPKeHM8k1OIgEfbiXcpe2eBGDp
aJjd7Iqr9OM6hJD+p+ht/eVgMswp+w==
=KXbh
-----END PGP SIGNATURE-----

--Sig_/F2a2ZLdv1BQwUDiogvsvK2o--
