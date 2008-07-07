From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: linux-next: manual merge of the usb tree
Date: Mon, 7 Jul 2008 10:09:33 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.0807071008550.2581-100000@iolanthe.rowland.org>
References: <20080707130941.53fe052f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from iolanthe.rowland.org ([192.131.102.54]:36435 "HELO
	iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753295AbYGGOJe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Jul 2008 10:09:34 -0400
In-Reply-To: <20080707130941.53fe052f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org

On Mon, 7 Jul 2008, Stephen Rothwell wrote:

> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> drivers/usb/core/hub.c between commit
> 09ca8adbe9f724a7e96f512c0039c4c4a1c5dcc0 ("Revert "USB: don't explicitly
> reenable root-hub status interrupts"") from Linus' tree and commit
> hub_events ("USB: simplify hub_restart() logic") from the usb tree.
> 
> I fixed it up but definitely worth a check to make sure that the end of
> hub_events() still make sense.

The reversion and the fix don't show up at git.kernel.org, so I can't 
check them.

Alan Stern
