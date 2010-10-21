From: Trond Myklebust <trond.myklebust@fys.uio.no>
Subject: Re: linux-next: build failure after merge of the nfs tree
Date: Thu, 21 Oct 2010 10:33:47 -0400
Message-ID: <1287671627.3645.13.camel@heimdal.trondhjem.org>
References: <20101021113858.f8b9849f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20101021113858.f8b9849f.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bryan Schumaker <bjschuma@netapp.com>
List-Id: linux-next.vger.kernel.org

On Thu, 2010-10-21 at 11:38 +1100, Stephen Rothwell wrote:
> Hi Trond,
> 
> After merging the nfs tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> fs/nfs/dir.c: In function 'nfs_readdir_free_large_page':
> fs/nfs/dir.c:475: error: implicit declaration of function 'vm_unmap_ram'
> fs/nfs/dir.c: In function 'nfs_readdir_large_page':
> fs/nfs/dir.c:496: error: implicit declaration of function 'vm_map_ram'
> fs/nfs/dir.c:496: warning: assignment makes pointer from integer without a cast
> 
> Caused by commit b8aa6064474e186f598584508f9230d49a0004af ("NFS: readdir
> with vmapped pages").  Forgot to include linux/vmalloc.h.  See Rule 1 (in
> Documentation/SubmitChecklist).
> 
> I have used the nfs tree from next-20101020 for today.

Thanks Stephen! Fixed in my linux-next branch.

Bryan, please make sure that you update your patches.

Cheers
  Trond
