From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the nfs tree
Date: Mon, 24 Aug 2015 09:16:07 +1000
Message-ID: <20150824091607.4e07c55a@canb.auug.org.au>
References: <20150818105634.5be18a1c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44844 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753710AbbHWXQK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 23 Aug 2015 19:16:10 -0400
In-Reply-To: <20150818105634.5be18a1c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>, Anna Schumaker <Anna.Schumaker@Netapp.com>, Oleg Drokin <green@linuxhacker.ru>, Amir Shehata <amir.shehata@intel.com>

Hi Trond,

On Tue, 18 Aug 2015 10:56:34 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the nfs tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c: In function 'kiblnd_pmr_pool_map':
> drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c:1828:2: error: implicit declaration of function 'ib_reg_phys_mr' [-Werror=implicit-function-declaration]
>   pmr->pmr_mr = ib_reg_phys_mr(hdev->ibh_pd,
>   ^
> drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c:1828:14: warning: assignment makes pointer from integer without a cast
>   pmr->pmr_mr = ib_reg_phys_mr(hdev->ibh_pd,
>               ^
> drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c: In function 'kiblnd_hdev_setup_mrs':
> drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c:2380:6: warning: assignment makes pointer from integer without a cast
>    mr = ib_reg_phys_mr(hdev->ibh_pd, &ipb, 1, acflags, &iova);
>       ^
> 
> Caused by commit
> 
>   1241d7bf2ac8 ("core: Remove the ib_reg_phys_mr() and ib_rereg_phys_mr() verbs")
> 
> which noted this build failure would occur :-(
> 
> Since this commit is self comtained, I have reverted it until someone
> provides a fix for the lustre code.

Any chance of you including the below patch into the nfs tree to fix
the allmodfig build?  Currently, I have to disable lustre in the nfs
tree merge and then reenable it in the staging tree merge - which shows
that this patch (which is also in the staging tree) fixes the build
problem.  Without this patch (or a patch that disables lustre), if the
nfs tree is merged by Linus before the staging tree, his allmodconfig
build will break.

(Greg's SOB line is there because he has also included this patch in
the staging tree.)

From: Oleg Drokin <green@linuxhacker.ru>
Date: Tue, 18 Aug 2015 21:04:35 -0400
Subject: staging/lustre/o2iblnd: remove references to ib_reg_phsy_mr()

Removed references to ib_reg_phsy_mr() and PMR which was added
to deal with some Chelsio specific scenario, but no longer needed
now.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Amir Shehata <amir.shehata@intel.com>
Signed-off-by: Oleg Drokin <oleg.drokin@intel.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 .../staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c    | 251 +--------------------
 .../staging/lustre/lnet/klnds/o2iblnd/o2iblnd.h    |  32 +--
 .../staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c |  55 +----
 .../lustre/lnet/klnds/o2iblnd/o2iblnd_modparams.c  |   6 -
 4 files changed, 19 insertions(+), 325 deletions(-)

diff --git a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c
index 24b2c978dfb6..c29d2ced258c 100644
--- a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c
+++ b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c
@@ -1789,140 +1789,6 @@ struct list_head *kiblnd_pool_alloc_node(kib_poolset_t *ps)
 	goto again;
 }
 
-void kiblnd_pmr_pool_unmap(kib_phys_mr_t *pmr)
-{
-	kib_pmr_pool_t *ppo = pmr->pmr_pool;
-	struct ib_mr *mr = pmr->pmr_mr;
-
-	pmr->pmr_mr = NULL;
-	kiblnd_pool_free_node(&ppo->ppo_pool, &pmr->pmr_list);
-	if (mr != NULL)
-		ib_dereg_mr(mr);
-}
-
-int kiblnd_pmr_pool_map(kib_pmr_poolset_t *pps, kib_hca_dev_t *hdev,
-		    kib_rdma_desc_t *rd, __u64 *iova, kib_phys_mr_t **pp_pmr)
-{
-	kib_phys_mr_t *pmr;
-	struct list_head *node;
-	int rc;
-	int i;
-
-	node = kiblnd_pool_alloc_node(&pps->pps_poolset);
-	if (node == NULL) {
-		CERROR("Failed to allocate PMR descriptor\n");
-		return -ENOMEM;
-	}
-
-	pmr = container_of(node, kib_phys_mr_t, pmr_list);
-	if (pmr->pmr_pool->ppo_hdev != hdev) {
-		kiblnd_pool_free_node(&pmr->pmr_pool->ppo_pool, node);
-		return -EAGAIN;
-	}
-
-	for (i = 0; i < rd->rd_nfrags; i++) {
-		pmr->pmr_ipb[i].addr = rd->rd_frags[i].rf_addr;
-		pmr->pmr_ipb[i].size = rd->rd_frags[i].rf_nob;
-	}
-
-	pmr->pmr_mr = ib_reg_phys_mr(hdev->ibh_pd,
-				     pmr->pmr_ipb, rd->rd_nfrags,
-				     IB_ACCESS_LOCAL_WRITE |
-				     IB_ACCESS_REMOTE_WRITE,
-				     iova);
-	if (!IS_ERR(pmr->pmr_mr)) {
-		pmr->pmr_iova = *iova;
-		*pp_pmr = pmr;
-		return 0;
-	}
-
-	rc = PTR_ERR(pmr->pmr_mr);
-	CERROR("Failed ib_reg_phys_mr: %d\n", rc);
-
-	pmr->pmr_mr = NULL;
-	kiblnd_pool_free_node(&pmr->pmr_pool->ppo_pool, node);
-
-	return rc;
-}
-
-static void kiblnd_destroy_pmr_pool(kib_pool_t *pool)
-{
-	kib_pmr_pool_t *ppo = container_of(pool, kib_pmr_pool_t, ppo_pool);
-	kib_phys_mr_t *pmr;
-	kib_phys_mr_t *tmp;
-
-	LASSERT(pool->po_allocated == 0);
-
-	list_for_each_entry_safe(pmr, tmp, &pool->po_free_list, pmr_list) {
-		LASSERT(pmr->pmr_mr == NULL);
-		list_del(&pmr->pmr_list);
-
-		if (pmr->pmr_ipb != NULL) {
-			LIBCFS_FREE(pmr->pmr_ipb,
-				    IBLND_MAX_RDMA_FRAGS *
-				    sizeof(struct ib_phys_buf));
-		}
-
-		LIBCFS_FREE(pmr, sizeof(kib_phys_mr_t));
-	}
-
-	kiblnd_fini_pool(pool);
-	if (ppo->ppo_hdev != NULL)
-		kiblnd_hdev_decref(ppo->ppo_hdev);
-
-	LIBCFS_FREE(ppo, sizeof(kib_pmr_pool_t));
-}
-
-static inline int kiblnd_pmr_pool_size(int ncpts)
-{
-	int size = *kiblnd_tunables.kib_pmr_pool_size / ncpts;
-
-	return max(IBLND_PMR_POOL, size);
-}
-
-static int kiblnd_create_pmr_pool(kib_poolset_t *ps, int size,
-				  kib_pool_t **pp_po)
-{
-	struct kib_pmr_pool *ppo;
-	struct kib_pool *pool;
-	kib_phys_mr_t *pmr;
-	int i;
-
-	LIBCFS_CPT_ALLOC(ppo, lnet_cpt_table(),
-			 ps->ps_cpt, sizeof(kib_pmr_pool_t));
-	if (ppo == NULL) {
-		CERROR("Failed to allocate PMR pool\n");
-		return -ENOMEM;
-	}
-
-	pool = &ppo->ppo_pool;
-	kiblnd_init_pool(ps, pool, size);
-
-	for (i = 0; i < size; i++) {
-		LIBCFS_CPT_ALLOC(pmr, lnet_cpt_table(),
-				 ps->ps_cpt, sizeof(kib_phys_mr_t));
-		if (pmr == NULL)
-			break;
-
-		pmr->pmr_pool = ppo;
-		LIBCFS_CPT_ALLOC(pmr->pmr_ipb, lnet_cpt_table(), ps->ps_cpt,
-				 IBLND_MAX_RDMA_FRAGS * sizeof(*pmr->pmr_ipb));
-		if (pmr->pmr_ipb == NULL)
-			break;
-
-		list_add(&pmr->pmr_list, &pool->po_free_list);
-	}
-
-	if (i < size) {
-		ps->ps_pool_destroy(pool);
-		return -ENOMEM;
-	}
-
-	ppo->ppo_hdev = kiblnd_current_hdev(ps->ps_net->ibn_dev);
-	*pp_po = pool;
-	return 0;
-}
-
 static void kiblnd_destroy_tx_pool(kib_pool_t *pool)
 {
 	kib_tx_pool_t *tpo = container_of(pool, kib_tx_pool_t, tpo_pool);
@@ -2078,7 +1944,6 @@ static void kiblnd_net_fini_pools(kib_net_t *net)
 	cfs_cpt_for_each(i, lnet_cpt_table()) {
 		kib_tx_poolset_t *tps;
 		kib_fmr_poolset_t *fps;
-		kib_pmr_poolset_t *pps;
 
 		if (net->ibn_tx_ps != NULL) {
 			tps = net->ibn_tx_ps[i];
@@ -2089,11 +1954,6 @@ static void kiblnd_net_fini_pools(kib_net_t *net)
 			fps = net->ibn_fmr_ps[i];
 			kiblnd_fini_fmr_poolset(fps);
 		}
-
-		if (net->ibn_pmr_ps != NULL) {
-			pps = net->ibn_pmr_ps[i];
-			kiblnd_fini_poolset(&pps->pps_poolset);
-		}
 	}
 
 	if (net->ibn_tx_ps != NULL) {
@@ -2105,18 +1965,13 @@ static void kiblnd_net_fini_pools(kib_net_t *net)
 		cfs_percpt_free(net->ibn_fmr_ps);
 		net->ibn_fmr_ps = NULL;
 	}
-
-	if (net->ibn_pmr_ps != NULL) {
-		cfs_percpt_free(net->ibn_pmr_ps);
-		net->ibn_pmr_ps = NULL;
-	}
 }
 
 static int kiblnd_net_init_pools(kib_net_t *net, __u32 *cpts, int ncpts)
 {
 	unsigned long flags;
 	int cpt;
-	int rc;
+	int		rc = 0;
 	int i;
 
 	read_lock_irqsave(&kiblnd_data.kib_global_lock, flags);
@@ -2137,12 +1992,16 @@ static int kiblnd_net_init_pools(kib_net_t *net, __u32 *cpts, int ncpts)
 		goto failed;
 	}
 
-	/* TX pool must be created later than FMR/PMR, see LU-2268
-	 * for details */
+	/*
+	 * TX pool must be created later than FMR, see LU-2268
+	 * for details
+	 */
 	LASSERT(net->ibn_tx_ps == NULL);
 
-	/* premapping can fail if ibd_nmr > 1, so we always create
-	 * FMR/PMR pool and map-on-demand if premapping failed */
+	/*
+	 * premapping can fail if ibd_nmr > 1, so we always create
+	 * FMR pool and map-on-demand if premapping failed
+	 */
 
 	net->ibn_fmr_ps = cfs_percpt_alloc(lnet_cpt_table(),
 					   sizeof(kib_fmr_poolset_t));
@@ -2158,7 +2017,7 @@ static int kiblnd_net_init_pools(kib_net_t *net, __u32 *cpts, int ncpts)
 					     kiblnd_fmr_pool_size(ncpts),
 					     kiblnd_fmr_flush_trigger(ncpts));
 		if (rc == -ENOSYS && i == 0) /* no FMR */
-			break; /* create PMR pool */
+			break;
 
 		if (rc != 0) { /* a real error */
 			CERROR("Can't initialize FMR pool for CPT %d: %d\n",
@@ -2175,38 +2034,8 @@ static int kiblnd_net_init_pools(kib_net_t *net, __u32 *cpts, int ncpts)
 	cfs_percpt_free(net->ibn_fmr_ps);
 	net->ibn_fmr_ps = NULL;
 
-	CWARN("Device does not support FMR, failing back to PMR\n");
-
-	if (*kiblnd_tunables.kib_pmr_pool_size <
-	    *kiblnd_tunables.kib_ntx / 4) {
-		CERROR("Can't set pmr pool size (%d) < ntx / 4(%d)\n",
-		       *kiblnd_tunables.kib_pmr_pool_size,
-		       *kiblnd_tunables.kib_ntx / 4);
-		rc = -EINVAL;
-		goto failed;
-	}
-
-	net->ibn_pmr_ps = cfs_percpt_alloc(lnet_cpt_table(),
-					   sizeof(kib_pmr_poolset_t));
-	if (net->ibn_pmr_ps == NULL) {
-		CERROR("Failed to allocate PMR pool array\n");
-		rc = -ENOMEM;
-		goto failed;
-	}
-
-	for (i = 0; i < ncpts; i++) {
-		cpt = (cpts == NULL) ? i : cpts[i];
-		rc = kiblnd_init_poolset(&net->ibn_pmr_ps[cpt]->pps_poolset,
-					 cpt, net, "PMR",
-					 kiblnd_pmr_pool_size(ncpts),
-					 kiblnd_create_pmr_pool,
-					 kiblnd_destroy_pmr_pool, NULL, NULL);
-		if (rc != 0) {
-			CERROR("Can't initialize PMR pool for CPT %d: %d\n",
-			       cpt, rc);
+	CWARN("Device does not support FMR\n");
 			goto failed;
-		}
-	}
 
  create_tx_pool:
 	net->ibn_tx_ps = cfs_percpt_alloc(lnet_cpt_table(),
@@ -2318,17 +2147,13 @@ void kiblnd_hdev_destroy(kib_hca_dev_t *hdev)
 static int kiblnd_hdev_setup_mrs(kib_hca_dev_t *hdev)
 {
 	struct ib_mr *mr;
-	int i;
 	int rc;
-	__u64 mm_size;
-	__u64 mr_size;
 	int acflags = IB_ACCESS_LOCAL_WRITE | IB_ACCESS_REMOTE_WRITE;
 
 	rc = kiblnd_hdev_get_attr(hdev);
 	if (rc != 0)
 		return rc;
 
-	if (hdev->ibh_mr_shift == 64) {
 		LIBCFS_ALLOC(hdev->ibh_mrs, 1 * sizeof(*hdev->ibh_mrs));
 		if (hdev->ibh_mrs == NULL) {
 			CERROR("Failed to allocate MRs table\n");
@@ -2347,53 +2172,6 @@ static int kiblnd_hdev_setup_mrs(kib_hca_dev_t *hdev)
 
 		hdev->ibh_mrs[0] = mr;
 
-		goto out;
-	}
-
-	mr_size = 1ULL << hdev->ibh_mr_shift;
-	mm_size = (unsigned long)high_memory - PAGE_OFFSET;
-
-	hdev->ibh_nmrs = (int)((mm_size + mr_size - 1) >> hdev->ibh_mr_shift);
-
-	if (hdev->ibh_mr_shift < 32 || hdev->ibh_nmrs > 1024) {
-		/* it's 4T..., assume we will re-code at that time */
-		CERROR("Can't support memory size: x%#llx with MR size: x%#llx\n",
-		       mm_size, mr_size);
-		return -EINVAL;
-	}
-
-	/* create an array of MRs to cover all memory */
-	LIBCFS_ALLOC(hdev->ibh_mrs, sizeof(*hdev->ibh_mrs) * hdev->ibh_nmrs);
-	if (hdev->ibh_mrs == NULL) {
-		CERROR("Failed to allocate MRs' table\n");
-		return -ENOMEM;
-	}
-
-	for (i = 0; i < hdev->ibh_nmrs; i++) {
-		struct ib_phys_buf ipb;
-		__u64 iova;
-
-		ipb.size = hdev->ibh_mr_size;
-		ipb.addr = i * mr_size;
-		iova = ipb.addr;
-
-		mr = ib_reg_phys_mr(hdev->ibh_pd, &ipb, 1, acflags, &iova);
-		if (IS_ERR(mr)) {
-			CERROR("Failed ib_reg_phys_mr addr %#llx size %#llx : %ld\n",
-			       ipb.addr, ipb.size, PTR_ERR(mr));
-			kiblnd_hdev_cleanup_mrs(hdev);
-			return PTR_ERR(mr);
-		}
-
-		LASSERT(iova == ipb.addr);
-
-		hdev->ibh_mrs[i] = mr;
-	}
-
-out:
-	if (hdev->ibh_mr_size != ~0ULL || hdev->ibh_nmrs != 1)
-		LCONSOLE_INFO("Register global MR array, MR size: %#llx, array size: %d\n",
-			      hdev->ibh_mr_size, hdev->ibh_nmrs);
 	return 0;
 }
 
@@ -2564,14 +2342,9 @@ int kiblnd_dev_failover(kib_dev_t *dev)
 			kiblnd_fail_poolset(&net->ibn_tx_ps[i]->tps_poolset,
 					    &zombie_tpo);
 
-			if (net->ibn_fmr_ps != NULL) {
+			if (net->ibn_fmr_ps)
 				kiblnd_fail_fmr_poolset(net->ibn_fmr_ps[i],
 							&zombie_fpo);
-
-			} else if (net->ibn_pmr_ps != NULL) {
-				kiblnd_fail_poolset(&net->ibn_pmr_ps[i]->
-						    pps_poolset, &zombie_ppo);
-			}
 		}
 	}
 
diff --git a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.h b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.h
index 8d4580244c26..f4b6c33ac318 100644
--- a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.h
+++ b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.h
@@ -104,7 +104,6 @@ typedef struct {
 	int          *kib_map_on_demand;     /* map-on-demand if RD has more
 					      * fragments than this value, 0
 					      * disable map-on-demand */
-	int          *kib_pmr_pool_size;     /* # physical MR in pool */
 	int          *kib_fmr_pool_size;     /* # FMRs in pool */
 	int          *kib_fmr_flush_trigger; /* When to trigger FMR flush */
 	int          *kib_fmr_cache;         /* enable FMR pool cache? */
@@ -163,7 +162,6 @@ kiblnd_concurrent_sends_v1(void)
 /* Pools (shared by connections on each CPT) */
 /* These pools can grow at runtime, so don't need give a very large value */
 #define IBLND_TX_POOL			256
-#define IBLND_PMR_POOL			256
 #define IBLND_FMR_POOL			256
 #define IBLND_FMR_POOL_FLUSH		192
 
@@ -232,17 +230,6 @@ typedef struct {
 	struct page        *ibp_pages[0];       /* page array */
 } kib_pages_t;
 
-struct kib_pmr_pool;
-
-typedef struct {
-	struct list_head    pmr_list;           /* chain node */
-	struct ib_phys_buf  *pmr_ipb;           /* physical buffer */
-	struct ib_mr        *pmr_mr;            /* IB MR */
-	struct kib_pmr_pool *pmr_pool;          /* owner of this MR */
-	__u64               pmr_iova;           /* Virtual I/O address */
-	int                 pmr_refcount;       /* reference count */
-} kib_phys_mr_t;
-
 struct kib_pool;
 struct kib_poolset;
 
@@ -299,15 +286,6 @@ typedef struct {
 } kib_tx_pool_t;
 
 typedef struct {
-	kib_poolset_t         pps_poolset;        /* pool-set */
-} kib_pmr_poolset_t;
-
-typedef struct kib_pmr_pool {
-	struct kib_hca_dev    *ppo_hdev;          /* device for this pool */
-	kib_pool_t            ppo_pool;           /* pool */
-} kib_pmr_pool_t;
-
-typedef struct {
 	spinlock_t            fps_lock;            /* serialize */
 	struct kib_net        *fps_net;            /* IB network */
 	struct list_head      fps_pool_list;       /* FMR pool list */
@@ -347,7 +325,6 @@ typedef struct kib_net {
 
 	kib_tx_poolset_t      **ibn_tx_ps;    /* tx pool-set */
 	kib_fmr_poolset_t     **ibn_fmr_ps;   /* fmr pool-set */
-	kib_pmr_poolset_t     **ibn_pmr_ps;   /* pmr pool-set */
 
 	kib_dev_t             *ibn_dev;       /* underlying IB device */
 } kib_net_t;
@@ -554,10 +531,7 @@ typedef struct kib_tx                         /* transmit message */
 	int                    tx_nfrags;     /* # entries in... */
 	struct scatterlist     *tx_frags;     /* dma_map_sg descriptor */
 	__u64                  *tx_pages;     /* rdma phys page addrs */
-	union {
-		kib_phys_mr_t  *pmr;          /* MR for physical buffer */
-		kib_fmr_t      fmr;           /* FMR */
-	}                      tx_u;
+	kib_fmr_t		fmr;	      /* FMR */
 	int                    tx_dmadir;     /* dma direction */
 } kib_tx_t;
 
@@ -978,10 +952,6 @@ int  kiblnd_fmr_pool_map(kib_fmr_poolset_t *fps, __u64 *pages,
 			 int npages, __u64 iov, kib_fmr_t *fmr);
 void kiblnd_fmr_pool_unmap(kib_fmr_t *fmr, int status);
 
-int  kiblnd_pmr_pool_map(kib_pmr_poolset_t *pps, kib_hca_dev_t *hdev,
-			 kib_rdma_desc_t *rd, __u64 *iova, kib_phys_mr_t **pp_pmr);
-void kiblnd_pmr_pool_unmap(kib_phys_mr_t *pmr);
-
 int  kiblnd_startup(lnet_ni_t *ni);
 void kiblnd_shutdown(lnet_ni_t *ni);
 int  kiblnd_ctl(lnet_ni_t *ni, unsigned int cmd, void *arg);
diff --git a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c
index 5a8ebe1b3c84..a23a6d956a4d 100644
--- a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c
+++ b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c
@@ -121,7 +121,6 @@ kiblnd_get_idle_tx(lnet_ni_t *ni, lnet_nid_t target)
 	LASSERT(tx->tx_conn == NULL);
 	LASSERT(tx->tx_lntmsg[0] == NULL);
 	LASSERT(tx->tx_lntmsg[1] == NULL);
-	LASSERT(tx->tx_u.pmr == NULL);
 	LASSERT(tx->tx_nfrags == 0);
 
 	return tx;
@@ -575,7 +574,7 @@ kiblnd_fmr_map_tx(kib_net_t *net, kib_tx_t *tx, kib_rdma_desc_t *rd, int nob)
 	cpt = tx->tx_pool->tpo_pool.po_owner->ps_cpt;
 
 	fps = net->ibn_fmr_ps[cpt];
-	rc = kiblnd_fmr_pool_map(fps, pages, npages, 0, &tx->tx_u.fmr);
+	rc = kiblnd_fmr_pool_map(fps, pages, npages, 0, &tx->fmr);
 	if (rc != 0) {
 		CERROR("Can't map %d pages: %d\n", npages, rc);
 		return rc;
@@ -583,8 +582,8 @@ kiblnd_fmr_map_tx(kib_net_t *net, kib_tx_t *tx, kib_rdma_desc_t *rd, int nob)
 
 	/* If rd is not tx_rd, it's going to get sent to a peer, who will need
 	 * the rkey */
-	rd->rd_key = (rd != tx->tx_rd) ? tx->tx_u.fmr.fmr_pfmr->fmr->rkey :
-					 tx->tx_u.fmr.fmr_pfmr->fmr->lkey;
+	rd->rd_key = (rd != tx->tx_rd) ? tx->fmr.fmr_pfmr->fmr->rkey :
+					 tx->fmr.fmr_pfmr->fmr->lkey;
 	rd->rd_frags[0].rf_addr &= ~hdev->ibh_page_mask;
 	rd->rd_frags[0].rf_nob = nob;
 	rd->rd_nfrags = 1;
@@ -592,42 +591,6 @@ kiblnd_fmr_map_tx(kib_net_t *net, kib_tx_t *tx, kib_rdma_desc_t *rd, int nob)
 	return 0;
 }
 
-static int
-kiblnd_pmr_map_tx(kib_net_t *net, kib_tx_t *tx, kib_rdma_desc_t *rd, int nob)
-{
-	kib_hca_dev_t *hdev;
-	kib_pmr_poolset_t *pps;
-	__u64 iova;
-	int cpt;
-	int rc;
-
-	LASSERT(tx->tx_pool != NULL);
-	LASSERT(tx->tx_pool->tpo_pool.po_owner != NULL);
-
-	hdev = tx->tx_pool->tpo_hdev;
-
-	iova = rd->rd_frags[0].rf_addr & ~hdev->ibh_page_mask;
-
-	cpt = tx->tx_pool->tpo_pool.po_owner->ps_cpt;
-
-	pps = net->ibn_pmr_ps[cpt];
-	rc = kiblnd_pmr_pool_map(pps, hdev, rd, &iova, &tx->tx_u.pmr);
-	if (rc != 0) {
-		CERROR("Failed to create MR by phybuf: %d\n", rc);
-		return rc;
-	}
-
-	/* If rd is not tx_rd, it's going to get sent to a peer, who will need
-	 * the rkey */
-	rd->rd_key = (rd != tx->tx_rd) ? tx->tx_u.pmr->pmr_mr->rkey :
-					 tx->tx_u.pmr->pmr_mr->lkey;
-	rd->rd_nfrags = 1;
-	rd->rd_frags[0].rf_addr = iova;
-	rd->rd_frags[0].rf_nob = nob;
-
-	return 0;
-}
-
 void
 kiblnd_unmap_tx(lnet_ni_t *ni, kib_tx_t *tx)
 {
@@ -635,13 +598,9 @@ kiblnd_unmap_tx(lnet_ni_t *ni, kib_tx_t *tx)
 
 	LASSERT(net != NULL);
 
-	if (net->ibn_fmr_ps != NULL && tx->tx_u.fmr.fmr_pfmr != NULL) {
-		kiblnd_fmr_pool_unmap(&tx->tx_u.fmr, tx->tx_status);
-		tx->tx_u.fmr.fmr_pfmr = NULL;
-
-	} else if (net->ibn_pmr_ps != NULL && tx->tx_u.pmr != NULL) {
-		kiblnd_pmr_pool_unmap(tx->tx_u.pmr);
-		tx->tx_u.pmr = NULL;
+	if (net->ibn_fmr_ps && tx->fmr.fmr_pfmr) {
+		kiblnd_fmr_pool_unmap(&tx->fmr, tx->tx_status);
+		tx->fmr.fmr_pfmr = NULL;
 	}
 
 	if (tx->tx_nfrags != 0) {
@@ -687,8 +646,6 @@ kiblnd_map_tx(lnet_ni_t *ni, kib_tx_t *tx,
 
 	if (net->ibn_fmr_ps != NULL)
 		return kiblnd_fmr_map_tx(net, tx, rd, nob);
-	else if (net->ibn_pmr_ps != NULL)
-		return kiblnd_pmr_map_tx(net, tx, rd, nob);
 
 	return -EINVAL;
 }
diff --git a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_modparams.c b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_modparams.c
index b0e00361cfce..b3d1b5d627cb 100644
--- a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_modparams.c
+++ b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_modparams.c
@@ -126,11 +126,6 @@ static int fmr_cache = 1;
 module_param(fmr_cache, int, 0444);
 MODULE_PARM_DESC(fmr_cache, "non-zero to enable FMR caching");
 
-/* NB: this value is shared by all CPTs, it can grow at runtime */
-static int pmr_pool_size = 512;
-module_param(pmr_pool_size, int, 0444);
-MODULE_PARM_DESC(pmr_pool_size, "size of MR cache pmr pool on each CPT");
-
 /*
  * 0: disable failover
  * 1: enable failover if necessary
@@ -170,7 +165,6 @@ kib_tunables_t kiblnd_tunables = {
 	.kib_fmr_pool_size     = &fmr_pool_size,
 	.kib_fmr_flush_trigger = &fmr_flush_trigger,
 	.kib_fmr_cache         = &fmr_cache,
-	.kib_pmr_pool_size     = &pmr_pool_size,
 	.kib_require_priv_port = &require_privileged_port,
 	.kib_use_priv_port     = &use_privileged_port,
 	.kib_nscheds           = &nscheds
-- 
2.5.0

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
