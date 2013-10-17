From: Stephen Hemminger <stephen@networkplumber.org>
Subject: [PATCH net-next] em_ipset: use dev_net() accessor
Date: Wed, 16 Oct 2013 17:29:34 -0700
Message-ID: <20131016172934.7913a297@nehalam.linuxnetplumber.net>
References: <1381949500-501-1-git-send-email-treding@nvidia.com>
	<525F09B0.4080802@infradead.org>
	<20131016153949.5f2257b4@nehalam.linuxnetplumber.net>
	<525F2D7D.7010708@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pb0-f47.google.com ([209.85.160.47]:62793 "EHLO
	mail-pb0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761405Ab3JQA3i (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Oct 2013 20:29:38 -0400
Received: by mail-pb0-f47.google.com with SMTP id rr4so1536595pbb.6
        for <linux-next@vger.kernel.org>; Wed, 16 Oct 2013 17:29:38 -0700 (PDT)
In-Reply-To: <525F2D7D.7010708@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, David Miller <davem@davemloft.net>
Cc: Vitaly Lavrov <lve@guap.ru>, Thierry Reding <thierry.reding@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Jamal Hadi Salim <jhs@mojatatu.com>

Randy found that if network namespace not enabled then
nd_net does not exist and would cause compilation failure.

This is handled correctly by using the dev_net() macro.

Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>


--- a/net/sched/em_ipset.c	2013-10-06 14:48:25.030449222 -0700
+++ b/net/sched/em_ipset.c	2013-10-16 15:38:05.030278287 -0700
@@ -24,7 +24,7 @@ static int em_ipset_change(struct tcf_pr
 {
 	struct xt_set_info *set = data;
 	ip_set_id_t index;
-	struct net *net = qdisc_dev(tp->q)->nd_net;
+	struct net *net = dev_net(qdisc_dev(tp->q));
 
 	if (data_len != sizeof(*set))
 		return -EINVAL;
@@ -46,7 +46,7 @@ static void em_ipset_destroy(struct tcf_
 {
 	const struct xt_set_info *set = (const void *) em->data;
 	if (set) {
-		ip_set_nfnl_put(qdisc_dev(p->q)->nd_net, set->index);
+		ip_set_nfnl_put(dev_net(qdisc_dev(p->q)), set->index);
 		kfree((void *) em->data);
 	}
 }
