From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the
 staging.current tree
Date: Tue, 26 Nov 2013 19:20:28 -0800
Message-ID: <20131127032028.GA22475@kroah.com>
References: <20131127130144.8db67b95b9c1a0141ab58a4a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:46899 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751459Ab3K0DTp (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Nov 2013 22:19:45 -0500
Content-Disposition: inline
In-Reply-To: <20131127130144.8db67b95b9c1a0141ab58a4a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rashika Kheria <rashika.kheria@gmail.com>

On Wed, Nov 27, 2013 at 01:01:44PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got conflicts in
> drivers/staging/tidspbridge/pmgr/cmm.c,
> drivers/staging/tidspbridge/pmgr/dbll.c,
> drivers/staging/tidspbridge/pmgr/dev.c,
> drivers/staging/tidspbridge/pmgr/dmm.c and
> drivers/staging/tidspbridge/pmgr/dspapi.c between commit cb45065428b7
> ("staging: delete tidspbridge driver") from the staging.current tree and
> various commits from the staging tree.
> 
> I just removed the files and can carry the fix as necessary (no action
> is required).

Thanks, that is the correct thing.

greg k-h
