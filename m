Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AE3BE80A8C
	for <linux-next@archiver.kernel.org>; Wed, 27 Sep 2023 05:50:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbjI0FuV (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 27 Sep 2023 01:50:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbjI0Ftg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Sep 2023 01:49:36 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F23F42D5D;
        Tue, 26 Sep 2023 22:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=NBI/vwxF7bis7haqboigx96oCxUQvAi+uPPmr42cy0s=; b=vvSsMaT6/KA6kAxMQtAqK6+4pj
        u6xsMRppyqCsjBCy9izEhZEnx4fyTMkJNSZOYmCJ+s2Nb7hVGpMacDxmjAGCIY8updWUCC0YyU2dK
        VilErZvuAh/QNwi3KXpgr0BUszAR+xewOYEwrvTvwJh+YRTvRQUswzgRfI9skdXEP81RSdz7n1svj
        NYjXkyENTF1+qJ0Plc6qKp+Cmxg0CioQFFnjr2hlTbcYqG02YcqEPu8sPxjCzov7BB8TtHLtIDoz3
        w+i1zmJnSuVpbvajqAud8uBKDHl16+iSU4AZnHNxpbRptAwRpR/V8geLeMs1H4SPQdGgvL76uYLM6
        FkNFUVAw==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qlNAl-0000nF-1g;
        Wed, 27 Sep 2023 05:33:19 +0000
Message-ID: <cf031327-148a-49c7-a3d3-446d268ca356@infradead.org>
Date:   Tue, 26 Sep 2023 22:33:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Sep 27 (fs/proc/task_mmu.c)
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>
References: <20230927135132.4019bd9e@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230927135132.4019bd9e@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 9/26/23 20:51, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20230926:
> 
> New tree: overlayfs-fixes
> 
> The mm tree lost its build failure.
> 
> Non-merge commits (relative to Linus' tree): 7695
>  5746 files changed, 515623 insertions(+), 144460 deletions(-)
> 
> ----------------------------------------------------------------------------

on arm64:

when CONFIG_HUGETLB_PAGE is not set:

../fs/proc/task_mmu.c: In function 'pagemap_scan_thp_entry':
../fs/proc/task_mmu.c:2105:17: error: implicit declaration of function 'pagemap_scan_backout_range'; did you mean 'pagemap_scan_push_range'? [-Werror=implicit-function-declaration]
 2105 |                 pagemap_scan_backout_range(p, start, end);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
      |                 pagemap_scan_push_range
cc1: some warnings being treated as errors
aarch64-linux-ar: fs/proc/task_mmu.o: No such file or directory


-- 
~Randy
