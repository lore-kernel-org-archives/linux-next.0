From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] ata: PATA_ARASAN_CF depends on DMADEVICES
Date: Sun, 22 May 2011 17:32:27 -0700
Message-ID: <20110522173227.5ba18817.randy.dunlap@oracle.com>
References: <20110520165507.cba539d5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-ide-owner@vger.kernel.org>
In-Reply-To: <20110520165507.cba539d5.sfr@canb.auug.org.au>
Sender: linux-ide-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-ide@vger.kernel.org, Jeff Garzik <jgarzik@pobox.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Viresh Kumar <viresh.kumar@st.com>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix kconfig unmet dependency warning:

warning: (PATA_ARASAN_CF && VIDEO_TIMBERDALE && SND_SOC_SH4_SIU) selects DMA_ENGINE which has unmet direct dependencies (DMADEVICES)

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Viresh Kumar <viresh.kumar@st.com>
---
 drivers/ata/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20110520.orig/drivers/ata/Kconfig
+++ linux-next-20110520/drivers/ata/Kconfig
@@ -313,6 +313,7 @@ config PATA_AMD
 
 config PATA_ARASAN_CF
 	tristate "ARASAN CompactFlash PATA Controller Support"
+	depends on DMADEVICES
 	select DMA_ENGINE
 	help
 	  Say Y here to support the ARASAN CompactFlash PATA controller
