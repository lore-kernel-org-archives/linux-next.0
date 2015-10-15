From: Dave Chinner <david@fromorbit.com>
Subject: Re: linux-next: Tree for Oct 15 (xfs)
Date: Fri, 16 Oct 2015 06:42:32 +1100
Message-ID: <20151015194232.GS31326@dastard>
References: <20151015185150.76cecc3e@canb.auug.org.au>
 <561FE8A7.8070803@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ipmail07.adl2.internode.on.net ([150.101.137.131]:20016 "EHLO
	ipmail07.adl2.internode.on.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751268AbbJOTmr (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 15 Oct 2015 15:42:47 -0400
Content-Disposition: inline
In-Reply-To: <561FE8A7.8070803@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, xfs@oss.sgi.com

On Thu, Oct 15, 2015 at 10:55:51AM -0700, Randy Dunlap wrote:
> On 10/15/15 00:51, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20151013:
> > 
> 
> on x86_64:
> 
> fs/built-in.o: In function `xfs_free_ag_extent':
> xfs_alloc.c:(.text+0x1f36a0): undefined reference to `xfsstats'

Already been reported and fixed, just haven't pushed the patch yet.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
