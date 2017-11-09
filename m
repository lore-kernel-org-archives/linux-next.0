From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with Linus' tree
Date: Fri, 10 Nov 2017 10:31:00 +1100
Message-ID: <20171110103100.3cffee49@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Cong Wang <xiyou.wangcong@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  net/sched/cls_basic.c
  net/sched/cls_u32.c

between commits:

  0b2a59894b76 ("cls_basic: use tcf_exts_get_net() before call_rcu()")
  35c55fc156d8 ("cls_u32: use tcf_exts_get_net() before call_rcu()")

from Linus' tree and commit:

  1d8134fea2eb ("net_sched: use idr to allocate basic filter handles")

from the net-next tree.

I fixed it up (I think - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc net/sched/cls_basic.c
index e43c56d5b96a,871351358c10..000000000000
--- a/net/sched/cls_basic.c
+++ b/net/sched/cls_basic.c
@@@ -118,11 -115,10 +120,13 @@@ static void basic_destroy(struct tcf_pr
  	list_for_each_entry_safe(f, n, &head->flist, link) {
  		list_del_rcu(&f->link);
  		tcf_unbind_filter(tp, &f->res);
+ 		idr_remove_ext(&head->handle_idr, f->handle);
 -		call_rcu(&f->rcu, basic_delete_filter);
 +		if (tcf_exts_get_net(&f->exts))
 +			call_rcu(&f->rcu, basic_delete_filter);
 +		else
 +			__basic_delete_filter(f);
  	}
+ 	idr_destroy(&head->handle_idr);
  	kfree_rcu(head, rcu);
  }
  
@@@ -133,7 -129,7 +137,8 @@@ static int basic_delete(struct tcf_prot
  
  	list_del_rcu(&f->link);
  	tcf_unbind_filter(tp, &f->res);
 +	tcf_exts_get_net(&f->exts);
+ 	idr_remove_ext(&head->handle_idr, f->handle);
  	call_rcu(&f->rcu, basic_delete_filter);
  	*last = list_empty(&head->flist);
  	return 0;
@@@ -226,9 -222,9 +231,10 @@@ static int basic_change(struct net *net
  	*arg = fnew;
  
  	if (fold) {
+ 		idr_replace_ext(&head->handle_idr, fnew, fnew->handle);
  		list_replace_rcu(&fold->link, &fnew->link);
  		tcf_unbind_filter(tp, &fold->res);
 +		tcf_exts_get_net(&fold->exts);
  		call_rcu(&fold->rcu, basic_delete_filter);
  	} else {
  		list_add_rcu(&fnew->link, &head->flist);
diff --cc net/sched/cls_u32.c
index b58eccb21f03,2737b71854c9..000000000000
--- a/net/sched/cls_u32.c
+++ b/net/sched/cls_u32.c
@@@ -590,10 -589,8 +591,11 @@@ static void u32_clear_hnode(struct tcf_
  					 rtnl_dereference(n->next));
  			tcf_unbind_filter(tp, &n->res);
  			u32_remove_hw_knode(tp, n->handle);
+ 			idr_remove_ext(&ht->handle_idr, n->handle);
 -			call_rcu(&n->rcu, u32_delete_key_freepf_rcu);
 +			if (tcf_exts_get_net(&n->exts))
 +				call_rcu(&n->rcu, u32_delete_key_freepf_rcu);
 +			else
 +				u32_destroy_key(n->tp, n, true);
  		}
  	}
  }
