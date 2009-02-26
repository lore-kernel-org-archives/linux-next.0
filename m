From: Theodore Tso <tytso@mit.edu>
Subject: Re: linux-next: manual merge of the ext4 tree with the  tree
Date: Thu, 26 Feb 2009 01:03:45 -0500
Message-ID: <20090226060345.GC7227@mit.edu>
References: <20090225125254.6e94f404.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from thunk.org ([69.25.196.29]:57800 "EHLO thunker.thunk.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752658AbZBZGDu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Feb 2009 01:03:50 -0500
Content-Disposition: inline
In-Reply-To: <20090225125254.6e94f404.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Mingming Cao <cmm@us.ibm.com>, Jan Kara <jack@suse.cz>

On Wed, Feb 25, 2009 at 12:52:54PM +1100, Stephen Rothwell wrote:
> Hi Ted,
> 
> Today's linux-next merge of the ext4 tree got a conflict in
> fs/ext4/ext4.h between commit 7c989bb2f1b18268968ce44c603f18a9854b1b85
> ("ext4: quota reservation for delayed allocation") from the quota tree
> and commit eafffefbb8cc3db4acebb75014091b473c60007d ("ext4: add
> EXT4_IOC_ALLOC_DA_BLKS ioctl") from the ext4 tree.
> 
> Just overlapping additions. I fixed it up (see below) and can carry the
> fix as necessary.

Thanks, I've moved up the function declaration to avoid the need for a
manual fixup.

						- Ted
