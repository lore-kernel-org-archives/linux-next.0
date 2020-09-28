Return-Path: <SRS0=aXXK=DF=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B2CC2D0A8
	for <linux-next@archiver.kernel.org>; Mon, 28 Sep 2020 06:04:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B93E207E8
	for <linux-next@archiver.kernel.org>; Mon, 28 Sep 2020 06:04:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgI1GEa (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 28 Sep 2020 02:04:30 -0400
Received: from verein.lst.de ([213.95.11.211]:34284 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726412AbgI1GEa (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Sep 2020 02:04:30 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 2080867373; Mon, 28 Sep 2020 08:04:27 +0200 (CEST)
Date:   Mon, 28 Sep 2020 08:04:27 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Christoph Hellwig <hch@lst.de>,
        Paul Cercueil <paul@crapouillou.net>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm tree
Message-ID: <20200928060427.GA15041@lst.de>
References: <20200928135405.73404219@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200928135405.73404219@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 28, 2020 at 01:54:05PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:

The driver needs to switch do dma_alloc_noncoherent + dma_sync_single*
like the other drivers converted in the dma tree.  Paul, let me know if
you have any questions.
