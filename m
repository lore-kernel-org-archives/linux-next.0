From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with Linus' tree
Date: Tue, 1 May 2012 09:46:30 -0400
Message-ID: <20120501134630.GC31954@kroah.com>
References: <20120501150109.753d67c17e5beead1600c7ac@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:56590 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756657Ab2EANqb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 May 2012 09:46:31 -0400
Content-Disposition: inline
In-Reply-To: <20120501150109.753d67c17e5beead1600c7ac@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>, Rusty Russell <rusty@rustcorp.com.au>, Chris Metcalf <cmetcalf@tilera.com>

On Tue, May 01, 2012 at 03:01:09PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> init/main.c between commit a99cd1125189 ("init: fix bug where environment
> vars can't be passed via boot args") from Linus' tree and commit
> 9fb48c744ba6 ("params: add 3rd arg to option handler callback signature")
> from the driver-core tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Thanks, I was warned about this from Jim, but hadn't had the chance to
do the merge myself.  I'll work on this later today so you don't have to
carry the fix yourself.

greg k-h
