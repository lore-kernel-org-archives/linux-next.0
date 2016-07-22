From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: error fetching the y2038 tree
Date: Fri, 22 Jul 2016 21:03:26 +0200
Message-ID: <4383705.IL7BJvVHXQ@wuerfel>
References: <20160722100159.72aa6476@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:59430 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750922AbcGVTDd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 22 Jul 2016 15:03:33 -0400
In-Reply-To: <20160722100159.72aa6476@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Friday, July 22, 2016 10:01:59 AM CEST Stephen Rothwell wrote:
> Hi Arnd,
> 
> Fetching the y2038
> (git://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git#y2038)
> this morning produces this error:
> 
> fatal: Couldn't find remote ref refs/heads/y2038
> 
> I am still using the last version of this tree I fetched which contains:
> 
> 4b277763c5b3 vfs: Add support to document max and min inode times
> 0b38aceef3f3 vfs: Add vfs_time accessors
> df5999b78b01 fs: Add current_fs_time_sec() function
> 549eb7b22e24 AFS: Correctly use 64-bit time for UUID

Hi Stephen,

my mistake, I wanted to remove the contents since Deepa has done
a replacement series that obsolete three of the four patches
(Linus didn't take the branch last time).

I'll push a mainline commit to the branch instead, to make the
contents disappear from -next.

Thanks for letting me know about the problem.

	Arnd
