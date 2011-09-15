From: Christoph Hellwig <hch@infradead.org>
Subject: Re: linux-next: manual merge of the xfs tree with Linus' tree
Date: Thu, 15 Sep 2011 07:05:27 -0400
Message-ID: <20110915110527.GA5955@infradead.org>
References: <20110915123031.104554f51c7642451fc31434@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 173-166-109-252-newengland.hfc.comcastbusiness.net ([173.166.109.252]:35383
	"EHLO bombadil.infradead.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S933075Ab1IOLFg (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 15 Sep 2011 07:05:36 -0400
Content-Disposition: inline
In-Reply-To: <20110915123031.104554f51c7642451fc31434@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Chinner <david@fromorbit.com>, xfs-masters@oss.sgi.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>

On Thu, Sep 15, 2011 at 12:30:31PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the xfs tree got a conflict in
> fs/xfs/xfs_aops.c between commit 2d2422aebc03 ("xfs: fix a use after free
> in xfs_end_io_direct_write") from Linus' tree and commit a826361aa4af
> ("xfs: defer AIO/DIO completions") from the xfs tree.
> 
> The latter moves this code to another function (better solution?), so I
> used the latter version.

Yes, the mainline version is a quick fix for the use after free, the
linux-next version fixes this by changing the broader scope.
