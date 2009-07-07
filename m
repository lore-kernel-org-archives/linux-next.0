From: Christoph Hellwig <hch@infradead.org>
Subject: Re: linux-next: block tree build failure
Date: Tue, 7 Jul 2009 09:55:42 -0400
Message-ID: <20090707135541.GA4997@infradead.org>
References: <20090707134908.e81b1556.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:43049 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755287AbZGGNzs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 7 Jul 2009 09:55:48 -0400
Content-Disposition: inline
In-Reply-To: <20090707134908.e81b1556.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <jens.axboe@oracle.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Zhang, Yanmin" <yanmin_zhang@linux.intel.com>

On Tue, Jul 07, 2009 at 01:49:08PM +1000, Stephen Rothwell wrote:
> interacting with commit 3beab0b42413e83a7907db7176b54c840fc75a81
> ("sys_sync(): fix 16% performance regression in ffsb create_4k test")
> from Linus' tree.

Where the fuck is that patch coming from?  For one that's a horrible
patch subject and second I can't see it anywhere on -fsdevel.  We
removed that bdflush wakeup for a reason, and if it causes problems
those need to be discussed and fixed properly instead of papering over
it.
