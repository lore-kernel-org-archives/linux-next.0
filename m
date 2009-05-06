From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: Tree for May 6 (fs/quota)
Date: Wed, 6 May 2009 17:08:22 +0100
Message-ID: <20090506160822.GV8633@ZenIV.linux.org.uk>
References: <20090506172653.2f1bbedd.sfr@canb.auug.org.au> <4A01B54D.90301@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:44941 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753184AbZEFQI2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 May 2009 12:08:28 -0400
Content-Disposition: inline
In-Reply-To: <4A01B54D.90301@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jan Kara <jack@suse.cz>

On Wed, May 06, 2009 at 09:05:33AM -0700, Randy Dunlap wrote:
> Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20090505:
> 
> 
> When
> # CONFIG_QUOTA is not set
> CONFIG_QUOTACTL=y
> CONFIG_XFS_QUOTA=y
> 
> fs/quota/quota.c:163: error: redefinition of 'sync_quota_sb'
> include/linux/quotaops.h:338: error: previous definition of 'sync_quota_sb' was here

All fixed in current for-next in vfs tree (3 patches from Alexander Beregalov).
