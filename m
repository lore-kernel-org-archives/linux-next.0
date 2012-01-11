From: Sage Weil <sage@newdream.net>
Subject: Re: linux-next: manual merge of the ceph tree with Linus' tree
Date: Tue, 10 Jan 2012 17:35:36 -0800 (PST)
Message-ID: <Pine.LNX.4.64.1201101732330.15859@cobra.newdream.net>
References: <20120111122744.7db3bfb91d79b1307db02228@canb.auug.org.au>
 <20120111013127.GE23916@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cobra.newdream.net ([66.33.216.30]:37825 "EHLO
	cobra.newdream.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932438Ab2AKBfg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Jan 2012 20:35:36 -0500
In-Reply-To: <20120111013127.GE23916@ZenIV.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Elder <elder@dreamhost.com>

On Wed, 11 Jan 2012, Al Viro wrote:
> On Wed, Jan 11, 2012 at 12:27:44PM +1100, Stephen Rothwell wrote:
> > Hi Sage,
> > 
> > Today's linux-next merge of the ceph tree got a conflict in
> > fs/ceph/super.c between commit 3c5184ef1216 ("ceph: d_alloc_root() may
> > fail") from Linus' tree and commit 26d913cdd955 ("ceph: always initialize
> > the dentry in open_root_dentry()") from the ceph tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary.
> 
> Ahem...  
> 
> >  +			root = d_obtain_alias(inode);
> >  +		}
> > + 		ceph_init_dentry(root);
> 
> What will happen if dentry returned by d_obtain_alias() had already existed?

ceph_init_dentry() bails out immediately if d_fsdata is non-NULL.

BTW, should I let Linus resolve this, or merge his master back into my 
tree, or rebase onto his master?

sage
