From: Roland Dreier <rdreier@cisco.com>
Subject: Re: linux-next: infiniband tree build failure
Date: Thu, 19 Nov 2009 16:45:58 -0800
Message-ID: <adaocmy58hl.fsf@roland-alpha.cisco.com>
References: <20091120110342.5128b8f8.sfr@canb.auug.org.au>
	<ada1vju6oa6.fsf@roland-alpha.cisco.com>
	<6307584467EB4D168602C43E0B185157@amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from sj-iport-6.cisco.com ([171.71.176.117]:57235 "EHLO
	sj-iport-6.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752931AbZKTApw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 19 Nov 2009 19:45:52 -0500
In-Reply-To: <6307584467EB4D168602C43E0B185157@amr.corp.intel.com> (Sean
	Hefty's message of "Thu, 19 Nov 2009 16:30:55 -0800")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sean Hefty <sean.hefty@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, general@lists.openfabrics.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

OK, so I threw this into the ipv6 patch, I think it's right:

diff --git a/drivers/infiniband/core/cma.c b/drivers/infiniband/core/cma.c
index 71e616a..fbdd731 100644
--- a/drivers/infiniband/core/cma.c
+++ b/drivers/infiniband/core/cma.c
@@ -2083,6 +2083,7 @@ static int cma_get_port(struct rdma_id_private *id_priv)
 static int cma_check_linklocal(struct rdma_dev_addr *dev_addr,
 			       struct sockaddr *addr)
 {
+#if defined(CONFIG_IPv6) || defined(CONFIG_IPV6_MODULE)
 	struct sockaddr_in6 *sin6;
 
 	if (addr->sa_family != AF_INET6)
@@ -2094,6 +2095,7 @@ static int cma_check_linklocal(struct rdma_dev_addr *dev_addr,
 			return -EINVAL;
 
 	dev_addr->bound_dev_if = sin6->sin6_scope_id;
+#endif
 	return 0;
 }
 
