From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the pidfd
 tree
Date: Wed, 22 May 2019 11:43:14 +1000
Message-ID: <20190522114314.515b410d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//JxyEEp0Z.6I8p35=DwmN0Z"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Christian Brauner <christian@brauner.io>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Joel Fernandes (Google)" <joel@joelfernandes.org>
List-Id: linux-next.vger.kernel.org

--Sig_//JxyEEp0Z.6I8p35=DwmN0Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  kernel/pid.c

between commit:

  99e9da7f2796 ("pid: add pidfd_open()")

from the pidfd tree and commit:

  51c59c914840 ("kernel/pid.c: convert struct pid:count to refcount_t")

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

diff --cc kernel/pid.c
index 39181ccca846,b59681973dd6..000000000000
--- a/kernel/pid.c
+++ b/kernel/pid.c
@@@ -37,8 -36,7 +37,8 @@@
  #include <linux/init_task.h>
  #include <linux/syscalls.h>
  #include <linux/proc_ns.h>
- #include <linux/proc_fs.h>
+ #include <linux/refcount.h>
 +#include <linux/sched/signal.h>
  #include <linux/sched/task.h>
  #include <linux/idr.h>
 =20

--Sig_//JxyEEp0Z.6I8p35=DwmN0Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzkqTIACgkQAVBC80lX
0GwcpAf8CwUenbm91eZ9ojHHXKB7XVoDgK8/TZpdnunIufJ/z8HiIogMBKznAmvp
vqq/cgMC1AckNHQd8I552BV0pXIp2GeW05agg5+yPbaM0asQt4+J+xaclpTpQ6n6
WTwZMVbgLLB9Z/enOekSqhRxcxdVljql9K5UDXmA6FmKdTaBgP8B3N+yQomTltL0
jU2R699n1YzczNhBrvfKQinp7lUz/oQsH9nJ+hb6uE5m1D1P8RoT60z9XA5DUUBU
ffcvid2in48ZtVVg3cFY5rd4G28a/dmJDfe9U6oqrX9c1Ue9RfDZK619DlO4+xEf
e4WtD6zhML3q+bOVxBeO9nQrp/6d2w==
=Rsmk
-----END PGP SIGNATURE-----

--Sig_//JxyEEp0Z.6I8p35=DwmN0Z--
