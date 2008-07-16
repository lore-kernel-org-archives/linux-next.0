From: Jaswinder Singh <jaswinder@infradead.org>
Subject: Re: linux-next: manual merge of the usb tree
Date: Wed, 16 Jul 2008 12:36:17 +0530
Message-ID: <1216191977.3394.5.camel@jaswinder.satnam>
References: <20080716120219.a3de00bd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:47405 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751090AbYGPHHL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Jul 2008 03:07:11 -0400
In-Reply-To: <20080716120219.a3de00bd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>, David Woodhouse <dwmw2@infradead.org>

Hello Stephen,

On Wed, 2008-07-16 at 12:02 +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the usb tree got a conflict in
> drivers/usb/serial/io_ti.c between commit
> d12b219a228efe92f0778ed3af21305e65fbb052 ("edgeport-ti: use
> request_firmware()") from Linus' tree and commit
> 1f023570c8d00d3511799ccad21dc3525a6160e1 ("USB: io_ti: FIrst cut at a big
> clean up") from the usb tree.
> 
> This conflict used to be in the firmware tree and my solution then was to
> remove the commit now in Linus' tree because the fixup was going to take
> to long.  Now my solution is to remove the commit from the usb tree.
> 

I am checking linux-next tree :
git://git.kernel.org/pub/scm/linux/kernel/git/sfr/linux-next.git

I think you already merged alan patch to it but firmware patch is not
installed yet.

So I am going to check alan patch manually.
And after confirmation that alan patch is fully installed then I will
install firmware patch and send to all of you.

Thank you,

Jaswinder Singh.
