From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the vfs tree with Linus' tree
Date: Tue, 14 Feb 2012 01:43:06 +0000
Message-ID: <20120214014306.GX23916@ZenIV.linux.org.uk>
References: <20120214115419.f4b1300a82ef7e94c450ecb1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:53847 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751667Ab2BNBnJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 13 Feb 2012 20:43:09 -0500
Content-Disposition: inline
In-Reply-To: <20120214115419.f4b1300a82ef7e94c450ecb1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Evgeniy Polyakov <zbr@ioremap.net>, Greg KH <greg@kroah.com>

On Tue, Feb 14, 2012 at 11:54:19AM +1100, Stephen Rothwell wrote:
> Hi Al,
> 
> Today's linux-next merge of the vfs tree got a conflict in
> drivers/staging/pohmelfs/inode.c between commit 67435319866f ("staging:
> pohmelfs: remove drivers/staging/pohmelfs") from Linus' tree and commit
> 044ff9e29029 ("switch open-coded instances of d_make_root() to new
> helper") from the vfs tree.
> 
> The former just removes this file, so I did that.

*nod*

I'll rebase it to the current, then this one should go away...
