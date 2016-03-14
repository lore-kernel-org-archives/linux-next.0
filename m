From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the aio tree
Date: Tue, 15 Mar 2016 07:41:24 +1100
Message-ID: <20160315074124.2b172e0e@canb.auug.org.au>
References: <20160112164034.0fe945a7@canb.auug.org.au>
	<20160115073944.GA24382@infradead.org>
	<20160115202316.59601869@canb.auug.org.au>
	<20160115092531.GA3626@infradead.org>
	<20160115151821.GE6330@kvack.org>
	<20160116095515.4d8a2e52@canb.auug.org.au>
	<20160314154915.7d57cc32@canb.auug.org.au>
	<20160314170807.GJ17923@kvack.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41631 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750741AbcCNUl1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Mar 2016 16:41:27 -0400
In-Reply-To: <20160314170807.GJ17923@kvack.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin LaHaise <bcrl@kvack.org>
Cc: Christoph Hellwig <hch@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Al Viro <viro@ZenIV.linux.org.uk>

Hi Ben,

On Mon, 14 Mar 2016 13:08:07 -0400 Benjamin LaHaise <bcrl@kvack.org> wrote:
>
> I put in a patch to use get_user() for now since the 32 bit architectures 
> don't seem to have any plans for fixing this issue in a predictable 
> timeframe.  There shouldn't be any build failures now -- I've checked ia64, 
> i386 and x86_64.  The merge conflict looks trivial, so I won't touch 
> those pieces for the time being.

OK, thanks for the heads up.

-- 
Cheers,
Stephen Rothwell
