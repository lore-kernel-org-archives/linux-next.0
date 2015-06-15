From: Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: manual merge of the staging tree with the rdma tree
Date: Mon, 15 Jun 2015 18:12:11 +1000
Message-ID: <1434355931.19706.5.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Doug Ledford <dledford@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matan Barak <matanb@mellanox.com>, Or Gerlitz <ogerlitz@mellanox.com>, Mike Shuey <shuey@purdue.edu>
List-Id: linux-next.vger.kernel.org

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in
drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c between commit 8e37210b38fb
"IB/core: Change ib_create_cq to use struct ib_cq_init_attr" from the rdma tree
and commit ec3d17c0ed2e "staging: lustre: lnet: o2iblnd: code cleanup - align
whitespace" from the staging tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

cheers


diff --cc drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c
index c41b5575df05,48454a576b7a..000000000000
--- a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c
+++ b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c
@@@ -642,18 -643,17 +643,18 @@@ kib_conn_t *kiblnd_create_conn(kib_peer
  	 * she must dispose of 'cmid'.  (Actually I'd block forever if I tried
  	 * to destroy 'cmid' here since I'm called from the CM which still has
  	 * its ref on 'cmid'). */
- 	rwlock_t		*glock = &kiblnd_data.kib_global_lock;
- 	kib_net_t	      *net = peer->ibp_ni->ni_data;
- 	kib_dev_t	      *dev;
+ 	rwlock_t *glock = &kiblnd_data.kib_global_lock;
+ 	kib_net_t *net = peer->ibp_ni->ni_data;
+ 	kib_dev_t *dev;
  	struct ib_qp_init_attr *init_qp_attr;
- 	struct kib_sched_info	*sched;
- 	struct ib_cq_init_attr  cq_attr = {};
- 	kib_conn_t		*conn;
- 	struct ib_cq		*cq;
- 	unsigned long		flags;
- 	int			cpt;
- 	int			rc;
- 	int			i;
+ 	struct kib_sched_info *sched;
++	struct ib_cq_init_attr cq_attr = {};
+ 	kib_conn_t *conn;
+ 	struct ib_cq *cq;
+ 	unsigned long flags;
+ 	int cpt;
+ 	int rc;
+ 	int i;
  
  	LASSERT(net != NULL);
  	LASSERT(!in_interrupt());
