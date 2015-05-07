From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rcu tree with the tip tree
Date: Thu, 7 May 2015 13:56:50 +1000
Message-ID: <20150507135650.5bf07876@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Vh4yNNR9VyUfexOl5AhbPje"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Sig_/Vh4yNNR9VyUfexOl5AhbPje
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Today's linux-next merge of the rcu tree got conflicts in
include/linux/rcupdate.h, include/linux/rcutree.h and
kernel/rcu/tree_plugin.h between commit c1ad348b452a ("tick: Nohz:
Rework next timer evaluation") from the tip tree and commit
f49f794683d6 ("rcu: Eliminate a few CONFIG_RCU_NOCB_CPU_ALL #ifdefs")
from the rcu tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/linux/rcupdate.h
index 0627a447c589,03a899aabd17..000000000000
--- a/include/linux/rcupdate.h
+++ b/include/linux/rcupdate.h
@@@ -1155,13 -1099,13 +1101,13 @@@ static inline notrace void rcu_read_unl
  #define kfree_rcu(ptr, rcu_head)					\
  	__kfree_rcu(&((ptr)->rcu_head), offsetof(typeof(*(ptr)), rcu_head))
 =20
- #if defined(CONFIG_TINY_RCU) || defined(CONFIG_RCU_NOCB_CPU_ALL)
+ #ifdef CONFIG_TINY_RCU
 -static inline int rcu_needs_cpu(unsigned long *delta_jiffies)
 +static inline int rcu_needs_cpu(u64 basemono, u64 *nextevt)
  {
 -	*delta_jiffies =3D ULONG_MAX;
 +	*nextevt =3D KTIME_MAX;
  	return 0;
  }
- #endif /* #if defined(CONFIG_TINY_RCU) || defined(CONFIG_RCU_NOCB_CPU_ALL=
) */
+ #endif /* #ifdef CONFIG_TINY_RCU */
 =20
  #if defined(CONFIG_RCU_NOCB_CPU_ALL)
  static inline bool rcu_is_nocb_cpu(int cpu) { return true; }
diff --cc include/linux/rcutree.h
index db2e31beaae7,3fa4a43ab415..000000000000
--- a/include/linux/rcutree.h
+++ b/include/linux/rcutree.h
@@@ -31,9 -31,7 +31,7 @@@
  #define __LINUX_RCUTREE_H
 =20
  void rcu_note_context_switch(void);
- #ifndef CONFIG_RCU_NOCB_CPU_ALL
 -int rcu_needs_cpu(unsigned long *delta_jiffies);
 +int rcu_needs_cpu(u64 basem, u64 *nextevt);
- #endif /* #ifndef CONFIG_RCU_NOCB_CPU_ALL */
  void rcu_cpu_stall_reset(void);
 =20
  /*
diff --cc kernel/rcu/tree_plugin.h
index 0ef80a0bbabb,a2f64e4fdb57..000000000000
--- a/kernel/rcu/tree_plugin.h
+++ b/kernel/rcu/tree_plugin.h
@@@ -1367,13 -1375,12 +1375,12 @@@ static void rcu_prepare_kthreads(int cp
   * Because we not have RCU_FAST_NO_HZ, just check whether this CPU needs
   * any flavor of RCU.
   */
- #ifndef CONFIG_RCU_NOCB_CPU_ALL
 -int rcu_needs_cpu(unsigned long *delta_jiffies)
 +int rcu_needs_cpu(u64 basemono, u64 *nextevt)
  {
 -	*delta_jiffies =3D ULONG_MAX;
 +	*nextevt =3D KTIME_MAX;
- 	return rcu_cpu_has_callbacks(NULL);
+ 	return IS_ENABLED(CONFIG_RCU_NOCB_CPU_ALL)
+ 	       ? 0 : rcu_cpu_has_callbacks(NULL);
  }
- #endif /* #ifndef CONFIG_RCU_NOCB_CPU_ALL */
 =20
  /*
   * Because we do not have RCU_FAST_NO_HZ, don't bother cleaning up
@@@ -1480,12 -1487,15 +1487,16 @@@ static bool __maybe_unused rcu_try_adva
   *
   * The caller must have disabled interrupts.
   */
- #ifndef CONFIG_RCU_NOCB_CPU_ALL
 -int rcu_needs_cpu(unsigned long *dj)
 +int rcu_needs_cpu(u64 basemono, u64 *nextevt)
  {
  	struct rcu_dynticks *rdtp =3D this_cpu_ptr(&rcu_dynticks);
 +	unsigned long dj;
 =20
+ 	if (IS_ENABLED(CONFIG_RCU_NOCB_CPU_ALL)) {
 -		*dj =3D ULONG_MAX;
++		*nextevt =3D KTIME_MAX;
+ 		return 0;
+ 	}
+=20
  	/* Snapshot to detect later posting of non-lazy callback. */
  	rdtp->nonlazy_posted_snap =3D rdtp->nonlazy_posted;
 =20
@@@ -1505,15 -1515,13 +1516,14 @@@
 =20
  	/* Request timer delay depending on laziness, and round. */
  	if (!rdtp->all_lazy) {
 -		*dj =3D round_up(rcu_idle_gp_delay + jiffies,
 +		dj =3D round_up(rcu_idle_gp_delay + jiffies,
  			       rcu_idle_gp_delay) - jiffies;
  	} else {
 -		*dj =3D round_jiffies(rcu_idle_lazy_gp_delay + jiffies) - jiffies;
 +		dj =3D round_jiffies(rcu_idle_lazy_gp_delay + jiffies) - jiffies;
  	}
 +	*nextevt =3D basemono + dj * TICK_NSEC;
  	return 0;
  }
- #endif /* #ifndef CONFIG_RCU_NOCB_CPU_ALL */
 =20
  /*
   * Prepare a CPU for idle from an RCU perspective.  The first major task

--Sig_/Vh4yNNR9VyUfexOl5AhbPje
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVSuKIAAoJEMDTa8Ir7ZwVv9IP/jMHfz8cX1/iDvmKINvYDVzt
E+GKeYx4MNl2uT02172HHem8o0J3mQYSa7i2b9/mhhjS0mU4HjOXD8cDTzUGnXRf
qvmw3m4b0tKYLCnWT6kDpVJcbV7i0WLBu41pXXHy4A58gkDQ7qMDchpRxssvpvBo
An37q9eEJ6dMxmMc95a8tOpRnLXw79vpld/KZoM6EBDXlqfAUGf08IfGRL4sa7Xg
JyrpIdjVQ6TutaVWAOTVzBnvot+LbQODTw7UqFSMxdzvXRHNzHnoEmciv2wDFANW
AeiS8MvtdFBmnTn8f3dGrZRVcGY2hWiEK/OD7KRCtqjHG+c0bBNZHU+RrievZoHp
hUw6pFdTigK3YRTXQvq/s/t809qWoqsa/lLovjCv44rclMWR6mAEwWmFXbn5Ldir
fNsZrQey1inCsdVbFAoOJTY1IsLZICbtqWgB+UMQJuCA9YSGTGLRN2NPzgW0BkZ9
7lug4jsVfS1ZSyJzEr3oRWv0rchg5Nho1Ohp4MrCVpwKuM9rjQEMutK/XcK2QIJx
zYT/KFU2/JsIBLexlBmJMLiq1jXaQ119NXg0Zs5d9Xs6VWBqROchudCSOC5K4oON
852G/aa1SzFtie2tnfVf99CthOahTBrPrbxZOlMjMLleXg5BVDp3V+DSZsfIaT60
O56yCOo8iGon5NknBP7g
=lvle
-----END PGP SIGNATURE-----

--Sig_/Vh4yNNR9VyUfexOl5AhbPje--
