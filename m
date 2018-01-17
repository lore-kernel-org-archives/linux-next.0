From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Wed, 17 Jan 2018 12:09:54 +1100
Message-ID: <20180117120954.042473f6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Alexander Aring <aring@mojatatu.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the net-next tree got conflicts in:

  net/sched/sch_ingress.c
  net/sched/sch_api.c
  include/net/sch_generic.h

between commit:

  81d947e2b8dd ("net, sched: fix panic when updating miniq {b,q}stats")

from the net tree and commits:

  54160ef6ec64 ("net: sched: sch_api: rearrange init handling")
  8d1a77f974ca ("net: sch: api: add extack support in tcf_block_get")
  d0bd684dddab ("net: sch: api: add extack support in qdisc_alloc")

from the net-next tree.

I fixed it up (I think, see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc include/net/sch_generic.h
index becf86aa4ac6,ac029d5d88e4..000000000000
--- a/include/net/sch_generic.h
+++ b/include/net/sch_generic.h
@@@ -444,10 -471,11 +471,12 @@@ void qdisc_destroy(struct Qdisc *qdisc)
  void qdisc_tree_reduce_backlog(struct Qdisc *qdisc, unsigned int n,
  			       unsigned int len);
  struct Qdisc *qdisc_alloc(struct netdev_queue *dev_queue,
- 			  const struct Qdisc_ops *ops);
+ 			  const struct Qdisc_ops *ops,
+ 			  struct netlink_ext_ack *extack);
 +void qdisc_free(struct Qdisc *qdisc);
  struct Qdisc *qdisc_create_dflt(struct netdev_queue *dev_queue,
- 				const struct Qdisc_ops *ops, u32 parentid);
+ 				const struct Qdisc_ops *ops, u32 parentid,
+ 				struct netlink_ext_ack *extack);
  void __qdisc_calculate_pkt_len(struct sk_buff *skb,
  			       const struct qdisc_size_table *stab);
  int skb_do_redirect(struct sk_buff *);
diff --cc net/sched/sch_api.c
index 52529b7f8d96,0038a1c44ee9..000000000000
--- a/net/sched/sch_api.c
+++ b/net/sched/sch_api.c
@@@ -1062,43 -1088,64 +1088,53 @@@ static struct Qdisc *qdisc_create(struc
  		netdev_info(dev, "Caught tx_queue_len zero misconfig\n");
  	}
  
- 	if (!ops->init || (err = ops->init(sch, tca[TCA_OPTIONS])) == 0) {
- 		if (tca[TCA_STAB]) {
- 			stab = qdisc_get_stab(tca[TCA_STAB]);
- 			if (IS_ERR(stab)) {
- 				err = PTR_ERR(stab);
- 				goto err_out4;
- 			}
- 			rcu_assign_pointer(sch->stab, stab);
- 		}
- 		if (tca[TCA_RATE]) {
- 			seqcount_t *running;
- 
- 			err = -EOPNOTSUPP;
- 			if (sch->flags & TCQ_F_MQROOT)
- 				goto err_out4;
- 
- 			if ((sch->parent != TC_H_ROOT) &&
- 			    !(sch->flags & TCQ_F_INGRESS) &&
- 			    (!p || !(p->flags & TCQ_F_MQROOT)))
- 				running = qdisc_root_sleeping_running(sch);
- 			else
- 				running = &sch->running;
- 
- 			err = gen_new_estimator(&sch->bstats,
- 						sch->cpu_bstats,
- 						&sch->rate_est,
- 						NULL,
- 						running,
- 						tca[TCA_RATE]);
- 			if (err)
- 				goto err_out4;
+ 	if (ops->init) {
+ 		err = ops->init(sch, tca[TCA_OPTIONS], extack);
+ 		if (err != 0)
+ 			goto err_out5;
+ 	}
+ 
 -	if (qdisc_is_percpu_stats(sch)) {
 -		sch->cpu_bstats =
 -			netdev_alloc_pcpu_stats(struct gnet_stats_basic_cpu);
 -		if (!sch->cpu_bstats)
 -			goto err_out4;
 -
 -		sch->cpu_qstats = alloc_percpu(struct gnet_stats_queue);
 -		if (!sch->cpu_qstats)
 -			goto err_out4;
 -	}
 -
+ 	if (tca[TCA_STAB]) {
+ 		stab = qdisc_get_stab(tca[TCA_STAB], extack);
+ 		if (IS_ERR(stab)) {
+ 			err = PTR_ERR(stab);
+ 			goto err_out4;
  		}
+ 		rcu_assign_pointer(sch->stab, stab);
+ 	}
+ 	if (tca[TCA_RATE]) {
+ 		seqcount_t *running;
  
- 		qdisc_hash_add(sch, false);
+ 		err = -EOPNOTSUPP;
+ 		if (sch->flags & TCQ_F_MQROOT) {
+ 			NL_SET_ERR_MSG(extack, "Cannot attach rate estimator to a multi-queue root qdisc");
+ 			goto err_out4;
+ 		}
  
- 		return sch;
+ 		if (sch->parent != TC_H_ROOT &&
+ 		    !(sch->flags & TCQ_F_INGRESS) &&
+ 		    (!p || !(p->flags & TCQ_F_MQROOT)))
+ 			running = qdisc_root_sleeping_running(sch);
+ 		else
+ 			running = &sch->running;
+ 
+ 		err = gen_new_estimator(&sch->bstats,
+ 					sch->cpu_bstats,
+ 					&sch->rate_est,
+ 					NULL,
+ 					running,
+ 					tca[TCA_RATE]);
+ 		if (err) {
+ 			NL_SET_ERR_MSG(extack, "Failed to generate new estimator");
+ 			goto err_out4;
+ 		}
  	}
+ 
+ 	qdisc_hash_add(sch, false);
+ 
+ 	return sch;
+ 
+ err_out5:
  	/* ops->init() failed, we call ->destroy() like qdisc_create_dflt() */
  	if (ops->destroy)
  		ops->destroy(sch);
diff --cc net/sched/sch_ingress.c
index 003e1b063447,7ca2be20dd6f..000000000000
--- a/net/sched/sch_ingress.c
+++ b/net/sched/sch_ingress.c
@@@ -75,7 -78,13 +77,7 @@@ static int ingress_init(struct Qdisc *s
  	q->block_info.chain_head_change = clsact_chain_head_change;
  	q->block_info.chain_head_change_priv = &q->miniqp;
  
- 	return tcf_block_get_ext(&q->block, sch, &q->block_info);
 -	err = tcf_block_get_ext(&q->block, sch, &q->block_info, extack);
 -	if (err)
 -		return err;
 -
 -	sch->flags |= TCQ_F_CPUSTATS;
 -
 -	return 0;
++	return tcf_block_get_ext(&q->block, sch, &q->block_info, extack);
  }
  
  static void ingress_destroy(struct Qdisc *sch)
@@@ -186,7 -197,14 +191,8 @@@ static int clsact_init(struct Qdisc *sc
  	q->egress_block_info.chain_head_change = clsact_chain_head_change;
  	q->egress_block_info.chain_head_change_priv = &q->miniqp_egress;
  
- 	return tcf_block_get_ext(&q->egress_block, sch, &q->egress_block_info);
 -	err = tcf_block_get_ext(&q->egress_block, sch, &q->egress_block_info,
++	return tcf_block_get_ext(&q->egress_block, sch, &q->egress_block_info,
+ 				extack);
 -	if (err)
 -		return err;
 -
 -	sch->flags |= TCQ_F_CPUSTATS;
 -
 -	return 0;
  }
  
  static void clsact_destroy(struct Qdisc *sch)
