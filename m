From: Michal Hocko <mhocko@suse.cz>
Subject: Re: mmotm 2012-12-20-16-15 uploaded
Date: Fri, 21 Dec 2012 09:55:06 +0100
Message-ID: <20121221085506.GA13375@dhcp22.suse.cz>
References: <20121221001631.74ECA82004A@wpzn4.hot.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:46086 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751790Ab2LUIzI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 21 Dec 2012 03:55:08 -0500
Content-Disposition: inline
In-Reply-To: <20121221001631.74ECA82004A@wpzn4.hot.corp.google.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org

cma-use-unsigned-type-for-count-argument-fix.patch has a typo:
@@ -1060,38 +1059,39 @@ static struct page **__iommu_alloc_buffe
 
 		__dma_clear_buffer(page, size);
 
-		for (i = 0; i < count; i++)
-			pages[i] = page + i;
+		for (idx = 0; idx < count; idx++)
+			pages[i] = page + idx;
 
 		return pages;
 	}
 
 	while (count) {
-		int j, order = __fls(count);
+		unsigned int j;
+		unnsigned int order = __fls(count);

s/unnsigned/unsigned/

-- 
Michal Hocko
SUSE Labs
