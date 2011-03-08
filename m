From: Trond Myklebust <trond.myklebust@fys.uio.no>
Subject: Re: linux-next: build failure after merge of the nfs tree
Date: Tue, 08 Mar 2011 13:58:31 -0500
Message-ID: <1299610712.3602.15.camel@heimdal.trondhjem.org>
References: <20110308120753.8adb3ff6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-out1.uio.no ([129.240.10.57]:60429 "EHLO mail-out1.uio.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753080Ab1CHTMM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Mar 2011 14:12:12 -0500
In-Reply-To: <20110308120753.8adb3ff6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Filz <ffilzlnx@us.ibm.com>, Jeff Layton <jlayton@redhat.com>

On Tue, 2011-03-08 at 12:07 +1100, Stephen Rothwell wrote: 
> Hi Trond,
> 
> After merging the nfs tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> fs/nfs/inode.c: In function 'nfs_compat_user_ino64':
> fs/nfs/inode.c:93: error: 'compat_ulong_t' undeclared (first use in this function)
> fs/nfs/inode.c:93: error: expected ';' before 'ino'
> fs/nfs/inode.c:100: error: 'ino' undeclared (first use in this function)
> 
> Caused by commit 5fa1ca22302da56ffa568e847100e80be90cc602 ("(try3-resend)
> Fix nfs_compat_user_ino64 so it doesn't cause problems if bit 31 or 63
> are set in fileid").
> 
> I have used the nfs tree from next-20110307 for today.

Thanks Stephen!

It looks to me as if we need to add a '#include <compat.h>'. I'll fix up
the patch...

Cheers
  Trond
