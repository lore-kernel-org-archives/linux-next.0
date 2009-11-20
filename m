From: "Sean Hefty" <sean.hefty@intel.com>
Subject: RE: linux-next: infiniband tree build failure
Date: Thu, 19 Nov 2009 16:52:10 -0800
Message-ID: <D77E1576A4E24759B7A602F5F3EAB2B6@amr.corp.intel.com>
References: <20091120110342.5128b8f8.sfr@canb.auug.org.au>	<ada1vju6oa6.fsf@roland-alpha.cisco.com>	<6307584467EB4D168602C43E0B185157@amr.corp.intel.com> <adaocmy58hl.fsf@roland-alpha.cisco.com>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:48802 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755153AbZKTAwE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Nov 2009 19:52:04 -0500
In-Reply-To: <adaocmy58hl.fsf@roland-alpha.cisco.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: 'Roland Dreier' <rdreier@cisco.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

>OK, so I threw this into the ipv6 patch, I think it's right:

Looks correct - thanks.

>diff --git a/drivers/infiniband/core/cma.c b/drivers/infiniband/core/cma.c
>index 71e616a..fbdd731 100644
>--- a/drivers/infiniband/core/cma.c
>+++ b/drivers/infiniband/core/cma.c
>@@ -2083,6 +2083,7 @@ static int cma_get_port(struct rdma_id_private *id_priv)
> static int cma_check_linklocal(struct rdma_dev_addr *dev_addr,
> 			       struct sockaddr *addr)
> {
>+#if defined(CONFIG_IPv6) || defined(CONFIG_IPV6_MODULE)
> 	struct sockaddr_in6 *sin6;
>
> 	if (addr->sa_family != AF_INET6)
>@@ -2094,6 +2095,7 @@ static int cma_check_linklocal(struct rdma_dev_addr
>*dev_addr,
> 			return -EINVAL;
>
> 	dev_addr->bound_dev_if = sin6->sin6_scope_id;
>+#endif
> 	return 0;
> }
>
