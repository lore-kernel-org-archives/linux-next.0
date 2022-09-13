Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC96AC6FA82
	for <linux-next@archiver.kernel.org>; Tue, 13 Sep 2022 04:09:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbiIMEJf (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 13 Sep 2022 00:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbiIMEJe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Sep 2022 00:09:34 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE959B31;
        Mon, 12 Sep 2022 21:09:32 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id D9C0968AFE; Tue, 13 Sep 2022 06:09:28 +0200 (CEST)
Date:   Tue, 13 Sep 2022 06:09:28 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        Liu Shixin <liushixin2@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the
 mm-hotfixes tree
Message-ID: <20220913040928.GA28590@lst.de>
References: <20220913070410.7468b763@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913070410.7468b763@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Sep 13, 2022 at 07:04:10AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   c3bc4e30a601 ("frontswap: don't call ->init if no ops are registered")
> 
> is missing a Signed-off-by from its author.

Here we go:

Signed-off-by: Christoph Hellwig <hch@lst.de>
