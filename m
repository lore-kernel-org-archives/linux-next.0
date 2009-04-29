From: Roland Dreier <rdreier@cisco.com>
Subject: Re: linux-next: infiniband tree build failure
Date: Wed, 29 Apr 2009 09:51:47 -0700
Message-ID: <adatz471jz0.fsf@cisco.com>
References: <20090429140101.d9c7467c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from sj-iport-5.cisco.com ([171.68.10.87]:32020 "EHLO
	sj-iport-5.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750963AbZD2Qvs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Apr 2009 12:51:48 -0400
In-Reply-To: <20090429140101.d9c7467c.sfr@canb.auug.org.au> (Stephen
	Rothwell's message of "Wed, 29 Apr 2009 14:01:01 +1000")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: general@lists.openfabrics.org, linux-next@vger.kernel.org, Stefan Roscher <ossrosch@linux.vnet.ibm.com>

 > Today's linux-next build (powerpc ppc64_defconfig) produced this new
 > warning:
 > 
 > drivers/infiniband/hw/ehca/hcp_phyp.c: In function 'hcp_galpas_ctor':
 > drivers/infiniband/hw/ehca/hcp_phyp.c:65: warning: assignment makes integer from pointer without a cast
 > 
 > Caused by commit 2bd93ed8b59d9bf8b918a0fa04be50482906c16b ("IB/ehca:
 > Remove unnecessary memory operations for userspace queue pairs").

Thanks for pointing this out.  I rolled the below into the patch in
question, which should fix this.

diff --git a/drivers/infiniband/hw/ehca/hcp_phyp.c b/drivers/infiniband/hw/ehca/hcp_phyp.c
index fc3a245..b3e0e72 100644
--- a/drivers/infiniband/hw/ehca/hcp_phyp.c
+++ b/drivers/infiniband/hw/ehca/hcp_phyp.c
@@ -62,7 +62,7 @@ int hcp_galpas_ctor(struct h_galpas *galpas, int is_user,
 		if (ret)
 			return ret;
 	} else
-		galpas->kernel.fw_handle = NULL;
+		galpas->kernel.fw_handle = 0;
 
 	galpas->user.fw_handle = paddr_user;
 
