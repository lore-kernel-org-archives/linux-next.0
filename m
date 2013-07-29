From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the char-misc tree with Linus' tree
Date: Mon, 29 Jul 2013 12:26:49 -0700
Message-ID: <20130729192649.GA9191@kroah.com>
References: <20130729150129.76a9fab4023ee22c940b7920@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:51051 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751128Ab3G2T0v (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Jul 2013 15:26:51 -0400
Content-Disposition: inline
In-Reply-To: <20130729150129.76a9fab4023ee22c940b7920@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tomas Winkler <tomas.winkler@intel.com>

On Mon, Jul 29, 2013 at 03:01:29PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in
> drivers/misc/mei/init.c between commit 99f22c4ef24c ("mei: don't have to
> clean the state on power up") from Linus' tree and commit b950ac1dabfc
> ("mei: don't get stuck in select during reset") from the char-misc tree.
> 
> (Unrelated white space changes are a pest :-()
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks, I've merged the char-misc-next branch into 3.11-rc3, so this
merge problem should no longer be there.

greg k-h
