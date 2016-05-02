From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: linux-next: Tree for May 2   [WARNING: at fs/dcache.c]
Date: Mon, 2 May 2016 22:15:39 +0900
Message-ID: <20160502131539.GA626@swordfish>
References: <20160502184018.502e9e7c@canb.auug.org.au>
 <20160502101524.GA417@swordfish>
 <20160502103352.x4thudsnc3jhexzo@mguzik>
 <20160502220745.44c4bd91@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f172.google.com ([209.85.192.172]:33880 "EHLO
	mail-pf0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752231AbcEBMSE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 May 2016 08:18:04 -0400
Content-Disposition: inline
In-Reply-To: <20160502220745.44c4bd91@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mateusz Guzik <mguzik@redhat.com>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Theodore Ts'o <tytso@mit.edu>, Miklos Szeredi <mszeredi@redhat.com>

On (05/02/16 22:07), Stephen Rothwell wrote:
[..]
> > The issue is that 2 macros have the same value:
> > 
> > #define DCACHE_OP_REAL                  0x08000000
> > 
> > #define DCACHE_PAR_LOOKUP               0x08000000 /* being looked up
> > (with parent locked shared) */
> > 
> > Verified with switching one to 0x10000000 and the warning went away.
> 
> This comes from a bad automatic merge resolution between commit
> 
>   d101a125954e ("fs: add file_dentry()")
> 
> from Linus' tree (introduced before v4.5-rc3) and commit
> 
>   340450a54573 ("beginning of transition to parallel lookups - marking in-lookup dentries")
> 
> from the vfs tree.
> 
> I will fix this up in tomorrow's tree (unless Al beats me to it).

good find, Mateusz.
thanks to both of you.

	-ss
