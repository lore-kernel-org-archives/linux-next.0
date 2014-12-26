From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Dec 26 (f2fs)
Date: Fri, 26 Dec 2014 11:17:15 -0800
Message-ID: <549DB43B.7050902@infradead.org>
References: <20141226193009.60d3f62e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:53744 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751274AbaLZTRR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 26 Dec 2014 14:17:17 -0500
In-Reply-To: <20141226193009.60d3f62e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>, Changman Lee <cm224.lee@samsung.com>

On 12/26/14 00:30, Stephen Rothwell wrote:
> Hi all,
> 
> There will only be intermittent releases of linux-next between now and
> Jan 5.
> 
> Changes since 20141221:
> 

on x86_64:
when CONFIG_F2FS_STAT_FS is not enabled:

../fs/f2fs/segment.c: In function 'rewrite_data_page':
../fs/f2fs/segment.c:1233:2: error: implicit declaration of function 'stat_inc_inplace_blocks' [-Werror=implicit-function-declaration]



-- 
~Randy
