From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the vfs tree with the ext4 tree
Date: Tue, 14 Apr 2015 18:17:43 +0100
Message-ID: <20150414171743.GC889@ZenIV.linux.org.uk>
References: <20150414113025.06905c2a@canb.auug.org.au>
 <20150414014855.GU889@ZenIV.linux.org.uk>
 <20150414170000.GB29810@thunk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:60100 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754057AbbDNRRr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Apr 2015 13:17:47 -0400
Content-Disposition: inline
In-Reply-To: <20150414170000.GB29810@thunk.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Theodore Ts'o <tytso@mit.edu>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>

On Tue, Apr 14, 2015 at 01:00:00PM -0400, Theodore Ts'o wrote:

> > Look, either nd_get_link() points inside that page (in which case that
> > kfree() is obviously invalid), or it points at kmalloc'ed buffer.  In
> > which case kfree() is correct, but WTF do you need anything _else_?
> > Such as mapped pages, etc.
> 
> Yes, it's either one or the other.
> 
> 1) In the case of an unencrypted symlink which is too big to fit in
> the inode, we map in the first (only) block of the symlink, and set
> the link to it.

... and that kfree() will bugger us.

> 2) In the case of an encrypted symlink, we allocate memory and decrypt
> from the first block (or the i_block[] array in the inode), and then
> release the page if necessary.

... and that should've dropped that page in ->follow_link().

> I suppose we could have gone from two struct inode_operations (for
> fast and "slow" symlinks), to four struct inodes_operations (for
> [fast, unencrypted symlinks], [fast, encrypted symlinks], [slow,
> unencrypted symlinks], and [slow, encrypted symlinks]), but it was
> simpler to use a single follow_link() and put_link() function to
> handle multiple cases.

Except that you do not handle the slow unencrypted case - you end up with
kfree() on the freshly kunmaped address.
