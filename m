From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: linux-next: manual merge of the vfs tree with the ext4 tree
Date: Tue, 14 Apr 2015 13:00:00 -0400
Message-ID: <20150414170000.GB29810@thunk.org>
References: <20150414113025.06905c2a@canb.auug.org.au>
 <20150414014855.GU889@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from imap.thunk.org ([74.207.234.97]:39077 "EHLO imap.thunk.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932272AbbDNRAH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Apr 2015 13:00:07 -0400
Content-Disposition: inline
In-Reply-To: <20150414014855.GU889@ZenIV.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>

On Tue, Apr 14, 2015 at 02:48:55AM +0100, Al Viro wrote:
> On Tue, Apr 14, 2015 at 11:30:25AM +1000, Stephen Rothwell wrote:
> >  +static void ext4_put_link(struct dentry *dentry, struct nameidata *nd,
> >  +			  void *cookie)
> >  +{
> >  +	struct page *page = cookie;
> >  +	char *buf = nd_get_link(nd);
> >  +
> >  +	if (page) {
> >  +		kunmap(page);
> >  +		page_cache_release(page);
> >  +	}
> >  +	if (buf) {
> >  +		nd_set_link(nd, NULL);
> >  +		kfree(buf);
> 
> What the hell is that for?  ->put_link() has no damn reason to call
> nd_set_link(); the whole _point_ of ->put_link() is to free what needs
> to be freed when we discard a stack element.  And why, in the name of
> everything unholy, does it need to keep *any* page mapped?

The nd_set_link(nd, NULL) call was to clear out the link before it was
freed.  No one else seems to be doing it, so I'm happy to drop it.

> Look, either nd_get_link() points inside that page (in which case that
> kfree() is obviously invalid), or it points at kmalloc'ed buffer.  In
> which case kfree() is correct, but WTF do you need anything _else_?
> Such as mapped pages, etc.

Yes, it's either one or the other.

1) In the case of an unencrypted symlink which is too big to fit in
the inode, we map in the first (only) block of the symlink, and set
the link to it.

2) In the case of an encrypted symlink, we allocate memory and decrypt
from the first block (or the i_block[] array in the inode), and then
release the page if necessary.

I suppose we could have gone from two struct inode_operations (for
fast and "slow" symlinks), to four struct inodes_operations (for
[fast, unencrypted symlinks], [fast, encrypted symlinks], [slow,
unencrypted symlinks], and [slow, encrypted symlinks]), but it was
simpler to use a single follow_link() and put_link() function to
handle multiple cases.

Cheers,

					- Ted
