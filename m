From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: manual merge of the hid tree
Date: Mon, 25 Aug 2008 11:50:56 -0400
Message-ID: <20080825155056.GA17926@anvil.corenet.prv>
References: <20080825144633.393096b5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from py-out-1112.google.com ([64.233.166.183]:53764 "EHLO
	py-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753242AbYHYPuy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Aug 2008 11:50:54 -0400
Received: by py-out-1112.google.com with SMTP id p76so1083854pyb.10
        for <linux-next@vger.kernel.org>; Mon, 25 Aug 2008 08:50:53 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20080825144633.393096b5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jiri Kosina <jikos@jikos.cz>, linux-next@vger.kernel.org, Henrik Rydberg <rydberg@euromail.se>, Jiri Slaby <jirislaby@gmail.com>

On Mon, Aug 25, 2008 at 02:46:33PM +1000, Stephen Rothwell wrote:
> Hi Jiri,
> 
> Today's linux-next merge of the hid tree got a conflict in
> drivers/hid/usbhid/hid-quirks.c between commit
> f89bd95c5c946776f116ffeb997653d4193d6a35 ("Input: bcm5974 - add driver
> for Macbook Air and Pro Penryn touchpads") from Linus' tree and
> commit8216ac91aeff627cc6169df46e0fbb2097716f56 ("HID: move apple quirks")
> from the hid tree.
> 
> I used the version of that file from the hid tree and then added the
> following patch (which may be completely wrong).
> 

I wonder what we should do in such case... are you going to use rerere
till we resync with Linus?

-- 
Dmitry
