From: Trond Myklebust <trond.myklebust@fys.uio.no>
Subject: Re: linux-next: build failure after merge of the  tree (nfs tree
 related)
Date: Mon, 27 Sep 2010 07:47:35 -0400
Message-ID: <1285588055.19362.7.camel@heimdal.trondhjem.org>
References: <20100927152304.a6463447.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-out2.uio.no ([129.240.10.58]:38770 "EHLO mail-out2.uio.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752658Ab0I0MLx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Sep 2010 08:11:53 -0400
In-Reply-To: <20100927152304.a6463447.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bryan Schumaker <bjschuma@netapp.com>

On Mon, 2010-09-27 at 15:23 +1000, Stephen Rothwell wrote:
> Hi Trond,
> 
> After merging the final tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> fs/nfs/dir.c: In function 'nfs_readdir_free_large_page':
> fs/nfs/dir.c:464: error: implicit declaration of function 'vm_unmap_ram'
> fs/nfs/dir.c: In function 'nfs_readdir_large_page':
> fs/nfs/dir.c:485: error: implicit declaration of function 'vm_map_ram'
> fs/nfs/dir.c:485: warning: assignment makes pointer from integer without a cast
> 
> Caused by commit 2af4eb9746092aab7811b5b581d004049c068a02 ("NFS: readdir
> with vmapped pages").
> 
> I have reverted that commit for today.

Agreed: fs/nfs/dir.c needs to #include <vmalloc.h> in order to use those
functions. Bryan, can you please fix that up?

Thanks Stephen!
  Trond
