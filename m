From: Dave Chinner <david@fromorbit.com>
Subject: Re: linux-next: Tree for December 18 (patch: kernel-doc notation)
Date: Fri, 19 Dec 2008 21:39:38 +1100
Message-ID: <20081219103938.GD17177@disturbed>
References: <20081218230637.c879a046.sfr@canb.auug.org.au> <20081218161437.fe2d2675.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ipmail05.adl2.internode.on.net ([203.16.214.145]:32284 "EHLO
	ipmail05.adl2.internode.on.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752567AbYLSKjp (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 19 Dec 2008 05:39:45 -0500
Content-Disposition: inline
In-Reply-To: <20081218161437.fe2d2675.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, akpm <akpm@linux-foundation.org>

On Thu, Dec 18, 2008 at 04:14:37PM -0800, Randy Dunlap wrote:
> fs/inode.c and mm/filemap.c need kernel-doc fixes.
> 
> What tree were these merged into for linux-next?

The fs/inode.c one ended up going through the XFS tree because
of the XFs code dependent on it....

> How do I get these doc fixes merged?  (2 patches below)

Perhaps best to go through the VFS tree for fs/inode.c changes.

> ---
> 
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Fix fs/inode.c kernel-doc function parameters:
> 
> Warning(linux-next-20081218//fs/inode.c:120): No description found for parameter 'sb'
> Warning(linux-next-20081218//fs/inode.c:120): No description found for parameter 'inode'
> Warning(linux-next-20081218//fs/inode.c:588): No description found for parameter 'sb'
> Warning(linux-next-20081218//fs/inode.c:588): No description found for parameter 'inode'
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> cc: Dave Chinner <david@fromorbit.com>

Looks fine to me.

Reviewed-by: Dave Chinner <david@fromorbit.com>

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
