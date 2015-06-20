From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the modules tree
Date: Sat, 20 Jun 2015 18:35:58 +1000
Message-ID: <20150620183558.51a6296c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/pT8fHvwljNPeqFpgYRLTPpq"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Sig_/pT8fHvwljNPeqFpgYRLTPpq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  include/linux/seqlock.h

between commit:

  7fc26327b756 ("seqlock: Introduce raw_read_seqcount_latch()")

from the modules tree and commit:

  c4bfa3f5f906 ("seqcount: Introduce raw_write_seqcount_barrier()")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/linux/seqlock.h
index 890c7ef709d5,486e685a226a..000000000000
--- a/include/linux/seqlock.h
+++ b/include/linux/seqlock.h
@@@ -234,87 -233,50 +234,128 @@@ static inline void raw_write_seqcount_e
  	s->sequence++;
  }
 =20
+ /**
+  * raw_write_seqcount_barrier - do a seq write barrier
+  * @s: pointer to seqcount_t
+  *
+  * This can be used to provide an ordering guarantee instead of the
+  * usual consistency guarantee. It is one wmb cheaper, because we can
+  * collapse the two back-to-back wmb()s.
+  *
+  *      seqcount_t seq;
+  *      bool X =3D true, Y =3D false;
+  *
+  *      void read(void)
+  *      {
+  *              bool x, y;
+  *
+  *              do {
+  *                      int s =3D read_seqcount_begin(&seq);
+  *
+  *                      x =3D X; y =3D Y;
+  *
+  *              } while (read_seqcount_retry(&seq, s));
+  *
+  *              BUG_ON(!x && !y);
+  *      }
+  *
+  *      void write(void)
+  *      {
+  *              Y =3D true;
+  *
+  *              raw_write_seqcount_barrier(seq);
+  *
+  *              X =3D false;
+  *      }
+  */
+ static inline void raw_write_seqcount_barrier(seqcount_t *s)
+ {
+ 	s->sequence++;
+ 	smp_wmb();
+ 	s->sequence++;
+ }
+=20
 -/*
 +static inline int raw_read_seqcount_latch(seqcount_t *s)
 +{
 +	return lockless_dereference(s->sequence);
 +}
 +
 +/**
   * raw_write_seqcount_latch - redirect readers to even/odd copy
   * @s: pointer to seqcount_t
 + *
 + * The latch technique is a multiversion concurrency control method that =
allows
 + * queries during non-atomic modifications. If you can guarantee queries =
never
 + * interrupt the modification -- e.g. the concurrency is strictly between=
 CPUs
 + * -- you most likely do not need this.
 + *
 + * Where the traditional RCU/lockless data structures rely on atomic
 + * modifications to ensure queries observe either the old or the new stat=
e the
 + * latch allows the same for non-atomic updates. The trade-off is doublin=
g the
 + * cost of storage; we have to maintain two copies of the entire data
 + * structure.
 + *
 + * Very simply put: we first modify one copy and then the other. This ens=
ures
 + * there is always one copy in a stable state, ready to give us an answer.
 + *
 + * The basic form is a data structure like:
 + *
 + * struct latch_struct {
 + *	seqcount_t		seq;
 + *	struct data_struct	data[2];
 + * };
 + *
 + * Where a modification, which is assumed to be externally serialized, do=
es the
 + * following:
 + *
 + * void latch_modify(struct latch_struct *latch, ...)
 + * {
 + *	smp_wmb();	<- Ensure that the last data[1] update is visible
 + *	latch->seq++;
 + *	smp_wmb();	<- Ensure that the seqcount update is visible
 + *
 + *	modify(latch->data[0], ...);
 + *
 + *	smp_wmb();	<- Ensure that the data[0] update is visible
 + *	latch->seq++;
 + *	smp_wmb();	<- Ensure that the seqcount update is visible
 + *
 + *	modify(latch->data[1], ...);
 + * }
 + *
 + * The query will have a form like:
 + *
 + * struct entry *latch_query(struct latch_struct *latch, ...)
 + * {
 + *	struct entry *entry;
 + *	unsigned seq, idx;
 + *
 + *	do {
 + *		seq =3D lockless_dereference(latch->seq);
 + *
 + *		idx =3D seq & 0x01;
 + *		entry =3D data_query(latch->data[idx], ...);
 + *
 + *		smp_rmb();
 + *	} while (seq !=3D latch->seq);
 + *
 + *	return entry;
 + * }
 + *
 + * So during the modification, queries are first redirected to data[1]. T=
hen we
 + * modify data[0]. When that is complete, we redirect queries back to dat=
a[0]
 + * and we can modify data[1].
 + *
 + * NOTE: The non-requirement for atomic modifications does _NOT_ include
 + *       the publishing of new entries in the case where data is a dynamic
 + *       data structure.
 + *
 + *       An iteration might start in data[0] and get suspended long enough
 + *       to miss an entire modification sequence, once it resumes it might
 + *       observe the new entry.
 + *
 + * NOTE: When data is a dynamic data structure; one should use regular RCU
 + *       patterns to manage the lifetimes of the objects within.
   */
  static inline void raw_write_seqcount_latch(seqcount_t *s)
  {

--Sig_/pT8fHvwljNPeqFpgYRLTPpq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVhSX2AAoJEMDTa8Ir7ZwV6VQQAIuzby1qXdaMOQ2/IV8owHeg
Pa4R8e97Lgu0PFUxFtJdEtjlad587LkQbyrgezgB4xESwDDp/WYThZNrlgJXFYr9
w638+wDr9u+aTXQQhYCXqATaNa/pBzqvuQPuYZ5zhdkY9LpjE9w7T5Hzt/5hsh8M
T1sf/s9v5CiFYikalP91w5KSRA5StV4tW+PqAmzyXvDwWJIvpp8oQGfXsn3trAuy
iZO57o5nH5pKcXhidhScPgUhBubdAgFWRgRJoSJdOr8d6AFkCEAIuoNu/tDzab/5
ylQh8ITfxwjXKFy2sOnaEm9PFBI0YUnKSeQ0gW1q5x1fF6LDwi/re+a0hrZOGGhv
Oc0uCqBGIQ/6ztBQ7puw/JjGsxvDuYqz4v7Mt/Kz77Cxu1U4Is8etHY2Bbw8HGaL
9IkxRQCxg3JiYOKn47lZVDkPeP6dMu1qfnRmER9zD2EgzfhcsrRAtmDVlCH6a4Q5
dteXF922fo+syX8/KgceZF52w+zoZykE2KeO8Qp0rZcoctG3TZEF6ygLWFE4bXkK
DAOmXhIxwYViNTrumLvL9HEj1d5UHomOngda2am6SfM5Bn1s1Qdv5bMdKOaQ5daD
vM9rv8E4SqDrK7dfzGQfcKIzxp9/o/ocSHRkICWSfA1k7DSgmEQKs99ejOVB+5qV
2UCPR7YXSq9uzsOBBNx+
=7MJ/
-----END PGP SIGNATURE-----

--Sig_/pT8fHvwljNPeqFpgYRLTPpq--
