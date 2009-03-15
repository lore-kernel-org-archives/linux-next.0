From: Dave Chinner <david@fromorbit.com>
Subject: Re: linux-next: xfs tree build failure
Date: Sun, 15 Mar 2009 23:18:26 +1100
Message-ID: <20090315121826.GA25955@disturbed>
References: <20090310134547.e5d1d9ee.sfr@canb.auug.org.au> <20090312120441.b9839805.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ipmail05.adl2.internode.on.net ([203.16.214.145]:9584 "EHLO
	ipmail05.adl2.internode.on.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754411AbZCOMSc (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sun, 15 Mar 2009 08:18:32 -0400
Content-Disposition: inline
In-Reply-To: <20090312120441.b9839805.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: xfs-masters@oss.sgi.com, linux-next@vger.kernel.org

On Thu, Mar 12, 2009 at 12:04:41PM +1100, Stephen Rothwell wrote:
> Hi David,
> 
> On Tue, 10 Mar 2009 13:45:47 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > 
> > In file included from fs/xfs/support/debug.c:21:
> > fs/xfs/xfs_error.h:137: error: expected declaration specifiers or '...' before 'xfs_mount_t'
> > fs/xfs/xfs_error.h:138: error: expected ')' before '*' token
> 
> This is still happening.

Yes, there is a reviewed patch that doesn't appear to have been
checked into the tree yet....

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
