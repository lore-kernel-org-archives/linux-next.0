From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: manual merge of the xfs tree with the ext3 tree
Date: Fri, 4 Sep 2009 01:56:52 +0200
Message-ID: <20090903235652.GA7674@lst.de>
References: <20090904095500.04205407.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.210]:35852 "EHLO verein.lst.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752169AbZICX5G (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Sep 2009 19:57:06 -0400
Content-Disposition: inline
In-Reply-To: <20090904095500.04205407.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Chinner <david@fromorbit.com>, xfs-masters@oss.sgi.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, Felix Blyakher <felixb@sgi.com>

On Fri, Sep 04, 2009 at 09:55:00AM +1000, Stephen Rothwell wrote:
> 218604a0bf712976171798b1dd5c44d26d6d0ea4 ("xfs: Convert sync_page_range()
> to simple filemap_write_and_wait_range()") from the ext3 tree and commit
> 13e6d5cdde0e785aa943810f08b801cadd0935df ("xfs: merge fsync and O_SYNC
> handling") from the xfs tree.
> 
> They both do the same thing (to this bit of code) ... I used the version
> from the xfs tree.

Yes, the xfs tree one is the better one, the one in Jan's tree only
does about half of it.
