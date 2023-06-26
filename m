Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F2DEB64DA
	for <linux-next@archiver.kernel.org>; Mon, 26 Jun 2023 08:00:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbjFZIAX (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 26 Jun 2023 04:00:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjFZIAW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 26 Jun 2023 04:00:22 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BA0910F;
        Mon, 26 Jun 2023 01:00:22 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 35B1B68AFE; Mon, 26 Jun 2023 10:00:16 +0200 (CEST)
Date:   Mon, 26 Jun 2023 10:00:15 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jens Axboe <axboe@kernel.dk>, Theodore Ts'o <tytso@mit.edu>,
        Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Zhihao Cheng <chengzhihao1@huawei.com>
Subject: Re: linux-next: manual merge of the block tree with the ext4 tree
Message-ID: <20230626080015.GA26979@lst.de>
References: <20230626130951.54c4254a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230626130951.54c4254a@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Thanks Stephen,

the merge looks good to me.
