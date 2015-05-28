From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rcu tree with the modules and tip
 trees
Date: Thu, 28 May 2015 17:25:07 +1000
Message-ID: <20150528172507.31f6fc8c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/dFVkZRhwLEaRBugiDW7PYG7"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37917 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751525AbbE1HZP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 28 May 2015 03:25:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/dFVkZRhwLEaRBugiDW7PYG7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Today's linux-next merge of the rcu tree got a conflict in
include/linux/rcupdate.h between commits 0a04b0166929 ("rcu: Move
lockless_dereference() out of rcupdate.h") from the modules tree and
c1ad348b452a ("tick: Nohz: Rework next timer evaluation") from the tip
tree and commits 7d0ae8086b82 ("rcu: Convert ACCESS_ONCE() to
READ_ONCE() and WRITE_ONCE()") and 3382adbc1bb8 ("rcu: Eliminate a few
CONFIG_RCU_NOCB_CPU_ALL #ifdefs") from the rcu tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

I also had to add this merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 28 May 2015 17:20:58 +1000
Subject: [PATCH] rcu: merge fix for Convert ACCESS_ONCE() to READ_ONCE() and
 WRITE_ONCE()

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/compiler.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index ba91e5c88a32..f7e7235f3a91 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -483,7 +483,7 @@ static __always_inline void __write_once_size(volatile =
void *p, void *res, int s
  */
 #define lockless_dereference(p) \
 ({ \
-	typeof(p) _________p1 =3D ACCESS_ONCE(p); \
+	typeof(p) _________p1 =3D READ_ONCE(p); \
 	smp_read_barrier_depends(); /* Dependency order vs. p above. */ \
 	(_________p1); \
 })
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/linux/rcupdate.h
index ed5f66464ab3,3a4d1bf430b1..000000000000
--- a/include/linux/rcupdate.h
+++ b/include/linux/rcupdate.h
@@@ -1140,13 -1063,13 +1050,13 @@@ static inline notrace void rcu_read_unl
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

--Sig_/dFVkZRhwLEaRBugiDW7PYG7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVZsLYAAoJEMDTa8Ir7ZwVPWIP/2pJlx87q7SzwuQnQzHLfSWp
wb3X9JbFths0wIMJgK0WLDLQHRe3ByMYoXhll/QcqTg8zx7NezOVB6JFleJDSH6I
DR1Dfg4oOGfriWHuEz9YP4ql0CC0V1EiGo5HcblISTk7KiSHktUkQRj6ztTD3pI+
a3jj4o+XyB4UIqKRnRgSEtjPwoY2beYOUafbkql2VE7V3T3iemlW0xOhATsHjecZ
Rca2Qct9CyJuRjEGPoBYUJtT+eGMbJ79zQWsQ0m0yyG6FYkVHWzTP3bXLIGv43Zz
66dpGwC8Nabc9IEXYkko66Sr2IxCtqrJaiEsb8Sz7Z43tSBDCjKnSy5WgbDQ2JFb
j4NAimZTOrYAFZl3y5XugRbbVNJzzeO5jKf4BKQuvaqPij9rEW5S9GdkN+WG1L3D
QDHibHmGdCK+oJWr3upLa4A1X8409SchII1K/km756CsDSAed/Fh70RnCySYfCZ0
yi6Wdech81FA0WhcAJBePHF/U04IlPbnpr/TjYczlHA5rS6h+txML+NSLeOUbaka
kj69wrUzQlFo1r7Sn/nh1OlMcHApfTs4/Zg93zidptHgvRZoCP/JLsZqcPdfM2c4
VlIBP2ZDy9jKlUQMsEqiQgEpZljnrM66VhqPdwbidtrkgQAUoahjfh6AhoUArStE
/B+WP68uhSDfTJYDOizQ
=FAbH
-----END PGP SIGNATURE-----

--Sig_/dFVkZRhwLEaRBugiDW7PYG7--
