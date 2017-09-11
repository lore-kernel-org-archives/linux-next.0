From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] string.h: un-fortify memcpy_and_pad
Date: Mon, 11 Sep 2017 13:57:25 +0200
Message-ID: <20170911115725.GB21472@lst.de>
References: <20170831182101.0e4ad9a2@canb.auug.org.au> <20170906123657.25534-1-mwilck@suse.com> <1505123078.4683.5.camel@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:45977 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750965AbdIKL50 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 11 Sep 2017 07:57:26 -0400
Content-Disposition: inline
In-Reply-To: <1505123078.4683.5.camel@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Martin Wilck <mwilck@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Andrew Morton <akpm@linux-foundation.org>, linux-nvme@lists.infradead.org, jthumshirn@suse.com, arnd@arndb.de

> Hello Stephen and Christoph,
> 
> my broken patch 01f33c336e2d is in Linus' tree and causing compiler
> warnings there. Could you please take care that this fix is pulled in
> on top of it? Or should I take another action myself?

string.h is a bit of a maintainers no mans land.  Given that the
problematic commit came in through the nvme tree I've applied your
patch and will sned it to Jens with the next batch of nvme updates
tonight.
