Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 176CCC77B7A
	for <linux-next@archiver.kernel.org>; Tue, 13 Jun 2023 05:00:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239671AbjFMFA3 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 13 Jun 2023 01:00:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234814AbjFMFA1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Jun 2023 01:00:27 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 244ED9B;
        Mon, 12 Jun 2023 22:00:27 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 5CDFC68BEB; Tue, 13 Jun 2023 07:00:23 +0200 (CEST)
Date:   Tue, 13 Jun 2023 07:00:23 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jens Axboe <axboe@kernel.dk>, Theodore Ts'o <tytso@mit.edu>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Zhihao Cheng <chengzhihao1@huawei.com>
Subject: Re: linux-next: manual merge of the block tree with the ext4 tree
Message-ID: <20230613050023.GB13686@lst.de>
References: <20230613125408.7321db60@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613125408.7321db60@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

the merge looks good to me, thanks.

