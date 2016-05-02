From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for May 2   [WARNING: at fs/dcache.c]
Date: Mon, 2 May 2016 22:07:45 +1000
Message-ID: <20160502220745.44c4bd91@canb.auug.org.au>
References: <20160502184018.502e9e7c@canb.auug.org.au>
	<20160502101524.GA417@swordfish>
	<20160502103352.x4thudsnc3jhexzo@mguzik>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60122 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752126AbcEBMHs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 May 2016 08:07:48 -0400
In-Reply-To: <20160502103352.x4thudsnc3jhexzo@mguzik>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mateusz Guzik <mguzik@redhat.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Theodore Ts'o <tytso@mit.edu>, Miklos Szeredi <mszeredi@redhat.com>

Hi Mateusz,

On Mon, 2 May 2016 12:33:54 +0200 Mateusz Guzik <mguzik@redhat.com> wrote:
>
> On Mon, May 02, 2016 at 07:15:24PM +0900, Sergey Senozhatsky wrote:
> > On (05/02/16 18:40), Stephen Rothwell wrote:  
> > > Hi all,
> > > 
> > > Changes since 20160429  
> > 
> > Hello,
> > 
> > [    0.368791] ------------[ cut here ]------------
> > [    0.368850] WARNING: CPU: 0 PID: 1 at fs/dcache.c:1688 d_set_d_op+0x5e/0xcc
> > [    0.368911] Modules linked in:
> > [    0.369002] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.6.0-rc6-next-20160502-dbg-00005-gf58c9da-dirty #404
> > [    0.369161]  0000000000000000 ffff880133067908 ffffffff811b8202 0000000000000000
> > [    0.369371]  0000000000000000 ffff880133067948 ffffffff81039365 00000698e5dffe26
> > [    0.369580]  ffff880132c090c0 ffffffff81613680 ffff880132c040a0 ffff880132c08000
> > [    0.369791] Call Trace:
> > [    0.369846]  [<ffffffff811b8202>] dump_stack+0x4d/0x63
> > [    0.369904]  [<ffffffff81039365>] __warn+0xb8/0xd3
> > [    0.369962]  [<ffffffff810393e6>] warn_slowpath_null+0x18/0x1a
> > [    0.370021]  [<ffffffff811012f6>] d_set_d_op+0x5e/0xcc
> > [    0.370079]  [<ffffffff8110d887>] simple_lookup+0x2e/0x45  
> 
> The issue is that 2 macros have the same value:
> 
> #define DCACHE_OP_REAL                  0x08000000
> 
> #define DCACHE_PAR_LOOKUP               0x08000000 /* being looked up
> (with parent locked shared) */
> 
> Verified with switching one to 0x10000000 and the warning went away.

This comes from a bad automatic merge resolution between commit

  d101a125954e ("fs: add file_dentry()")

from Linus' tree (introduced before v4.5-rc3) and commit

  340450a54573 ("beginning of transition to parallel lookups - marking in-lookup dentries")

from the vfs tree.

I will fix this up in tomorrow's tree (unless Al beats me to it).

-- 
Cheers,
Stephen Rothwell
