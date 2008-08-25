From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the hid tree
Date: Sun, 24 Aug 2008 21:49:56 -0700
Message-ID: <20080825044956.GA3959@kroah.com>
References: <20080825142631.3171068e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:42442 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751395AbYHYGUx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Aug 2008 02:20:53 -0400
Content-Disposition: inline
In-Reply-To: <20080825142631.3171068e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jiri Kosina <jikos@jikos.cz>, linux-next@vger.kernel.org

On Mon, Aug 25, 2008 at 02:26:31PM +1000, Stephen Rothwell wrote:
> Hi Jiri,
> 
> Today's linux-next merge of the hid tree got a conflict in
> drivers/hid/usbhid/hid-core.c between commit
> 42c057049eb3ca9bad38fb0acc6290771a11d9ff ("USB: remove warn() macro from
> usb.h") from the usb tree and commit
> 128fc1f24bbb042b8d586dfba4db9ee7caac52bd ("HID: indent switches/cases")
> from the hid tree.
> 
> I did the obvious fixups (see below).
> 
> Jiri, you should be able to apply the appropriate part of Greg's patch to
> your tree as it only depends on stuff that is already in Linus' tree.  I
> have added that partial patch below. (Greg, do you want to Sign-off on
> that, please?)  (I don't mind if the patch is in both trees - Greg you
> might consider breaking up those warn() and info() (and err()?) removal
> patches and sending them to the appropriate maintainers.)

They are going to get split up and sent to them later this week.

thanks,

greg k-h
