From: Trond Myklebust <trond.myklebust@fys.uio.no>
Subject: Re: linux-next: build failure after merge of the nfs tree
Date: Thu, 12 May 2011 11:11:21 -0400
Message-ID: <1305213081.15566.2.camel@lade.trondhjem.org>
References: <20110512111255.95a765aa.sfr@au.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-out1.uio.no ([129.240.10.57]:60182 "EHLO mail-out1.uio.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755474Ab1ELP0A (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 May 2011 11:26:00 -0400
In-Reply-To: <20110512111255.95a765aa.sfr@au.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@au1.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2011-05-12 at 11:12 +1000, Stephen Rothwell wrote:
> Hi Trond,
> 
> After merging the nfs tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> fs/nfs/write.c: In function 'nfs_flush_multi':
> fs/nfs/write.c:942: error: too many arguments to function 'pnfs_update_layout'
> fs/nfs/write.c: In function 'nfs_flush_one':
> fs/nfs/write.c:1016: error: too many arguments to function 'pnfs_update_layout'
> fs/nfs/read.c: In function 'nfs_pagein_multi':
> fs/nfs/read.c:291: error: too many arguments to function 'pnfs_update_layout'
> fs/nfs/read.c: In function 'nfs_pagein_one':
> fs/nfs/read.c:354: error: too many arguments to function 'pnfs_update_layout'
> 
> Cased by commit 4b386a0fe47b ("NFSv4.1: Ensure that layoutget uses the
> correct gfp modes") which forgot to update the function declaration for
> the !CONFIG_NFS_V4_1 case.
> 
> I have used the nfs tree from next-20110511 for today.

Hi Stephen,

Sorry about that. I thought I had found all occurrences and updated
them. The above issue should now be fixed in the git tree...

Cheers
  Trond
