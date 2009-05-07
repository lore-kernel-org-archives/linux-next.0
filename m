From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: vfs tree build failure
Date: Thu, 7 May 2009 05:04:05 +0100
Message-ID: <20090507040405.GB8633@ZenIV.linux.org.uk>
References: <20090507135333.2871582a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:48840 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750812AbZEGEEH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 May 2009 00:04:07 -0400
Content-Disposition: inline
In-Reply-To: <20090507135333.2871582a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Christoph Hellwig <hch@lst.de>

On Thu, May 07, 2009 at 01:53:33PM +1000, Stephen Rothwell wrote:
> Hi Al,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> fs/cachefiles/interface.c: In function 'cachefiles_sync_cache':
> fs/cachefiles/interface.c:357: error: 'sb' undeclared (first use in this function)
> 
> Caused by commit d8f9cc04fdc69bff74a835b2895acb46cd08999b ("enforce
> ->sync_fs is only called for rw superblock").
> 
> I have used the version of the vfs tree from next-20090506 for today.

s/sb/cache->mnt->mnt_sb/ in two lines...
