From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the vfs tree
Date: Tue, 13 Mar 2018 15:22:40 +1100
Message-ID: <20180313152240.3a64e0c9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/KdvKorGuRcP1CaxidPbpYGc"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, NeilBrown <neilb@suse.com>
List-Id: linux-next.vger.kernel.org

--Sig_/KdvKorGuRcP1CaxidPbpYGc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the staging tree got conflicts in:

  drivers/staging/lustre/lnet/libcfs/linux/linux-curproc.c
  drivers/staging/lustre/lnet/libcfs/linux/linux-prim.c

between commit:

  304ec482f562 ("get rid of pointless includes of fs_struct.h")

from the vfs tree and commits:

  37d3b407dc14 ("staging: lustre: remove linux-curproc.c")
  6b7936ceefa7 ("staging: lustre: make signal-blocking functions inline")

from the staging tree.

I fixed it up (I just removed the files) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/KdvKorGuRcP1CaxidPbpYGc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqnUhEACgkQAVBC80lX
0Gx8Xwf+LX35efVZ2lyRoHIQJ50G6oQo64JOXhp44sFq3qYPxeZ66kO73KTB6pXG
PhP5bqsAjceuAwFYT09pPzB7Bbar02fIMXmJOZPIgrY2nPGp2Dg1ydlBwbUxIPAp
hCKpp+onwPVjcIv6C9K9+byQ4SYdFv+6GbJhg5an0IMeBlvI2qxPtQVQKxNYIT4C
Gekv43sM8tDzJ2sx3+h9ZsFC+nbwNIynU0PzwadlFMQHcVySE27LP7sL2BDIlfxC
M6005QBj487QseDI8Qvz8u7qiw9omKLfXcyNtTComi5OITBn01m6IH/jBCjp3xzb
3qII7H9SWjmbBZjMbgq6QdthX8elBQ==
=P9uI
-----END PGP SIGNATURE-----

--Sig_/KdvKorGuRcP1CaxidPbpYGc--
