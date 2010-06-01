From: Christoph Hellwig <hch@infradead.org>
Subject: Re: linux-next: manual merge of the drbd tree with Linus' tree
Date: Tue, 1 Jun 2010 04:18:23 -0400
Message-ID: <20100601081823.GA29991@infradead.org>
References: <20100601141324.edf41f7f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:45973 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753104Ab0FAIS3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Jun 2010 04:18:29 -0400
Content-Disposition: inline
In-Reply-To: <20100601141324.edf41f7f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Philipp Reisner <philipp.reisner@linbit.com>, drbd-dev@linbit.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Julia Lawall <julia@diku.dk>, Al Viro <viro@zeniv.linux.org.uk>, Jens Axboe <jens.axboe@oracle.com>

On Tue, Jun 01, 2010 at 02:13:24PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the drbd tree got a conflict in fs/pipe.c
> between commit cc967be54710d97c05229b2e5ba2d00df84ddd64 ("fs: Add missing
> mutex_unlock") from Linus' tree and commits
> 0191f8697bbdfefcd36e7b8dc3eeddfe82893e4b ("pipe: F_SETPIPE_SZ should
> return -EPERM for non-root") and b9598db3401282bb27b4aef77e3eee12015f7f29
> ("pipe: make F_{GET,SET}PIPE_SZ deal with byte sizes") from the drbd tree.
> 
> I fixed it up (see below) and can carry the fix for a while.

Why is the drbd tree touching fs/pipe.c anyway?
