From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Thu, 10 Dec 2015 00:48:51 +0000
Message-ID: <20151210004851.GB20997@ZenIV.linux.org.uk>
References: <20151210111847.07db6062@canb.auug.org.au>
 <20151210112322.16081535@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:52301 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751151AbbLJAsy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 9 Dec 2015 19:48:54 -0500
Content-Disposition: inline
In-Reply-To: <20151210112322.16081535@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Marshall <hubcap@omnibond.com>

On Thu, Dec 10, 2015 at 11:23:22AM +1100, Stephen Rothwell wrote:
> [Just adding the origefs maintainer to the cc list]
> > -static const char *pvfs2_follow_link(struct dentry *dentry, void **cookie)
> > +static const char *pvfs2_get_link(struct dentry *dentry, struct inode *inode,
> > +				  void **cookie)
> >  {
> > -	char *target =  PVFS2_I(dentry->d_inode)->link_target;

Better fix is to have inode->link = PVFS2_I(dentry->d_inode)->link_target;
when we set the latter and use .get_link = simple_get_link...

Said that, there is an unpleasant bug in that area - link_target of a live
inode can be overwritten, right under the pathname resolution walking the
old contents of that thing.

copy_attributes_to_inode() is triggered by ->d_revalidate() and by ->getattr()
and it's really, really unsafe for a live inode.  Just look what it does
to ->i_mode...  Sure, normally a server won't return different symlink bodies
on subsequent getattr requests.  As long as it's sane (and not compromised,
etc.), but relying upon that is not a good idea.
