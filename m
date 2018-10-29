From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the compiler-attributes tree with the
 kbuild tree
Date: Tue, 30 Oct 2018 10:46:37 +1100
Message-ID: <20181030104637.382c26d0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Txj/sLcRG0RPm7X.OikBPYu"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Changbin Du <changbin.du@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Txj/sLcRG0RPm7X.OikBPYu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Miguel,

Today's linux-next merge of the compiler-attributes tree got a conflict
in:

  include/linux/compiler-gcc.h

between commit:

  94c7dfd01652 ("kernel hacking: support building kernel with -Og optimizat=
ion level")

from the kbuild tree and commits:

  5c67a52f3da0 ("Compiler Attributes: always use the extra-underscores synt=
ax")
  989bd5000f36 ("Compiler Attributes: remove unneeded sparse (__CHECKER__) =
tests")

from the compiler-attributes tree.

I fixed it up (the latter just removed the __CHECKER__ check, so I did
that) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Txj/sLcRG0RPm7X.OikBPYu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvXm90ACgkQAVBC80lX
0Gxg+QgAkApuu6p1esEjyjkjj9LGWA0Oo087fTpH+Qw++H9X7RvQrDKprReHh8w9
Ni/lPsH1+eAh2bP+PYnIBb7yV5Q5VN3nKWZ6OxLzK+T7PJ0ygnQZCguEz7ROhwu1
IO111AFqzyewfhn3FQAcJTAvOS4iV8QMc2dr3/SoJ0Aolg9LwNe9gQW8B6FhwCn6
Qg7jSgaLdh3rhbqpc/cVfyV29oPDWhKd7JlTTxDasgaQ3MwBDbCGUSTdLofH6BDJ
/wnZazZzjWx45osg+mx/eM7YN8ohAGKsfMYcsFnuFM8mriVfdTHuhOglA5d5N36x
8D1QhmKOlQa2R9STztLu88Wrm1nqmQ==
=u3gb
-----END PGP SIGNATURE-----

--Sig_/Txj/sLcRG0RPm7X.OikBPYu--
