From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-next: firmware tree build failure
Date: Wed, 15 Apr 2009 02:56:41 +0100
Message-ID: <1239760601.29206.29.camel@macbook.infradead.org>
References: <20090414141254.70ddc8ce.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:48268 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753691AbZDOB4p (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Apr 2009 21:56:45 -0400
In-Reply-To: <20090414141254.70ddc8ce.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

On Tue, 2009-04-14 at 14:12 +1000, Stephen Rothwell wrote:
> Today's linux-next build (sparc64 defconfig) failed like this:
> 
> drivers/base/firmware_class.c: In function 'firmware_loading_store':
> drivers/base/firmware_class.c:173: error: 'PAGE_KERNEL_RO' undeclared
> (first use in this function)

I've updated the firmware tree with the following. Thanks.

diff --git a/drivers/base/firmware_class.c b/drivers/base/firmware_class.c
index 90cb7c2..f19afa8 100644
--- a/drivers/base/firmware_class.c
+++ b/drivers/base/firmware_class.c
@@ -125,6 +125,10 @@ static ssize_t firmware_loading_show(struct device *dev,
 	return sprintf(buf, "%d\n", loading);
 }
 
+/* Some architectures don't have PAGE_KERNEL_RO */
+#ifndef PAGE_KERNEL_RO
+#define PAGE_KERNEL_RO PAGE_KERNEL
+#endif
 /**
  * firmware_loading_store - set value in the 'loading' control file
  * @dev: device pointer
@@ -224,7 +228,7 @@ firmware_data_read(struct kobject *kobj, struct bin_attribute *bin_attr,
 		void *page_data;
 		int page_nr = offset >> PAGE_SHIFT;
 		int page_ofs = offset & (PAGE_SIZE-1);
-		int page_cnt = min(PAGE_SIZE - page_ofs, count);
+		int page_cnt = min_t(size_t, PAGE_SIZE - page_ofs, count);
 
 		page_data = kmap(fw_priv->pages[page_nr]);
 
@@ -318,7 +322,7 @@ firmware_data_write(struct kobject *kobj, struct bin_attribute *bin_attr,
 		void *page_data;
 		int page_nr = offset >> PAGE_SHIFT;
 		int page_ofs = offset & (PAGE_SIZE - 1);
-		int page_cnt = min(PAGE_SIZE - page_ofs, count);
+		int page_cnt = min_t(size_t, PAGE_SIZE - page_ofs, count);
 
 		page_data = kmap(fw_priv->pages[page_nr]);
 

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
