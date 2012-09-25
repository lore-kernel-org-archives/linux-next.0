From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the vfs tree
Date: Tue, 25 Sep 2012 15:38:44 -0700
Message-ID: <20120925223844.GA6282@kroah.com>
References: <20120924170741.34abbc462d1c405b0b447b72@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:56737 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751342Ab2IYWiq (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Sep 2012 18:38:46 -0400
Content-Disposition: inline
In-Reply-To: <20120924170741.34abbc462d1c405b0b447b72@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sachin Kamat <sachin.kamat@linaro.org>, Al Viro <viro@zeniv.linux.org.uk>

On Mon, Sep 24, 2012 at 05:07:41PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/android/binder.c between commit 004223461eee ("new
> helper: __alloc_fd()") from the vfs tree and commits efde99cd281a
> ("Staging: android: binder: Make task_get_unused_fd_flags function
> static") and bf2023614201 ("Staging: android: binder: Remove an
> inconsequential conditional macro") from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good to me, thanks.

greg k-h
