From: Trond Myklebust <trond.myklebust@fys.uio.no>
Subject: Re: linux-next: build warning after merge of the nfs tree
Date: Tue, 03 Aug 2010 22:09:21 -0400
Message-ID: <1280887762.24669.25.camel@heimdal.trondhjem.org>
References: <20100804113214.62913199.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100804113214.62913199.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, 2010-08-04 at 11:32 +1000, Stephen Rothwell wrote:
> Hi Trond,
> 
> After merging the nfs tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> fs/nfs/file.c: In function 'nfs_file_flush':
> fs/nfs/file.c:211: warning: unused variable 'ctx'
> 
> Introduced by commit 7f09dcf61bc211b0a71a5caa15ceb9b7bbec2126 ("NFS: Fix
> up the fsync code").

Hi Stephen,

Sorry. I've fixed the above warning up in today's tree.

Cheers
  Trond
