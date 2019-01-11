From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the security
 tree
Date: Fri, 11 Jan 2019 13:55:24 +1100
Message-ID: <20190111135524.5e3cceda@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/DO8h4dLRcQhDbH0nPFNPl+N"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, James Morris <jmorris@namei.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Casey Schaufler <casey@schaufler-ca.com>, Kees Cook <keescook@chromium.org>, Kent Overstreet <kent.overstreet@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/DO8h4dLRcQhDbH0nPFNPl+N
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  security/selinux/ss/services.c

between commit:

  3d252529480c ("SELinux: Remove unused selinux_is_enabled")

from the security tree and commit:

  dd4c293d6d4d ("selinux: convert to kvmalloc")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc security/selinux/ss/services.c
index d6e7b4856d93,fac47b306b6b..000000000000
--- a/security/selinux/ss/services.c
+++ b/security/selinux/ss/services.c
@@@ -49,7 -49,7 +49,6 @@@
  #include <linux/sched.h>
  #include <linux/audit.h>
  #include <linux/mutex.h>
- #include <linux/flex_array.h>
 -#include <linux/selinux.h>
  #include <linux/vmalloc.h>
  #include <net/netlabel.h>
 =20

--Sig_/DO8h4dLRcQhDbH0nPFNPl+N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw4BZwACgkQAVBC80lX
0GxBJQf+LKof6Bjuuqe7LdWNnrMSkUtYVxLMnM0UvQzaQws7+9Y7+/4JP15++9YK
wEJ2otXV1/nO64rzXPMggLbqKw7rmV/37ScBec0QV4H2bWDDdbQygyx2KVgxbo92
ES7p4DxOmwRa1SgStbUq4rz9OozH3+YhnEh1XD8gmL09NKYlWvnrNNC11qAvZFhN
zvG/wxUMZz3ZO/NQOfjFKnBj4HgKN0cCtjV2SD8lZyB+RcJBcWAB2ZDRnztqwtkM
tZlP/Ja17EY4mFGRUAlwuQi9YKE10pHXQSfaxmRynz528gCz/xaACSWTA3Orcx/9
oWK70WlCkH7itIRpH/OEvGdQdjGtGw==
=nTsu
-----END PGP SIGNATURE-----

--Sig_/DO8h4dLRcQhDbH0nPFNPl+N--
