From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the workqueues tree
Date: Sat, 20 Jun 2015 20:26:12 +1000
Message-ID: <20150620202612.43818283@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/BjH+f_227ltz.weEq8PwH0l"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lai Jiangshan <laijs@cn.fujitsu.com>
List-Id: linux-next.vger.kernel.org

--Sig_/BjH+f_227ltz.weEq8PwH0l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Tejun,

After merging the workqueues tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

kernel/workqueue.c: In function 'unbound_pwq_by_node':
kernel/workqueue.c:570:2: error: implicit declaration of function 'rcu_lock=
dep_assert' [-Werror=3Dimplicit-function-declaration]
  assert_rcu_or_wq_mutex_or_pool_mutex(wq);
  ^
kernel/workqueue.c:570:2: error: implicit declaration of function 'lockdep_=
is_held' [-Werror=3Dimplicit-function-declaration]

Caused by commit:

  5b95e1af8d17 ("workqueue: wq_pool_mutex protects the attrs-installation")

from the workqueues tree interacting with commit:

  eeacf8982637 ("rcu: Rename rcu_lockdep_assert() to RCU_LOCKDEP_WARN()")

from the rcu tree.

I applied the followinf merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Sat, 20 Jun 2015 19:39:43 +1000
Subject: [PATCH] workqueue: fix up for rcu_lockdep_assert() rename

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/workqueue.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 837427cc5bdf..44cd4144ebcb 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -348,10 +348,10 @@ static void workqueue_sysfs_unregister(struct workque=
ue_struct *wq);
 			 "sched RCU or wq->mutex should be held")
=20
 #define assert_rcu_or_wq_mutex_or_pool_mutex(wq)			\
-	rcu_lockdep_assert(rcu_read_lock_sched_held() ||		\
-			   lockdep_is_held(&wq->mutex) ||		\
-			   lockdep_is_held(&wq_pool_mutex),		\
-			   "sched RCU, wq->mutex or wq_pool_mutex should be held")
+	RCU_LOCKDEP_WARN(!rcu_read_lock_sched_held() &&		\
+			 !lockdep_is_held(&wq->mutex) &&		\
+			 !lockdep_is_held(&wq_pool_mutex),		\
+			 "sched RCU, wq->mutex or wq_pool_mutex should be held")
=20
 #define for_each_cpu_worker_pool(pool, cpu)				\
 	for ((pool) =3D &per_cpu(cpu_worker_pools, cpu)[0];		\
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/BjH+f_227ltz.weEq8PwH0l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVhT/KAAoJEMDTa8Ir7ZwVsSYP/AiMSDxFEi1pjrURSOMx0GLK
mc00uUf/ChBuMiVQsKsVBd7AyiOzeW0stVGN18Ses+kybB/ibd7pGJvz1kORCF+i
jxv7RaHKaIGSmEC/WpcxIfRwiapf6Kfquxsq5agx34Y9+09RTbV6iPhWb2Bw8s50
0rbfumaBfV3uLf551MwA5xpBDxlWUZbIpUs27HuNsYgD7EMAXpG2jOy2FDbKIOaC
EIuFrmUqpU0JZ9SGUEr9qsSm+7qimJ3ILtIs8/Axbz3rlJhtFpQeVOP1kEMYYXBV
b3f1INiDIyGEgmltIOzAlrS4MgGqD2kNAIkZ0MMddcmbHqbfjy/B7/I9APxgQvCX
cofReWqYTi9iRU/nm3aoMLqMV8THgb7n1CUcepupffVrBtb4VStZpPPnpS7QXTqc
L+evJyAHoSMD9l2svLMkrv76dpuViWOFbtdL++fLX7qGLBCUTOMiA9edEwqKq7Ru
elJFz6X0iwCQc4EzJdGR7I5NlzmGRIwQlGp7njgDVrZgSrW1pOmXQiMHA82i7KTC
y1RxrbbkFU7X83dbc0EGO4WqIQx+M+xYnMAm3t/GE96tyY/6xqtU3dx1EH+5czqY
6athR/NwllnzomENk/0+oLC7Z8ZOH6ZZh2EsfN/8voTyWp1IxHVu5Yuez6w9Vg9z
1Ar32CKjhnXG/JggPEIE
=2Ti2
-----END PGP SIGNATURE-----

--Sig_/BjH+f_227ltz.weEq8PwH0l--
