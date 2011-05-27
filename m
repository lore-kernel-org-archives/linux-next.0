From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the async_tx tree with Linus' tree
Date: Fri, 27 May 2011 13:30:03 +1000
Message-ID: <20110527133003.8299b429.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34782 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753627Ab1E0DaI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 May 2011 23:30:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jean Delvare <khali@linux-fr.org>, Havard Skinnemoen <hskinnemoen@gmail.com>, Jiri Kosina <jkosina@suse.cz>, Viresh Kumar <viresh.kumar@st.com>

Hi Dan,

Today's linux-next merge of the async_tx tree got a conflict in
drivers/dma/dw_dmac.c between commit e05503ef1186 ("Haavard Skinnemoen
has left Atmel") from Linus' tree and commit aecb7b64dd9e
("dmaengine/dw_dmac: Update maintainer-ship") from the async_tx tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/dma/dw_dmac.c
index 2a2e2fa,efd836d..0000000
--- a/drivers/dma/dw_dmac.c
+++ b/drivers/dma/dw_dmac.c
@@@ -1486,4 -1575,5 +1575,5 @@@ module_exit(dw_exit)
  
  MODULE_LICENSE("GPL v2");
  MODULE_DESCRIPTION("Synopsys DesignWare DMA Controller driver");
 -MODULE_AUTHOR("Haavard Skinnemoen <haavard.skinnemoen@atmel.com>");
 +MODULE_AUTHOR("Haavard Skinnemoen (Atmel)");
+ MODULE_AUTHOR("Viresh Kumar <viresh.kumar@st.com>");
