From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: manual merge of the block tree with the s390 tree
Date: Tue, 13 Jun 2017 08:20:55 +0200
Message-ID: <20170613062055.GA30813@lst.de>
References: <20170613130649.6bcede94@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:53533 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752601AbdFMGU5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Jun 2017 02:20:57 -0400
Content-Disposition: inline
In-Reply-To: <20170613130649.6bcede94@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Sebastian Ott <sebott@linux.vnet.ibm.com>

Btw, scm_blk.c blk-mq conversion seems odd if not broken.  It should
always call blk_mq_complete_request from scm_request_finish and
then pass the error to blk_mq_end_request frin
there.

It would be great if such major block driver changes were Cc'ed to
linux-block.
