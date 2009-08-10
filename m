From: Trond Myklebust <trond.myklebust@fys.uio.no>
Subject: Re: linux-next: nfs tree build warning
Date: Mon, 10 Aug 2009 08:51:09 -0400
Message-ID: <1249908669.8060.3.camel@heimdal.trondhjem.org>
References: <20090810105806.266011df.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-out1.uio.no ([129.240.10.57]:54583 "EHLO mail-out1.uio.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754187AbZHJMvN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 10 Aug 2009 08:51:13 -0400
In-Reply-To: <20090810105806.266011df.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2009-08-10 at 10:58 +1000, Stephen Rothwell wrote:
> Hi Trond,
> 
> Today's linux-next build (powerpc ppc64_defconfig) produced this warning:
> 
> fs/nfs/write.c: In function 'nfs_migrate_page':
> fs/nfs/write.c:1601: warning: unused variable 'inode'
> 
> Introduced by commit 1ec000f4f76ea914aa4ac57f8cec53fa958bd477 ("NFS: Add
> a ->migratepage() aop for NFS").

Oops, you're right. I'll fix that...

Trond
