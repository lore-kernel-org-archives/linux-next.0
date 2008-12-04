From: Eric Sandeen <sandeen@sandeen.net>
Subject: Re: linux-next: xfs tree build failure
Date: Wed, 03 Dec 2008 23:20:10 -0600
Message-ID: <4937688A.9030607@sandeen.net>
References: <20081204101612.ec0d4d7c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from sandeen.net ([209.173.210.139]:27640 "EHLO sandeen.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752127AbYLDFzh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 4 Dec 2008 00:55:37 -0500
In-Reply-To: <20081204101612.ec0d4d7c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Chinner <david@fromorbit.com>, xfs-masters@oss.sgi.com, linux-next@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Lachlan McIlroy <lachlan@sgi.com>

Stephen Rothwell wrote:
> Hi David,
> 
> The build of next-20081203 (sh titan_defconfig, powerpc ppc6xx_defconfig,
> mips defconfig, m68k defconfig and others) failed like this:
> 
> In file included from fs/xfs/linux-2.6/xfs_file.c:40:
> fs/xfs/linux-2.6/xfs_ioctl32.h:50: error: expected specifier-qualifier-list before 'compat_time_t'
> fs/xfs/linux-2.6/xfs_ioctl32.h:79: error: expected specifier-qualifier-list before 'compat_uptr_t'
> fs/xfs/linux-2.6/xfs_ioctl32.h:94: error: expected specifier-qualifier-list before 'compat_uptr_t'
> fs/xfs/linux-2.6/xfs_ioctl32.h:131: error: expected specifier-qualifier-list before 'compat_uptr_t'
> fs/xfs/linux-2.6/xfs_ioctl32.h:142: error: expected specifier-qualifier-list before 'compat_uptr_t'
> fs/xfs/linux-2.6/xfs_ioctl32.h:152: error: expected specifier-qualifier-list before 'compat_uptr_t'
> fs/xfs/linux-2.6/xfs_ioctl32.h:161: error: expected specifier-qualifier-list before 'compat_uptr_t'
> 
> a and few other errors depending on which arch and config.
> 
> I have dropped the xfs tree for today.

My fault, grr.  Christoph sent a patch to fix it which had a problem of
its own, but the sgi guys know about it all and a fix should be in their
tree soon.  Sorry about that!

Thanks,

-Eric
