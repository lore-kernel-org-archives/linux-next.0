Return-Path: <SRS0=31GW=CX=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E14C9C433E2
	for <linux-next@archiver.kernel.org>; Mon, 14 Sep 2020 17:23:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F3AC20735
	for <linux-next@archiver.kernel.org>; Mon, 14 Sep 2020 17:23:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vUB6uayC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgINM3c (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 14 Sep 2020 08:29:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726297AbgINM1y (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Sep 2020 08:27:54 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 107B6C0612F2;
        Mon, 14 Sep 2020 04:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=sovkMljeHeE8QiqrRubge8NYzTKoGU5H5cGDXKlh4Do=; b=vUB6uayCQphbQuNntBPspugAbh
        jOnkcmA2i0c1bK3N378QEG6urxYN2R7PkOVb1UBFygrhBxVKmvJMjSakYenuJpOACgtx48gHNx+Og
        OjV/0iCsw0wHglN8SOZU9DcEQyzQl7SWZIGlWIHGw1wA20VEHpisZSEb6BLPX8fG7L7A+/Cetvyyo
        hvCQE07SWyK0xzyh330bETJW80DBj35QKQDo5dF7JehFVwCkWjyJWZWIyUfDCpjhryV40uYeeZUag
        tRBzRfTAjPKaeFXjbX7UurmQrcJmocUWXkD10jTTSuoo42EsMmxfEZeOH34uT3zkVyXpjvEMBB6N5
        QVntRK2g==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kHn5T-0007T5-Al; Mon, 14 Sep 2020 11:55:59 +0000
Date:   Mon, 14 Sep 2020 12:55:59 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     open list <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>,
        linux-fsdevel@vger.kernel.org, linux-mm <linux-mm@kvack.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Hugh Dickins <hughd@google.com>,
        William Kucharski <william.kucharski@oracle.com>,
        gandalf@winds.org, Qian Cai <cai@lca.pw>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Michal Hocko <mhocko@suse.com>, Yang Shi <shy828301@gmail.com>,
        Shakeel Butt <shakeelb@google.com>
Subject: Re: BUG: kernel NULL pointer dereference, address: RIP:
 0010:shmem_getpage_gfp.isra.0+0x470/0x750
Message-ID: <20200914115559.GN6583@casper.infradead.org>
References: <CA+G9fYvmut-pJT-HsFRCxiEzOnkOjC8UcksX4v8jUvyLYeXTkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvmut-pJT-HsFRCxiEzOnkOjC8UcksX4v8jUvyLYeXTkQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 14, 2020 at 03:49:43PM +0530, Naresh Kamboju wrote:
> While running LTP fs on qemu x86 and qemu_i386 these kernel BUGs noticed.

I actually sent the fix for this a couple of days ago [1], but I think Andrew
overlooked it while constructing the -mm tree.  Here's a fix you can
apply to the -mm tree:

[1] https://lore.kernel.org/linux-mm/20200912032042.GA6583@casper.infradead.org/

diff --git a/mm/shmem.c b/mm/shmem.c
index d2a46ef7df43..58bc9e326d0d 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1793,7 +1793,7 @@ static int shmem_getpage_gfp(struct inode *inode, pgoff_t index,
 	struct mm_struct *charge_mm;
 	struct page *page;
 	enum sgp_type sgp_huge = sgp;
-	pgoff_t hindex;
+	pgoff_t hindex = index;
 	int error;
 	int once = 0;
 	int alloced = 0;
@@ -1822,6 +1822,8 @@ static int shmem_getpage_gfp(struct inode *inode, pgoff_t index,
 		return error;
 	}
 
+	if (page)
+		hindex = page->index;
 	if (page && sgp == SGP_WRITE)
 		mark_page_accessed(page);
 
@@ -1832,6 +1834,7 @@ static int shmem_getpage_gfp(struct inode *inode, pgoff_t index,
 		unlock_page(page);
 		put_page(page);
 		page = NULL;
+		hindex = index;
 	}
 	if (page || sgp == SGP_READ)
 		goto out;
@@ -1982,7 +1985,7 @@ static int shmem_getpage_gfp(struct inode *inode, pgoff_t index,
 		goto unlock;
 	}
 out:
-	*pagep = page + index - page->index;
+	*pagep = page + index - hindex;
 	return 0;
 
 	/*
