Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1591C433E0
	for <linux-next@archiver.kernel.org>; Tue,  2 Feb 2021 06:56:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C399264EE1
	for <linux-next@archiver.kernel.org>; Tue,  2 Feb 2021 06:56:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232108AbhBBGzv (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 2 Feb 2021 01:55:51 -0500
Received: from verein.lst.de ([213.95.11.211]:44369 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232042AbhBBGzv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 Feb 2021 01:55:51 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 2D0776736F; Tue,  2 Feb 2021 07:55:08 +0100 (CET)
Date:   Tue, 2 Feb 2021 07:55:08 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.cz>,
        Christoph Hellwig <hch@lst.de>,
        David Sterba <dsterba@suse.com>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Naohiro Aota <naohiro.aota@wdc.com>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <20210202065508.GB10640@lst.de>
References: <20210202135714.6470f476@canb.auug.org.au> <20210202141618.4a3a9470@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210202141618.4a3a9470@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Both fixups look good to me, thanks.
