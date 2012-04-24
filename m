From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the usb tree
Date: Tue, 24 Apr 2012 07:45:04 -0700
Message-ID: <20120424144504.GB3532@kroah.com>
References: <20120424144820.326e86452826927b86aaf0f5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:44116 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754588Ab2DXOpI (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Apr 2012 10:45:08 -0400
Content-Disposition: inline
In-Reply-To: <20120424144820.326e86452826927b86aaf0f5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Apr 24, 2012 at 02:48:20PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/line6/driver.c between commit 2b8dec323d34 ("USB:
> driver.c: remove err() usage") from the usb tree and commit c46b8a6567fb
> ("Staging: line6: only allocate a buffer if it is needed") (and later)
> from the staging tree.
> 
> The latter supercedes the former, so I used that.

Thanks, that is correct.

greg k-h
