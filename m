From: Trond Myklebust <trond.myklebust@fys.uio.no>
Subject: Re: linux-next: nfs tree build warning
Date: Thu, 30 Apr 2009 23:22:35 -0400
Message-ID: <1241148155.15476.128.camel@heimdal.trondhjem.org>
References: <20090501131545.ca8c314a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-out2.uio.no ([129.240.10.58]:37317 "EHLO mail-out2.uio.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752265AbZEADWl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Apr 2009 23:22:41 -0400
In-Reply-To: <20090501131545.ca8c314a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Benny Halevy <bhalevy@panasas.com>, Andy Adamson <andros@umich.edu>

On Fri, 2009-05-01 at 13:15 +1000, Stephen Rothwell wrote:
> Hi Trond,
> 
> Today's linux-next build (x86_64 allmodconfig) produced this warning:
> 
> fs/nfs/nfs4proc.c: In function 'nfs4_proc_exchange_id':
> fs/nfs/nfs4proc.c:4279: warning: the frame size of 2288 bytes is larger than 2048 bytes
> 
> Introduced by commit 63a93b4af49220c74757beb17b5617b72d912b6b ("nfs41:
> exchange_id operation").  This commit has been around for a while.

Benny, Andy,

Why are we preallocating 1k buffers on the stack for these things?
That's an insane amount of free space...

If this is truly a realistic value (which I sincerely doubt), then the
right thing to do is to preallocate a page in which to store them.
Putting 1k arrays on the stack is just _wrong_.

Trond
