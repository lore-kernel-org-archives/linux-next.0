Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 454BCC4338F
	for <linux-next@archiver.kernel.org>; Tue, 24 Aug 2021 06:39:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2177A611CB
	for <linux-next@archiver.kernel.org>; Tue, 24 Aug 2021 06:39:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231279AbhHXGk2 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 24 Aug 2021 02:40:28 -0400
Received: from verein.lst.de ([213.95.11.211]:50372 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231269AbhHXGk1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 24 Aug 2021 02:40:27 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id A954167357; Tue, 24 Aug 2021 08:39:40 +0200 (CEST)
Date:   Tue, 24 Aug 2021 08:39:40 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: linux-next: manual merge of the scsi tree with the block tree
Message-ID: <20210824063940.GA24230@lst.de>
References: <20210824163215.3f08d55c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210824163215.3f08d55c@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Thanks Stephen,

the resolution looks good to me.
