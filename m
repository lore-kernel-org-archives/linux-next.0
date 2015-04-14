From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: manual merge of the vfs tree with the ext4 tree
Date: Tue, 14 Apr 2015 18:18:41 +0200
Message-ID: <20150414161841.GA8479@lst.de>
References: <20150407140035.60d2053d@canb.auug.org.au> <20150407070214.GA7074@lst.de> <20150408032646.GE21171@thunk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:38608 "EHLO newverein.lst.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932769AbbDNQSn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Apr 2015 12:18:43 -0400
Content-Disposition: inline
In-Reply-To: <20150408032646.GE21171@thunk.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Theodore Ts'o <tytso@mit.edu>, Christoph Hellwig <hch@lst.de>, Stephen Rothwell <sfr@canb.auug.org.au>, Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sheng Yong <shengyong1@huawei.com>

On Tue, Apr 07, 2015 at 11:26:46PM -0400, Theodore Ts'o wrote:
> On Tue, Apr 07, 2015 at 09:02:14AM +0200, Christoph Hellwig wrote:
> > FYI, the ext4 tree seems to have the crypto support, which I don't think is
> > ready for 4.1 with all the implications of it..
> 
> What sort of implications are you concerned about?  We're no longer
> exposing anything via the xattr interface, and all of the changes are
> not contained strictly within the ext4 tree.
> 
> There are still are some cleanups which I'm still in the process of
> applying, but I considered it more likely than not something that was
> ready for 4.1, so that's why I let it go into the ext4 dev branch for
> testing in linux-next.

A far as I can tell the patches were just posted last week, and it's
still under very active review.  Also for something that while only
implemented in one filesystem has pretty broad API implications I'd
really expect a generalist VFS review (I plan to get to it ASAP..).
