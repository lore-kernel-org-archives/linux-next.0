Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80DCAC433E0
	for <linux-next@archiver.kernel.org>; Fri,  5 Mar 2021 07:46:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4452264F44
	for <linux-next@archiver.kernel.org>; Fri,  5 Mar 2021 07:46:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbhCEHqc (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 5 Mar 2021 02:46:32 -0500
Received: from verein.lst.de ([213.95.11.211]:45108 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229446AbhCEHqc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 5 Mar 2021 02:46:32 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 923F068B05; Fri,  5 Mar 2021 08:46:29 +0100 (CET)
Date:   Fri, 5 Mar 2021 08:46:29 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Daniel Wagner <dwagner@suse.de>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20210305074629.GB17414@lst.de>
References: <20210305105239.377577b5@canb.auug.org.au> <726a90e9-7139-8d0c-6e05-fcf8c15ac6ca@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <726a90e9-7139-8d0c-6e05-fcf8c15ac6ca@kernel.dk>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Mar 04, 2021 at 05:26:42PM -0700, Jens Axboe wrote:
> Christoph, since there's multiple commits with issues, mind resending
> a fixed branch? Then I'll drop the one I pulled today.

I've fixed the commit id and dropped the patch without the author
signoff, but your branch still has the current patches.
