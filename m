From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 powerpc tree
Date: Fri, 9 Mar 2012 07:18:57 -0800
Message-ID: <20120309151857.GA12578@kroah.com>
References: <20120309164025.dc16cfacaa2ee35cbeea14a8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:45364 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757172Ab2CIPTA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 9 Mar 2012 10:19:00 -0500
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id B4392211EE
	for <linux-next@vger.kernel.org>; Fri,  9 Mar 2012 10:18:59 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20120309164025.dc16cfacaa2ee35cbeea14a8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, Alan Stern <stern@rowland.harvard.edu>

On Fri, Mar 09, 2012 at 04:40:25PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> drivers/base/driver.c between commit fcd6f7620202 ("driver-core: remove
> legacy iSeries hack") from the powerpc tree and commit 9875bb480cc8
> ("Eliminate get_driver() and put_driver()") from the driver-core tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Looks good to me, thanks for doing this.

greg k-h
