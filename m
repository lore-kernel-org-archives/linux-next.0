From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the vfs tree with Linus' tree
Date: Mon, 9 Jan 2012 02:14:16 +0000
Message-ID: <20120109021416.GV23916@ZenIV.linux.org.uk>
References: <20120109121133.76f5b7c4a4780954c4562244@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:48495 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755142Ab2AICOR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 8 Jan 2012 21:14:17 -0500
Content-Disposition: inline
In-Reply-To: <20120109121133.76f5b7c4a4780954c4562244@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus <torvalds@linux-foundation.org>

On Mon, Jan 09, 2012 at 12:11:33PM +1100, Stephen Rothwell wrote:
> Hi Al,
> 
> Today's linux-next merge of the vfs tree got a conflict in
> fs/btrfs/super.c between commit 34c80b1d93e6 ("vfs: switch ->show_options
> () to struct dentry *") from Linus' tree and commit 2ddeb2a58b11 ("vfs:
> switch ->show_options() to struct dentry *") from the vfs tree.
> 
> I assume that you sent the correct version to Linus, so I used that.
> Please, if you do change stuff just before sending it to Linus also update
> your for-next branch.
> 
> Then again ... it looks like the vfs tree has other changes to the btrfs
> code so that I need the version from the vfs tree, not Linus' tree ...

btrfs stuff will (hopefully) get picked by Chris.  Until then I've got those
patches in #for-next, rebased on top of what Linus had picked...
