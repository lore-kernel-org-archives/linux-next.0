From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the virtio
 tree
Date: Tue, 19 Feb 2013 20:34:24 -0800
Message-ID: <20130220043424.GA2513@kroah.com>
References: <20130220152507.4d7405fcb3561213b4ccd7ab@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:47505 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S934191Ab3BTEd7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 19 Feb 2013 23:33:59 -0500
Content-Disposition: inline
In-Reply-To: <20130220152507.4d7405fcb3561213b4ccd7ab@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, Kees Cook <keescook@chromium.org>

On Wed, Feb 20, 2013 at 03:25:07PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got conflicts in
> drivers/vhost/Kconfig and drivers/vhost/Kconfig.tcm between commit
> 4d8dc8b44748 ("vringh: host-side implementation of virtio rings") from
> the virtio tree and commit 43893cbefc1b ("drivers/vhost: remove depends
> on CONFIG_EXPERIMENTAL") from the driver-core tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good to me, thanks.

greg k-h
