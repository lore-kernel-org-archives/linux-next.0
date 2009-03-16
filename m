From: Trond Myklebust <trond.myklebust@fys.uio.no>
Subject: Re: linux-next: nfs tree build failure
Date: Mon, 16 Mar 2009 08:19:26 -0400
Message-ID: <1237205966.7229.1.camel@heimdal.trondhjem.org>
References: <20090316215552.8ca734d2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-out2.uio.no ([129.240.10.58]:35959 "EHLO mail-out2.uio.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752955AbZCPMTc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2009 08:19:32 -0400
In-Reply-To: <20090316215552.8ca734d2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Mon, 2009-03-16 at 21:55 +1100, Stephen Rothwell wrote:
> Hi Trond,
> 
> Today's linux-next build (sparc defconfig) failed like this:
> 
> fs/nfs/write.c:568: error: redefinition of 'nfs_need_commit'
> fs/nfs/write.c:542: error: previous definition of 'nfs_need_commit' was here
> 
> Caused by commit fb8a1f11b64e213d94dfa1cebb2a42a7b8c115c4 ("NFS: cleanup
> - remove struct nfs_inode->ncommit") which I have reverted for today.

Should be fixed now. Somehow the first definition had migrated out of
the #ifdef section immediately following it.

Apologies
  Trond
