From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the ipvs-next tree
Date: Fri, 15 Apr 2016 10:57:48 +1000
Message-ID: <20160415105748.5b8754fc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52742 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752689AbcDOA5w (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 14 Apr 2016 20:57:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Simon Horman <horms@verge.net.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>

Hi Simon,

After merging the ipvs-next tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

net/netfilter/nf_conntrack_netlink.c:529:15: warning: 'ctnetlink_proto_size' defined but not used [-Wunused-function]
 static size_t ctnetlink_proto_size(const struct nf_conn *ct)
               ^
net/netfilter/nf_conntrack_netlink.c:546:15: warning: 'ctnetlink_acct_size' defined but not used [-Wunused-function]
 static size_t ctnetlink_acct_size(const struct nf_conn *ct)
               ^
net/netfilter/nf_conntrack_netlink.c:556:12: warning: 'ctnetlink_secctx_size' defined but not used [-Wunused-function]
 static int ctnetlink_secctx_size(const struct nf_conn *ct)
            ^
net/netfilter/nf_conntrack_netlink.c:572:15: warning: 'ctnetlink_timestamp_size' defined but not used [-Wunused-function]
 static size_t ctnetlink_timestamp_size(const struct nf_conn *ct)
               ^

Introduced by commit

  4054ff45454a ("netfilter: ctnetlink: remove unnecessary inlining")

This build does not set CONFIG_NF_CONNTRACK_EVENTS or
CONFIG_NETFILTER_NETLINK_GLUE_CT.

-- 
Cheers,
Stephen Rothwell
