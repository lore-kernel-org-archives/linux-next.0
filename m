From: David Sterba <dsterba@suse.cz>
Subject: Re: linux-next: manual merge of the block tree with the btrfs-kdave
 tree
Date: Fri, 18 Nov 2016 18:47:56 +0100
Message-ID: <20161118174756.GA12522@suse.cz>
References: <20161117130134.682bb6b4@canb.auug.org.au>
 <5d5a631b-e18e-aa2b-67bb-e2df6d8bef15@kernel.dk>
 <20161117132301.GA26525@lst.de>
Reply-To: dsterba@suse.cz
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:39325 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751971AbcKRRsB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 18 Nov 2016 12:48:01 -0500
Content-Disposition: inline
In-Reply-To: <20161117132301.GA26525@lst.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Nov 17, 2016 at 02:23:01PM +0100, Christoph Hellwig wrote:
> On Wed, Nov 16, 2016 at 07:49:29PM -0700, Jens Axboe wrote:
> > doesn't look correct, if bio_readpage_error() is called from the 
> > ->bi_end_io() handler. bi_size is generally zeroed at that time.
> 
> At least some of these bios are magic btrfs-internal ones that never
> reach the block layer.  But I don't think all are, and both the new
> code and one of the old cases are broken.  David, can you drop
> this one patch for now, and I'll restart the discussion on the
> failfast behavior on the btrfs list?

Ok, updated in today's for-next snapshot.
