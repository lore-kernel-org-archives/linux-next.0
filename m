From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the vfs tree with the gfs2 tree
Date: Fri, 12 Jun 2009 02:19:48 +0100
Message-ID: <20090612011948.GZ8633@ZenIV.linux.org.uk>
References: <20090527115253.37abd576.sfr@canb.auug.org.au> <20090612111237.0e5972e9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:32875 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756668AbZFLBTq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 11 Jun 2009 21:19:46 -0400
Content-Disposition: inline
In-Reply-To: <20090612111237.0e5972e9.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Steven Whitehouse <swhiteho@redhat.com>, Christoph Hellwig <hch@infradead.org>

On Fri, Jun 12, 2009 at 11:12:37AM +1000, Stephen Rothwell wrote:
> Hi Al,
> 
> On Wed, 27 May 2009 11:52:53 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the vfs tree got a conflict in
> > fs/gfs2/ops_super.c between commit
> > 9e6e0a128bca0a151d8d3fbd9459b22fc21cfebb ("GFS2: Merge mount.c and
> > ops_super.c into super.c") from the gfs2 tree and commits
> > 17af8f24a7750ea3d947904f97eb6dfacf9a88aa ("gfs2: remove ->write_super and
> > stop maintaining ->s_dirt") and 8123178eb9ca12cde31a95170746e15a79528a62
> > ("push BKL down into ->put_super") from the vfs tree.
> 
> This conflict is now against Linus's tree as the gfs2 tree has been
> merged.

I know, properly ported stuff is in updated for-next (basically, a bunch
of functions moved from ops_super.c to super.c, so changesets needed to
be updated to touch the latter).
