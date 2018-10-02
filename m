From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the block
 tree
Date: Tue, 2 Oct 2018 17:21:13 +1000
Message-ID: <20181002172113.33dfbd9d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/z0nytnICs3AqwM/QDe8a9+E"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Josef Bacik <josef@toxicpanda.com>, Johannes Weiner <hannes@cmpxchg.org>
List-Id: linux-next.vger.kernel.org

--Sig_/z0nytnICs3AqwM/QDe8a9+E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  block/blk-iolatency.c

between commit:

  1fa2840e56f9 ("blk-iolatency: use a percentile approache for ssd's")

from the block tree and commit:

  07360251b445 ("sched-loadavg-consolidate-load_int-load_frac-calc_load-fix=
")
  1ccc64569a48 ("sched-loadavg-consolidate-load_int-load_frac-calc_load-fix=
-fix")

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

diff --cc block/blk-iolatency.c
index 35c48d7b8f78,8793f1344e11..000000000000
--- a/block/blk-iolatency.c
+++ b/block/blk-iolatency.c
@@@ -186,80 -172,6 +186,81 @@@ static inline struct blkcg_gq *lat_to_b
  	return pd_to_blkg(&iolat->pd);
  }
 =20
 +static inline void latency_stat_init(struct iolatency_grp *iolat,
 +				     struct latency_stat *stat)
 +{
 +	if (iolat->ssd) {
 +		stat->ps.total =3D 0;
 +		stat->ps.missed =3D 0;
 +	} else
 +		blk_rq_stat_init(&stat->rqs);
 +}
 +
 +static inline void latency_stat_sum(struct iolatency_grp *iolat,
 +				    struct latency_stat *sum,
 +				    struct latency_stat *stat)
 +{
 +	if (iolat->ssd) {
 +		sum->ps.total +=3D stat->ps.total;
 +		sum->ps.missed +=3D stat->ps.missed;
 +	} else
 +		blk_rq_stat_sum(&sum->rqs, &stat->rqs);
 +}
 +
 +static inline void latency_stat_record_time(struct iolatency_grp *iolat,
 +					    u64 req_time)
 +{
 +	struct latency_stat *stat =3D get_cpu_ptr(iolat->stats);
 +	if (iolat->ssd) {
 +		if (req_time >=3D iolat->min_lat_nsec)
 +			stat->ps.missed++;
 +		stat->ps.total++;
 +	} else
 +		blk_rq_stat_add(&stat->rqs, req_time);
 +	put_cpu_ptr(stat);
 +}
 +
 +static inline bool latency_sum_ok(struct iolatency_grp *iolat,
 +				  struct latency_stat *stat)
 +{
 +	if (iolat->ssd) {
 +		u64 thresh =3D div64_u64(stat->ps.total, 10);
 +		thresh =3D max(thresh, 1ULL);
 +		return stat->ps.missed < thresh;
 +	}
 +	return stat->rqs.mean <=3D iolat->min_lat_nsec;
 +}
 +
 +static inline u64 latency_stat_samples(struct iolatency_grp *iolat,
 +				       struct latency_stat *stat)
 +{
 +	if (iolat->ssd)
 +		return stat->ps.total;
 +	return stat->rqs.nr_samples;
 +}
 +
 +static inline void iolat_update_total_lat_avg(struct iolatency_grp *iolat,
 +					      struct latency_stat *stat)
 +{
 +	int exp_idx;
 +
 +	if (iolat->ssd)
 +		return;
 +
 +	/*
- 	 * CALC_LOAD takes in a number stored in fixed point representation.
++	 * calc_load takes in a number stored in fixed point representation.
 +	 * Because we are using this for IO time in ns, the values stored
 +	 * are significantly larger than the FIXED_1 denominator (2048).
 +	 * Therefore, rounding errors in the calculation are negligible and
 +	 * can be ignored.
 +	 */
 +	exp_idx =3D min_t(int, BLKIOLATENCY_NR_EXP_FACTORS - 1,
 +			div64_u64(iolat->cur_win_nsec,
 +				  BLKIOLATENCY_EXP_BUCKET_SIZE));
- 	CALC_LOAD(iolat->lat_avg, iolatency_exp_factors[exp_idx], stat->rqs.mean=
);
++	iolat->lat_avg =3D calc_load(iolat->lat_avg,
++				   iolatency_exp_factors[exp_idx], stat->rqs.mean);
 +}
 +
  static inline bool iolatency_may_queue(struct iolatency_grp *iolat,
  				       wait_queue_entry_t *wait,
  				       bool first_block)

--Sig_/z0nytnICs3AqwM/QDe8a9+E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluzHGkACgkQAVBC80lX
0Gx88gf/Y4nDG8a3w5gSgM3kuhMi/cA5SuHgtmOFKNHoYZQSQr5T/mZosMLxyYSX
Qx/de9yzWyR/8PO3rxSU03MuCniZlKbE/1QZEdYi0Cx5g6Xw99iSL+osAvEJdlVd
AO10UjUkafEO1sBywzJgXC8JlF1a6x0Uuo8qhFltimLJq2A4IL78iKQPCoZpQaDl
iHH8X3sEqAHOV7blJ4m7NHzPB/yd+z0kWVyptXBQAgW7/mLKOIsO/AsjuNo0EsvX
ljr8Sz0ALyLTdzUDFnXQ2hASDLmIq5/aH4xTBQpct6Pg8voBuKan5vR/6GSFE9hz
eSztnksNAocYuWe2Ypgt9Rwywy8Qyw==
=8H48
-----END PGP SIGNATURE-----

--Sig_/z0nytnICs3AqwM/QDe8a9+E--
