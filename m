From: Trond Myklebust <trond.myklebust@fys.uio.no>
Subject: Re: linux-next: nfs tree build warning
Date: Thu, 18 Jun 2009 18:09:12 -0700
Message-ID: <1245373752.8756.59.camel@heimdal.trondhjem.org>
References: <20090619105022.4dc10679.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-out2.uio.no ([129.240.10.58]:37172 "EHLO mail-out2.uio.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751303AbZFSBTR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 18 Jun 2009 21:19:17 -0400
In-Reply-To: <20090619105022.4dc10679.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Sager <sager@netapp.com>

On Fri, 2009-06-19 at 10:50 +1000, Stephen Rothwell wrote:
> Hi Trond,
> 
> Today's linux-next build (powerpc ppc64_defconfig) produced this warning:
> 
> fs/nfs/super.c: In function 'nfs_parse_mount_options':
> fs/nfs/super.c:1253: warning: passing argument 2 of 'match_int' from incompatible pointer type
> include/linux/parser.h:29: note: expected 'int *' but argument is of type 'long unsigned int *'
> 
> Introduced by commit 3fd5be9e19921a89d9ed78d6a708a379a6c3c76a ("nfs41:
> add mount command option minorversion").
> 

That's my fault: it was due to inattention during the merge of the
nfsv41 tree with the mainline NFS changes. I'll fix...

Trond
