From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the modules tree with the vfs tree
Date: Fri, 3 May 2019 13:41:23 +1000
Message-ID: <20190503134123.1a8e0e32@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Uv+4TJ6VcVkqL+B4tO5Z4/a"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jessica Yu <jeyu@kernel.org>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, Tri Vo <trong@android.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Uv+4TJ6VcVkqL+B4tO5Z4/a
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the modules tree got a conflict in:

  include/linux/module.h

between commit:

  007ec26cdc9f ("vfs: Implement logging through fs_context")

from the vfs tree and commit:

  dadec066d8fa ("module: add stubs for within_module functions")

from the modules tree.

I fixed it up (both these commits added the stub for
within_module_core, so I just used the latter) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Uv+4TJ6VcVkqL+B4tO5Z4/a
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzLuGMACgkQAVBC80lX
0GxhrwgAhf8teN/1PGmnZgZ+65oXrlqBdWdVAnjlfaDaRgpJOcZPqp7eQqaQwjBc
lSMiGUYaKZsfFm7VxWPZSrGRyUMCuov8u7YBJBEO1I08vb1MwJlRB2sncPE5ONBt
X1PF9lOq2cMxdqQ/W6kBeIWKEEUTrMcbt4C5FjYEekoR9xKmWeprbbhcot3Kwle3
4TOlYhBCQZaQ0C0xSpFkyd9Q6Cge7QOuzZatKdoqW1rBmBDBtJzrlWkUeeDz4Jjr
tafp4uxxMXgm7VKr7vX02M1l68IVSKz378o1WO0I8RZ3c2p2/Zt5acq2s29vDFfy
/wpyKYipnQNM22V4TMQJIJEhJ6+RNA==
=6kSX
-----END PGP SIGNATURE-----

--Sig_/Uv+4TJ6VcVkqL+B4tO5Z4/a--
