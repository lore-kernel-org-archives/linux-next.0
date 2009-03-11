From: Dave Chinner <david@fromorbit.com>
Subject: Re: linux-next: xfs tree build failure
Date: Thu, 12 Mar 2009 09:52:12 +1100
Message-ID: <20090311225212.GN26138@disturbed>
References: <20090310134547.e5d1d9ee.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ipmail04.adl2.internode.on.net ([203.16.214.57]:44731 "EHLO
	ipmail04.adl2.internode.on.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751730AbZCKW5a (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Mar 2009 18:57:30 -0400
Content-Disposition: inline
In-Reply-To: <20090310134547.e5d1d9ee.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: xfs-masters@oss.sgi.com, linux-next@vger.kernel.org

On Tue, Mar 10, 2009 at 01:45:47PM +1100, Stephen Rothwell wrote:
> Hi David,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> In file included from fs/xfs/support/debug.c:21:
> fs/xfs/xfs_error.h:137: error: expected declaration specifiers or '...' before 'xfs_mount_t'
> fs/xfs/xfs_error.h:138: error: expected ')' before '*' token
> 
> Immediate cause is commit 7bf446f8b581cef434f5ff05e8a791563bc09b7f ("xfs:
> include header files for prototypes").

Obviously nobody built this on a CONFIG_XFS_DEBUG=y kernel before
pushing it. Moving the xfs_error.h include down below all the other
includes (i.e after xfs_mount.h) will fix the problem....

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
