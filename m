From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [bug?] bio: add experimental support for inlining a number of
 bio_vecs inside the bio
Date: Wed, 10 Dec 2008 13:13:11 -0800
Message-ID: <20081210131311.e03d6fc5.akpm@linux-foundation.org>
References: <20081210164659.9ebb8158.sfr@canb.auug.org.au>
	<20081210183059.4FD6.KOSAKI.MOTOHIRO@jp.fujitsu.com>
	<20081210204630.4FE3.KOSAKI.MOTOHIRO@jp.fujitsu.com>
	<20081210121237.GQ23742@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:43412 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754795AbYLJVNZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Dec 2008 16:13:25 -0500
In-Reply-To: <20081210121237.GQ23742@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: kosaki.motohiro@jp.fujitsu.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 10 Dec 2008 13:12:38 +0100
Jens Axboe <jens.axboe@oracle.com> wrote:

> > experimental??
> 
> Experimental in the sense that it's the first version, not the concept.
> It's held up well for me, but just yesterday I received the first bug
> report on a ppc platform and now you have this on ia64.


Well there's another bug report up-list.  "next-20081209: pdflush: page
allocation failure (xfs)".

The clearing of (__GFP_WAIT | __GFP_IO) will call the page allocator in the
weakest possible mode and will of course spew page allocations warnings
with great frequency.  It should at least add in __GFP_NOWARN.
