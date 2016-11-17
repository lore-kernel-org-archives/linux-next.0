From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: manual merge of the block tree with the
        btrfs-kdave tree
Date: Thu, 17 Nov 2016 14:23:01 +0100
Message-ID: <20161117132301.GA26525@lst.de>
References: <20161117130134.682bb6b4@canb.auug.org.au> <5d5a631b-e18e-aa2b-67bb-e2df6d8bef15@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5d5a631b-e18e-aa2b-67bb-e2df6d8bef15@kernel.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Sterba <dsterba@suse.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

On Wed, Nov 16, 2016 at 07:49:29PM -0700, Jens Axboe wrote:
> doesn't look correct, if bio_readpage_error() is called from the 
> ->bi_end_io() handler. bi_size is generally zeroed at that time.

At least some of these bios are magic btrfs-internal ones that never
reach the block layer.  But I don't think all are, and both the new
code and one of the old cases are broken.  David, can you drop
this one patch for now, and I'll restart the discussion on the
failfast behavior on the btrfs list?
