From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rcu tree with the tip tree
Date: Fri, 22 Jun 2018 12:27:17 +1000
Message-ID: <20180622122717.5f475829@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/gRiojqRRqDt/R+sn+bWvhHC"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/gRiojqRRqDt/R+sn+bWvhHC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rcu tree got a conflict in:

  kernel/rcu/tree_plugin.h

between commit:

  b3dae109fa89 ("sched/swait: Rename to exclusive")

from the tip tree and commit:

  57ada0a7f942 ("rcu: Convert grace-period requests to ->gp_seq")

from the rcu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/rcu/tree_plugin.h
index ad53d133f709,2cc9bf0d363a..000000000000
--- a/kernel/rcu/tree_plugin.h
+++ b/kernel/rcu/tree_plugin.h
@@@ -2082,9 -2159,9 +2159,9 @@@ static void rcu_nocb_wait_gp(struct rcu
  	 */
  	trace_rcu_this_gp(rnp, rdp, c, TPS("StartWait"));
  	for (;;) {
 -		swait_event_interruptible(
 +		swait_event_interruptible_exclusive(
- 			rnp->nocb_gp_wq[c & 0x1],
- 			(d =3D ULONG_CMP_GE(READ_ONCE(rnp->completed), c)));
+ 			rnp->nocb_gp_wq[rcu_seq_ctr(c) & 0x1],
+ 			(d =3D rcu_seq_done(&rnp->gp_seq, c)));
  		if (likely(d))
  			break;
  		WARN_ON(signal_pending(current));

--Sig_/gRiojqRRqDt/R+sn+bWvhHC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlssXoYACgkQAVBC80lX
0GzsQAf/eE3UwZOlUHOWVtJE78DCUkEUU7ugTJm8X8ZreGWsujngUytKdVYEb9rd
bmDyF4AZNj5boDgKuBygw8dSv6GYcpHgF+m1IqbDbw2Au/OnMixe+3ZP+9JekfhQ
LNYW6p1FBfBjOcIcixThNT+mugAIFkaTgKr1akdqW7PuCkCH14Bk2F/7kdNWnGoV
JJhm5ZO4fTTCro4q2LU+F0Crer0f8eHHFVpRoJuI6c1uWK5uFQJR7EMQ9WeLMH6A
RC7+b2L/JzCdLJhXTRPrn+gpbydQBLOVYlZCTlaiRnYQsMtHBqcg2pq67zdFQyeH
FqbrdQ4OfgwzmoqpQukdlqSzMV5b4A==
=nCEk
-----END PGP SIGNATURE-----

--Sig_/gRiojqRRqDt/R+sn+bWvhHC--
