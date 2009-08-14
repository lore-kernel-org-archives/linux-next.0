From: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Subject: [PATCH] next-20090813 DX SEP driver build breaks with CONFIG_PCI=n
Date: Fri, 14 Aug 2009 15:52:50 +0530
Message-ID: <20090814102250.GA4162@linux.vnet.ibm.com>
References: <20090813200559.6bf4f5d9.sfr@canb.auug.org.au>
Reply-To: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754775AbZHNKWw@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090813200559.6bf4f5d9.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@suse.de>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, mark.a.allyn@intel.com
List-Id: linux-next.vger.kernel.org

Hi Greg,

	next-20090813 randconfig build breaks Discretix SEP driver when
configured with CONFIG_PCI=n.

drivers/staging/sep/sep_driver.c: In function 'sep_probe':
drivers/staging/sep/sep_driver.c:2548: error: implicit declaration of function 'pci_dev_get'

This patch adds the dependency on PCI for the DX SEP driver.

Signed-off-by: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
--
 drivers/staging/sep/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/sep/Kconfig b/drivers/staging/sep/Kconfig
index 6ef59f8..0a9c39c 100644
--- a/drivers/staging/sep/Kconfig
+++ b/drivers/staging/sep/Kconfig
@@ -1,7 +1,7 @@
 config DX_SEP
 	tristate "Discretix SEP driver"
 #	depends on MRST
-	depends on RAR_REGISTER
+	depends on RAR_REGISTER && PCI
 	default y
 	help
 	  Discretix SEP driver
			
					Kamalesh
