Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2691EEB64DC
	for <linux-next@archiver.kernel.org>; Tue, 27 Jun 2023 06:38:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbjF0Gh7 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 27 Jun 2023 02:37:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbjF0Gh6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 27 Jun 2023 02:37:58 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58C619F;
        Mon, 26 Jun 2023 23:37:57 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id D01606732D; Tue, 27 Jun 2023 08:37:53 +0200 (CEST)
Date:   Tue, 27 Jun 2023 08:37:53 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Theodore Ts'o <tytso@mit.edu>, Chao Yu <chao@kernel.org>,
        Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the ext4 tree with Linus' tree
Message-ID: <20230627063753.GA18674@lst.de>
References: <20230627103900.04fa564f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627103900.04fa564f@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jun 27, 2023 at 10:39:00AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the ext4 tree got a conflict in:
> 
>   fs/ext4/ioctl.c
> 
> between commit:
> 
>   97524b454bc5 ("ext4: split ext4_shutdown")
> 
> from Linus' tree and commit:
> 
>   c4d13222afd8 ("ext4: fix to check return value of freeze_bdev() in ext4_shutdown()")

Hmm, I can't actually find the latter commit in linux-next and the context
below also doesn't make it obviously cler to me what the conflict was.
