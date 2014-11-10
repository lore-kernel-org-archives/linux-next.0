From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: linux-next: build failure after merge of the scsi tree
Date: Mon, 10 Nov 2014 07:50:16 -0800
Message-ID: <1415634616.22736.9.camel@jarvis.lan>
References: <20141110171533.63b2dfcc@canb.auug.org.au>
	 <525DB349B3FB5444AE057A887CB2A8D8D71B12@nice.asicdesigners.com>
	 <20141110134607.GA3621@lst.de> <1415632890.22736.1.camel@jarvis.lan>
	 <20141110154802.GA11895@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141110154802.GA11895@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Anish Bhatt <anish@chelsio.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Karen Xie <kxie@chelsio.com>
List-Id: linux-next.vger.kernel.org

On Mon, 2014-11-10 at 16:48 +0100, Christoph Hellwig wrote:
> On Mon, Nov 10, 2014 at 07:21:30AM -0800, James Bottomley wrote:
> > so that's adding the 3.18-incoming trees?
> 
> Not yet.  Those are for the buildbolt to find any issues before pushing
> it to the actual for-3.x branch.  It's a trick I picked up from the nfsd tree.

So your idea is Fenguang first then linux-next.

OK.

James
