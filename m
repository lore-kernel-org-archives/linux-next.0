From: "J. Bruce Fields" <bfields@fieldses.org>
Subject: Re: linux-next: Tree for August 13 (nfsd)
Date: Wed, 13 Aug 2008 14:09:31 -0400
Message-ID: <20080813180931.GC26765@fieldses.org>
References: <20080813172452.14b0775c.sfr@canb.auug.org.au> <20080813104748.13848196.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.fieldses.org ([66.93.2.214]:37494 "EHLO fieldses.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751934AbYHMSJw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 Aug 2008 14:09:52 -0400
Content-Disposition: inline
In-Reply-To: <20080813104748.13848196.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, neilb@suse.de, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

On Wed, Aug 13, 2008 at 10:47:48AM -0700, Randy Dunlap wrote:
> linux-next-20080813/fs/nfsd/nfs4state.c:259: error: implicit declaration of function 'vfs_setlease'
> linux-next-20080813/fs/nfsd/nfs4state.c:1386: error: implicit declaration of function 'lease_modify'
> make[3]: *** [fs/nfsd/nfs4state.o] Error 1
> 
> 
> config attached.

Probably relevant pieces:

	# CONFIG_FILE_LOCKING is not set
	...
	CONFIG_NFSD=m
	CONFIG_NFSD_V3=y
	# CONFIG_NFSD_V3_ACL is not set
	CONFIG_NFSD_V4=y

Looks like that's just two more functions that need to be stubbed out in
the case where CONFIG_FILE_LOCKING is undefined?--hopefully Thomas
Petazzoni (cc'd) could be talked into reproducing this and sending me an
incremental fix....

--b.
