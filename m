From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the hid tree
Date: Wed, 30 Nov 2011 19:51:13 -0800
Message-ID: <20111201035113.GA7647@kroah.com>
References: <20111201143952.9aea929b16c7212570fc1bd2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4.smtp.messagingengine.com ([66.111.4.28]:52001 "EHLO
	out4.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753974Ab1LADv1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 30 Nov 2011 22:51:27 -0500
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 11E7E21890
	for <linux-next@vger.kernel.org>; Wed, 30 Nov 2011 22:51:26 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20111201143952.9aea929b16c7212570fc1bd2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Meyer <thomas@m3y3r.de>, Jiri Kosina <jikos@jikos.cz>

On Thu, Dec 01, 2011 at 02:39:52PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/hid/hid-hyperv.c between commit b95f5bcb811e ("HID: Move the
> hid-hyperv driver out of staging") from the hid tree and various commits
> from the staging tree (this was drivers/staging/hv/hv_mouse.c).
> 
> The commit message says that all the changes that happened when this file
> moved from staging have also been applied to the staging file, so I just
> used the version from the hid tree.

Ok, that's fine, Jiri, want me to just delete the driver from my tree
now to remove any of these conflicts?

thanks,

greg k-h
