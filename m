From: Changman Lee <cm224.lee@samsung.com>
Subject: Re: linux-next: Tree for Dec 26 (f2fs)
Date: Mon, 29 Dec 2014 07:52:53 +0900
Message-ID: <20141228225253.GG3335@lcm>
References: <20141226193009.60d3f62e@canb.auug.org.au>
 <549DB43B.7050902@infradead.org> <20141226205822.GA21870@jaegeuk-mac02>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:31011 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751496AbaL1WyH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 28 Dec 2014 17:54:07 -0500
Content-disposition: inline
In-reply-to: <20141226205822.GA21870@jaegeuk-mac02>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Dec 26, 2014 at 12:59:05PM -0800, Jaegeuk Kim wrote:
> I fixed the merged patch directly.
> 
> Changman,
> The patch was initially made by you, so let me know, if you have objection.
> 
> Thanks,

Sorry for my mistake.
Thanks, Stephen and Jaegeuk.

> 
> On Fri, Dec 26, 2014 at 11:17:15AM -0800, Randy Dunlap wrote:
> > On 12/26/14 00:30, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > There will only be intermittent releases of linux-next between now and
> > > Jan 5.
> > > 
> > > Changes since 20141221:
> > > 
> > 
> > on x86_64:
> > when CONFIG_F2FS_STAT_FS is not enabled:
> > 
> > ../fs/f2fs/segment.c: In function 'rewrite_data_page':
> > ../fs/f2fs/segment.c:1233:2: error: implicit declaration of function 'stat_inc_inplace_blocks' [-Werror=implicit-function-declaration]
> > 
> > 
> > 
> > -- 
> > ~Randy
