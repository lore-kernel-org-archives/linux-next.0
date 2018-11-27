From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the selinux tree with the vfs tree
Date: Tue, 27 Nov 2018 11:52:46 +1100
Message-ID: <20181127115246.00967523@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/AwPieLJlQ0s7/md85VE7dS3"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Moore <paul@paul-moore.com>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ondrej Mosnacek <omosnace@redhat.com>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/AwPieLJlQ0s7/md85VE7dS3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Today's linux-next merge of the selinux tree got a conflict in:

  security/selinux/hooks.c

between commit:

  0472421f47a9 ("vfs: Remove unused code after filesystem context changes")

from the vfs tree and commit:

  2cbdcb882f97 ("selinux: always allow mounting submounts")

from the selinux tree.

I fixed it up (the former removed the function updated by the latter -
I am not sure if there are further changes necessary) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/AwPieLJlQ0s7/md85VE7dS3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlv8lV4ACgkQAVBC80lX
0GzmNQf+PYsp3VMenibDZWFRGsjP4FClRFLbTGQ3KZ79glrpDgl7fjWyB3HyGCmV
ezN9j1a+/Bz5oagt8/c29qxQq7s1EG36+GcRff4SsY8fisanxpvBM4FyLQR39078
iiX5W605TX6aIxR2gg8K1WKlJc6xhmCWQuLvdPGlZIQWto17GXDciJEwKuQ0rlr+
cuMVCYJ6n4hNTsibhs9DwZt4dQS0uKv+gDrag34Cca0Wp4aOE1Ad2t3mEnWPzLFN
EmQVcSTCzC373RyDsUEpUtxpe8o7GsGqdTvf2rv8tyQ6RSiyKdkRpMo//JmL4b7W
a2u9i00KGbTDZzkCtdqVVMIkO0A3bA==
=3cUg
-----END PGP SIGNATURE-----

--Sig_/AwPieLJlQ0s7/md85VE7dS3--
