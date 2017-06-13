From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the block tree with the s390 tree
Date: Tue, 13 Jun 2017 16:28:27 +1000
Message-ID: <20170613162827.3db67f6b@canb.auug.org.au>
References: <20170613130649.6bcede94@canb.auug.org.au>
        <20170613062055.GA30813@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55191 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752160AbdFMG23 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Jun 2017 02:28:29 -0400
In-Reply-To: <20170613062055.GA30813@lst.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sebastian Ott <sebott@linux.vnet.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>

Hi Christoph,

On Tue, 13 Jun 2017 08:20:55 +0200 Christoph Hellwig <hch@lst.de> wrote:
>
> Btw, scm_blk.c blk-mq conversion seems odd if not broken.  It should
> always call blk_mq_complete_request from scm_request_finish and
> then pass the error to blk_mq_end_request frin
> there.
> 
> It would be great if such major block driver changes were Cc'ed to
> linux-block.

And I missed cc'ing the s390 guys with my report :-(

-- 
Cheers,
Stephen Rothwell
