From: Jaegeuk Kim <jaegeuk@kernel.org>
Subject: Re: linux-next: Tree for Dec 26 (f2fs)
Date: Fri, 26 Dec 2014 12:59:05 -0800
Message-ID: <20141226205822.GA21870@jaegeuk-mac02>
References: <20141226193009.60d3f62e@canb.auug.org.au>
 <549DB43B.7050902@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.19.201]:56353 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751173AbaLZU7W (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 26 Dec 2014 15:59:22 -0500
Content-Disposition: inline
In-Reply-To: <549DB43B.7050902@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Changman Lee <cm224.lee@samsung.com>

I fixed the merged patch directly.

Changman,
The patch was initially made by you, so let me know, if you have objection.

Thanks,

On Fri, Dec 26, 2014 at 11:17:15AM -0800, Randy Dunlap wrote:
> On 12/26/14 00:30, Stephen Rothwell wrote:
> > Hi all,
> > 
> > There will only be intermittent releases of linux-next between now and
> > Jan 5.
> > 
> > Changes since 20141221:
> > 
> 
> on x86_64:
> when CONFIG_F2FS_STAT_FS is not enabled:
> 
> ../fs/f2fs/segment.c: In function 'rewrite_data_page':
> ../fs/f2fs/segment.c:1233:2: error: implicit declaration of function 'stat_inc_inplace_blocks' [-Werror=implicit-function-declaration]
> 
> 
> 
> -- 
> ~Randy
