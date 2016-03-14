From: Benjamin LaHaise <bcrl@kvack.org>
Subject: Re: linux-next: build failure after merge of the aio tree
Date: Mon, 14 Mar 2016 13:08:07 -0400
Message-ID: <20160314170807.GJ17923@kvack.org>
References: <20160112164034.0fe945a7@canb.auug.org.au> <20160115073944.GA24382@infradead.org> <20160115202316.59601869@canb.auug.org.au> <20160115092531.GA3626@infradead.org> <20160115151821.GE6330@kvack.org> <20160116095515.4d8a2e52@canb.auug.org.au> <20160314154915.7d57cc32@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kanga.kvack.org ([205.233.56.17]:51784 "EHLO kanga.kvack.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752022AbcCNRII (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Mar 2016 13:08:08 -0400
Content-Disposition: inline
In-Reply-To: <20160314154915.7d57cc32@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Hellwig <hch@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Al Viro <viro@ZenIV.linux.org.uk>

On Mon, Mar 14, 2016 at 03:49:15PM +1100, Stephen Rothwell wrote:
> Hi Ben,

...
> OK, so at this point (just to get rid of the build failure I have done this:
...
> Well, you need to negotiate that with the affected architectures.

I put in a patch to use get_user() for now since the 32 bit architectures 
don't seem to have any plans for fixing this issue in a predictable 
timeframe.  There shouldn't be any build failures now -- I've checked ia64, 
i386 and x86_64.  The merge conflict looks trivial, so I won't touch 
those pieces for the time being.

		-ben
-- 
"Thought is the essence of where you are now."
