From: Jamal Hadi Salim <jhs@mojatatu.com>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Tue, 9 Oct 2018 06:02:25 -0400
Message-ID: <7cb98153-14df-96e4-edee-518775f49ec5@mojatatu.com>
References: <20181009122113.05fbf12a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------4143A68BAE4F56D44B625416"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181009122113.05fbf12a@canb.auug.org.au>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
List-Id: linux-next.vger.kernel.org

This is a multi-part message in MIME format.
--------------4143A68BAE4F56D44B625416
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2018-10-08 9:21 p.m., Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the net-next tree got a conflict in:
> 
>    net/sched/cls_u32.c
> 
> between commit:
> 
>    6d4c407744dd ("net: sched: cls_u32: fix hnode refcounting")
> 
> from the net tree and commit:
> 
>    a030598690c6 ("net: sched: cls_u32: simplify the hell out u32_delete() emptiness check")
> 
> from the net-next tree.
> 
> I fixed it up (I reverted the net tree commit as I could not tell
> wich parts of it, if any, are still needed) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
> 

Attached should fix it. Al, please double check.

cheers,
jamal

--------------4143A68BAE4F56D44B625416
Content-Type: text/plain; charset=UTF-8;
 name="al-merge-diff-net-next"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="al-merge-diff-net-next"

--- a/net-next/net/sched/cls_u32.c	2018-10-09 05:18:04.046642676 -0400
+++ b/net/sched/cls_u32.c	2018-10-09 05:29:51.965528032 -0400
@@ -391,6 +391,7 @@
 	RCU_INIT_POINTER(root_ht->next, tp_c->hlist);
 	rcu_assign_pointer(tp_c->hlist, root_ht);
 
+	root_ht->refcnt++;
 	rcu_assign_pointer(tp->root, root_ht);
 	tp->data = tp_c;
 	return 0;
@@ -606,7 +607,7 @@
 	struct tc_u_hnode __rcu **hn;
 	struct tc_u_hnode *phn;
 
-	WARN_ON(ht->refcnt);
+	WARN_ON(--ht->refcnt);
 
 	u32_clear_hnode(tp, ht, extack);
 
@@ -634,7 +635,7 @@
 
 	WARN_ON(root_ht == NULL);
 
-	if (root_ht && --root_ht->refcnt == 0)
+	if (root_ht && --root_ht->refcnt == 1)
 		u32_destroy_hnode(tp, root_ht, extack);
 
 	if (--tp_c->refcnt == 0) {
@@ -679,7 +680,6 @@
 	}
 
 	if (ht->refcnt == 1) {
-		ht->refcnt--;
 		u32_destroy_hnode(tp, ht, extack);
 	} else {
 		NL_SET_ERR_MSG_MOD(extack, "Can not delete in-use filter");
@@ -1079,8 +1079,7 @@
 	}
 #endif
 
-	err = u32_set_parms(net, tp, base, n, tb, tca[TCA_RATE], ovr,
-			    extack);
+	err = u32_set_parms(net, tp, base, n, tb, tca[TCA_RATE], ovr, extack);
 	if (err == 0) {
 		struct tc_u_knode __rcu **ins;
 		struct tc_u_knode *pins;

--------------4143A68BAE4F56D44B625416--
