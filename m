From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: next-1007: dmar fails to build
Date: Wed, 7 Oct 2009 12:59:58 +0400
Message-ID: <20091007085958.GA12537@orion>
References: <a4423d670910070150v6b8df19bt733eac1b32f04257@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f210.google.com ([209.85.218.210]:44620 "EHLO
	mail-bw0-f210.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933929AbZJGJAQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Oct 2009 05:00:16 -0400
Received: by mail-bw0-f210.google.com with SMTP id 6so3940127bwz.37
        for <linux-next@vger.kernel.org>; Wed, 07 Oct 2009 02:00:04 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <a4423d670910070150v6b8df19bt733eac1b32f04257@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next <linux-next@vger.kernel.org>, Suresh Siddha <suresh.b.siddha@intel.com>, David Woodhouse <David.Woodhouse@intel.com>

On Wed, Oct 07, 2009 at 12:50:39PM +0400, Alexander Beregalov wrote:
> drivers/pci/dmar.c: In function 'dmar_parse_one_rhsa':
> drivers/pci/dmar.c:360: error: implicit declaration of function
> 'acpi_map_pxm_to_node'
> 
> $ grep NUMA .config
> $

By the way, shouldn't it be as following?

diff --git a/drivers/pci/dmar.c b/drivers/pci/dmar.c
index 63aa529..474c7e8 100644
--- a/drivers/pci/dmar.c
+++ b/drivers/pci/dmar.c
@@ -362,8 +362,8 @@ dmar_parse_one_rhsa(struct acpi_dmar_header *header)
 			if (!node_online(node))
 				node = -1;
 			drhd->iommu->node = node;
-		return 0;
-	}
+			return 0;
+		}
 
 	return -ENODEV;
 }
