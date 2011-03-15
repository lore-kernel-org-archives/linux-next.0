From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build failure after merge of the bkl-config tree
Date: Tue, 15 Mar 2011 13:59:12 +0100
Message-ID: <201103151359.12569.arnd@arndb.de>
References: <20110315184845.1a411e67.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.187]:59375 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757626Ab1COM7Z (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 15 Mar 2011 08:59:25 -0400
In-Reply-To: <20110315184845.1a411e67.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Adamson <andros@netapp.com>, Boaz Harrosh <bharrosh@panasas.com>, Dean Hildebrand <dhildeb@us.ibm.com>, Fred Isaman <iisaman@citi.umich.edu>, Mike Sager <sager@netapp.com>, Fred Isaman <iisaman@netapp.com>, Mingyang Guo <guomingyang@nrchpc.ac.cn>, Ricardo Labiaga <Ricardo.Labiaga@netapp.com>, Tao Guo <guotao@nrchpc.ac.cn>, Benny Halevy <bhalevy@panasas.com>, Trond Myklebust <trond.myklebust@fys.uio.no>

On Tuesday 15 March 2011, Stephen Rothwell wrote:
> After merging the bkl-config tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> fs/nfs/read.c:21:28: error: linux/smp_lock.h: No such file or directory
> 
> Caused by commit 64419a9b2093 ("NFSv4.1: generic read") from the nfs tree
> interacting with commit 4ba8216cd905 ("BKL: That's all, folks") from the
> bkl-config tree.
> 
> I couldn't see that this include file was needed, so I applied the patch
> below (which Trond could apply to his tree, I am pretty sure).  (I am not
> sure why module.h is included either.)
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 15 Mar 2011 18:37:09 +1100
> Subject: [PATCH] nfs: BKL is no longer needed, so remove the include
> 

The fix is good. I have one patch in bkl-config that removes all instances
of #include <linux/smp_lock.h> treewide. Obviously that doesn't
help where new ones creep in, so we have to eliminate them one
by one.

	Arnd
