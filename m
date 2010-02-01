From: Trond Myklebust <trond.myklebust@fys.uio.no>
Subject: Re: linux-next: nfs tree build failure
Date: Mon, 01 Feb 2010 09:15:13 -0500
Message-ID: <1265033714.2658.1.camel@localhost>
References: <20100201183838.63439783.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-out2.uio.no ([129.240.10.58]:50073 "EHLO mail-out2.uio.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753531Ab0BAOPT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Feb 2010 09:15:19 -0500
In-Reply-To: <20100201183838.63439783.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2010-02-01 at 18:38 +1100, Stephen Rothwell wrote: 
> Hi Trond,
> 
> Today's linux-next build (sparc defconfig) failed like this:
> 
> fs/nfs/write.c: In function 'nfs_wb_page':
> fs/nfs/write.c:1478: error: implicit declaration of function 'nfs_commit_inode'
> 
> Caused by commit d01b3158b56e292dbb3eea711a51a1d3dbec5094 ("NFS: Simplify
> nfs_wb_page()").  Neither CONFIG_NFS_V3 nor CONFIG_NFS_V4 is set in this
> build.
> 
> I have reverted that commit for today.

Hi Stephen,

Sorry. There was a 1 line change that somehow slipped out of the final
revision of the patch. It should be fixed now.

Cheers
  Trond
