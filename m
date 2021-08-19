Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C00C4338F
	for <linux-next@archiver.kernel.org>; Thu, 19 Aug 2021 07:02:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69CDD610A7
	for <linux-next@archiver.kernel.org>; Thu, 19 Aug 2021 07:02:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231766AbhHSHDa (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 19 Aug 2021 03:03:30 -0400
Received: from verein.lst.de ([213.95.11.211]:36299 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231722AbhHSHD3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 19 Aug 2021 03:03:29 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 7B64E67357; Thu, 19 Aug 2021 09:02:51 +0200 (CEST)
Date:   Thu, 19 Aug 2021 09:02:51 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the dma-mapping tree
Message-ID: <20210819070251.GA4521@lst.de>
References: <20210819085440.0ef51c24@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819085440.0ef51c24@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Thanks,

fixed.
