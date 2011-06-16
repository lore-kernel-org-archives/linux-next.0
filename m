From: Trond Myklebust <trond.myklebust@fys.uio.no>
Subject: Re: linux-next: build warnings after merge of the nfs tree
Date: Thu, 16 Jun 2011 13:31:26 -0400
Message-ID: <1308245489.10167.4.camel@lade.trondhjem.org>
References: <20110616133847.1ba62bab.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-out1.uio.no ([129.240.10.57]:50302 "EHLO mail-out1.uio.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752045Ab1FPRbb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Jun 2011 13:31:31 -0400
In-Reply-To: <20110616133847.1ba62bab.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2011-06-16 at 13:38 +1000, Stephen Rothwell wrote: 
> Hi Trond,
> 
> After merging the nfs tree, today's linux-next build (powerpc
> ppc64_defconfig) produced these warnings:
> 
> fs/nfs/pnfs.h:379:13: warning: 'pnfs_pageio_init_read' defined but not used
> fs/nfs/pnfs.h:384:13: warning: 'pnfs_pageio_init_write' defined but not used
> 
> (lots of times)
> 
> Introduced by commit cb679cdd50a8 ("NFS: Cleanup of the nfs_pageio code
> in preparation for a pnfs bugfix").  "inline" is missing.
> 

Sorry about that. It should be fixed now...
