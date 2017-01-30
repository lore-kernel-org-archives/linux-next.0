From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Mon, 30 Jan 2017 07:34:57 +0100
Message-ID: <20170130063457.GA2592@lst.de>
References: <20170130124350.36a57549@canb.auug.org.au> <5f2da80f-c6fe-8c45-0e56-819aae7d925c@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:47500 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751922AbdA3GnW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Jan 2017 01:43:22 -0500
Content-Disposition: inline
In-Reply-To: <5f2da80f-c6fe-8c45-0e56-819aae7d925c@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

On Sun, Jan 29, 2017 at 06:53:42PM -0700, Jens Axboe wrote:
> Huh, I wonder how that snuck past my allmodconfig builds, that looks
> like a clear failure.

I also did tons of test builds and never saw it, not sure why
the NVMe-SCSI code still someone how an implicit include of scsi_cmnd.h.

But in the end it should not be using the defintion anyway, and I sent
a patch on Saturday so that it doesn't:

	[PATCH 1/5] nvme/scsi: don't rely on BLK_MAX_CDB

might make sense to expedite that.
