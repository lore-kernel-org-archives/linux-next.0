From: Nick Piggin <npiggin@kernel.dk>
Subject: Re: linux-next: manual merge of the vfs-scale tree with the v9fs
 tree
Date: Tue, 4 Jan 2011 16:52:30 +1100
Message-ID: <20110104055230.GA3402@amd>
References: <20110104124054.c767a4ee.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ipmail05.adl6.internode.on.net ([150.101.137.143]:53016 "EHLO
	ipmail05.adl6.internode.on.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750956Ab1ADFwg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 4 Jan 2011 00:52:36 -0500
Content-Disposition: inline
In-Reply-To: <20110104124054.c767a4ee.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Nick Piggin <npiggin@kernel.dk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, Venkateswararao Jujjuri <jvrao@linux.vnet.ibm.com>, Eric Van Hensbergen <ericvh@gmail.com>

On Tue, Jan 04, 2011 at 12:40:54PM +1100, Stephen Rothwell wrote:
> Hi Nick,
> 
> Today's linux-next merge of the vfs-scale tree got a conflict in
> fs/9p/vfs_inode.c between commit 3d21652a1d23591e7f0bbbbedae29ce78c2c1113
> ("fs/9p: Move dotl inode operations into a seperate file") from the v9fs
> tree and various commits from the vfs-scale tree.
> 
> I fixed it up by using the v9fs changes to that file and then applying
> the following merge fixup patch (which I can carry as necessary).

Thanks Stephen.

 
> Someone will need to fix this up before one of these trees is merged by
> Linus, or to send this merge fix to Linus.

If Linus does pull vfs-scale, and if it is before the v9fs tree, I can
help with the conversion. Otherwise I will be happy to fix up fallout
in my tree.

Thanks,
Nick
