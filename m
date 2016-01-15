From: Christoph Hellwig <hch@infradead.org>
Subject: Re: linux-next: build failure after merge of the aio tree
Date: Fri, 15 Jan 2016 01:25:31 -0800
Message-ID: <20160115092531.GA3626@infradead.org>
References: <20160112164034.0fe945a7@canb.auug.org.au>
 <20160115073944.GA24382@infradead.org>
 <20160115202316.59601869@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:55572 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755312AbcAOJZd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 15 Jan 2016 04:25:33 -0500
Content-Disposition: inline
In-Reply-To: <20160115202316.59601869@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Hellwig <hch@infradead.org>, Benjamin LaHaise <bcrl@kvack.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jan 15, 2016 at 08:23:16PM +1100, Stephen Rothwell wrote:
> Via the aio tree (git://git.kvack.org/~bcrl/aio-next.git#master) added
> in July 2013 at Ben's request.  The code was added to the aio tree in
> Jan 12 (my time), but has never been in a published linux-next tree due
> to the above build problem (I back out to the previous days version of
> the aio tree).

Well, it's code Ben posted a few days ago, which to say it mildly is
rather controversial.  It's cetainly not 4.5 material.

> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
---end quoted text---
