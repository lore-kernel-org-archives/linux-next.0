From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with Linus' tree
Date: Fri, 4 May 2012 16:19:12 -0700
Message-ID: <20120504231912.GB9720@kroah.com>
References: <20120501150109.753d67c17e5beead1600c7ac@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:44165 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755767Ab2EDXTO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 4 May 2012 19:19:14 -0400
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

Thanks, this should now be resolved in my tree.

greg k-h
