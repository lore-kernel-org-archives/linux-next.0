From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the ipmi tree
Date: Wed, 3 Apr 2019 14:33:23 +1100
Message-ID: <20190403143323.156ac503@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/BnlIDobU0SIz0QG2QJvEgqf"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Corey Minyard <cminyard@mvista.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
List-Id: linux-next.vger.kernel.org

--Sig_/BnlIDobU0SIz0QG2QJvEgqf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Corey,

After merging the ipmi tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/char/ipmi/ipmi_msghandler.c: In function 'free_user':
drivers/char/ipmi/ipmi_msghandler.c:1268:2: error: implicit declaration of =
function 'cleanup_srcu_struct_quiesced'; did you mean 'cleanup_srcu_struct'=
? [-Werror=3Dimplicit-function-declaration]
  cleanup_srcu_struct_quiesced(&user->release_barrier);
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
  cleanup_srcu_struct

Caused by commit

  487ecb21fa66 ("ipmi: fix sleep-in-atomic in free_user at cleanup SRCU use=
r->release_barrier")

interacting with commit

  f5ad3991493c ("srcu: Remove cleanup_srcu_struct_quiesced()")

from the rcu tree.

Based on the comments in the rcu tree commit, I have reverted the impi
tree commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/BnlIDobU0SIz0QG2QJvEgqf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlykKYMACgkQAVBC80lX
0GytbAgAisVFy0Bi0kM7OKJyg+fnkwkMvQbe5+NUPeDrbznizmOQPrv4u0iqieHa
Zmdt0jireZLstdD/th9E6Ln3kQLQqeR8VgO1x21/3CBTvFYr4JW5BhzhQsiFfhPu
c76Bt20P9dkqIdc+XEjbviTcCGumiB0aoLl8nBM9KjohrqGBu98DKIqfui0ZmqfL
QK9RHlFKnaC6KuAnpyM+cuU4lZdGDyKJ3V0PkWec0hHkfB51zLlMxnk1EZNTGFAV
6bWE/pH9lzmLPBPm5VE4YqwaQZrt7+CCeeFHDmeMCjARdVUnNnZ4TrsBnVt6sEQH
YaLa/3d3IwIIXeSH7Zv9Ac7dzfGdUg==
=vMn7
-----END PGP SIGNATURE-----

--Sig_/BnlIDobU0SIz0QG2QJvEgqf--
