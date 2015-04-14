From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the vfs tree with the ext4 tree
Date: Tue, 14 Apr 2015 02:48:55 +0100
Message-ID: <20150414014855.GU889@ZenIV.linux.org.uk>
References: <20150414113025.06905c2a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:57051 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751425AbbDNBtA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 13 Apr 2015 21:49:00 -0400
Content-Disposition: inline
In-Reply-To: <20150414113025.06905c2a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Theodore Ts'o <tytso@mit.edu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>

On Tue, Apr 14, 2015 at 11:30:25AM +1000, Stephen Rothwell wrote:
>  +static void ext4_put_link(struct dentry *dentry, struct nameidata *nd,
>  +			  void *cookie)
>  +{
>  +	struct page *page = cookie;
>  +	char *buf = nd_get_link(nd);
>  +
>  +	if (page) {
>  +		kunmap(page);
>  +		page_cache_release(page);
>  +	}
>  +	if (buf) {
>  +		nd_set_link(nd, NULL);
>  +		kfree(buf);

What the hell is that for?  ->put_link() has no damn reason to call
nd_set_link(); the whole _point_ of ->put_link() is to free what needs
to be freed when we discard a stack element.  And why, in the name of
everything unholy, does it need to keep *any* page mapped?

Look, either nd_get_link() points inside that page (in which case that
kfree() is obviously invalid), or it points at kmalloc'ed buffer.  In
which case kfree() is correct, but WTF do you need anything _else_?
Such as mapped pages, etc.

Has anyone reviewed that code?
