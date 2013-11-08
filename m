From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: build failure after merge of the userns tree
Date: Fri, 8 Nov 2013 15:55:47 +0000
Message-ID: <20131108155547.GP13318@ZenIV.linux.org.uk>
References: <20131108175848.6ca49f0ee8fe2a6c1125394a@canb.auug.org.au>
 <20131108072732.GA27537@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:35583 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754303Ab3KHP4d (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 8 Nov 2013 10:56:33 -0500
Content-Disposition: inline
In-Reply-To: <20131108072732.GA27537@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Eric W. Biederman" <ebiederm@xmission.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Nov 07, 2013 at 11:27:32PM -0800, Christoph Hellwig wrote:
> On Fri, Nov 08, 2013 at 05:58:48PM +1100, Stephen Rothwell wrote:
> > Hi Eric,
> > 
> > After merging the userns tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> > 
> > fs/namei.c: In function 'covered':
> > fs/namei.c:3528:2: error: too many arguments to function '__lookup_mnt'
> >   is_covered = d_mountpoint(dentry) && __lookup_mnt(mnt, dentry, 1);
> >   ^
> > 
> > Caused by my incomplete merge resolution between commits 474279dc0f77
> > ("split __lookup_mnt() in two functions") from the vfs tree and
> > a3b4491433f2 ("vfs: Don't allow overwriting mounts in the current mount
> > namespace") from the userns tree.
> 
> Btw, I don't think the userns tree has any business touching lookup
> and mount semantics in namei.c without an explicit VFS signoff.
> 
> Please drop the tree for now.

I'll probably put some form of that stuff through the vfs.git - the idea
is sane, but I would really like to see Eric's answer to the question
I've asked about the checks he adds in the first commit in this series;
AFAICS, to make them non-racy one needs to change locking rules for mount(2).
As it is, we have namespace_sem held exclusive _and_ ->i_mutex of mountpoint
to be held for all places where we turn something into a mountpoint.  His code
appears to assume that we are actually using ->i_mutex on _parent_ instead;
either that, or these checks are deliberately racy.

I'm not saying that change of lock_mount(9) behaviour is out of question -
we could change these locking rules, but such change isn't there in that
series and it's not even discussed there.
