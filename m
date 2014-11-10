From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build failure after merge of the scsi tree
Date: Mon, 10 Nov 2014 16:48:02 +0100
Message-ID: <20141110154802.GA11895@lst.de>
References: <20141110171533.63b2dfcc@canb.auug.org.au> <525DB349B3FB5444AE057A887CB2A8D8D71B12@nice.asicdesigners.com> <20141110134607.GA3621@lst.de> <1415632890.22736.1.camel@jarvis.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1415632890.22736.1.camel@jarvis.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Christoph Hellwig <hch@lst.de>, Anish Bhatt <anish@chelsio.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Karen Xie <kxie@chelsio.com>
List-Id: linux-next.vger.kernel.org

On Mon, Nov 10, 2014 at 07:21:30AM -0800, James Bottomley wrote:
> so that's adding the 3.18-incoming trees?

Not yet.  Those are for the buildbolt to find any issues before pushing
it to the actual for-3.x branch.  It's a trick I picked up from the nfsd tree.
