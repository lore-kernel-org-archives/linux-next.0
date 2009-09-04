From: Jan Kara <jack@suse.cz>
Subject: Re: linux-next: manual merge of the xfs tree with the ext3 tree
Date: Fri, 4 Sep 2009 10:11:08 +0200
Message-ID: <20090904081108.GA19857@duck.suse.cz>
References: <20090904095500.04205407.sfr@canb.auug.org.au> <20090903235652.GA7674@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:49787 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755446AbZIDILI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 4 Sep 2009 04:11:08 -0400
Content-Disposition: inline
In-Reply-To: <20090903235652.GA7674@lst.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Chinner <david@fromorbit.com>, xfs-masters@oss.sgi.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kara <jack@suse.cz>, Felix Blyakher <felixb@sgi.com>

On Fri 04-09-09 01:56:52, Christoph Hellwig wrote:
> On Fri, Sep 04, 2009 at 09:55:00AM +1000, Stephen Rothwell wrote:
> > 218604a0bf712976171798b1dd5c44d26d6d0ea4 ("xfs: Convert sync_page_range()
> > to simple filemap_write_and_wait_range()") from the ext3 tree and commit
> > 13e6d5cdde0e785aa943810f08b801cadd0935df ("xfs: merge fsync and O_SYNC
> > handling") from the xfs tree.
> > 
> > They both do the same thing (to this bit of code) ... I used the version
> > from the xfs tree.
> 
> Yes, the xfs tree one is the better one, the one in Jan's tree only
> does about half of it.
  Should I drop the XFS chunk or will you rebase your XFS patch on top of
my patch? The latter seems safer (since my patch series won't compile
without the XFS change)...

								Honza
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
