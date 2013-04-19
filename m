From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH usb-next] usb: storage: Fix link error
Date: Thu, 18 Apr 2013 19:02:40 -0700
Message-ID: <20130419020240.GA6931@kroah.com>
References: <20130418160541.57123749577f29665fba7839@canb.auug.org.au>
 <1366319834.2119.27.camel@joe-AO722>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:47200 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S967641Ab3DSCCt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 18 Apr 2013 22:02:49 -0400
Received: by mail-pd0-f169.google.com with SMTP id 14so91122pdc.0
        for <linux-next@vger.kernel.org>; Thu, 18 Apr 2013 19:02:49 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1366319834.2119.27.camel@joe-AO722>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Dharm <mdharm-usb@one-eyed-alien.net>, linux-usb <linux-usb@vger.kernel.org>, usb-storage <usb-storage@lists.one-eyed-alien.net>

On Thu, Apr 18, 2013 at 02:17:14PM -0700, Joe Perches wrote:
> Fix allmodconfig link error introduced by commit 75b9130e8a
> ("usb: storage: Add usb_stor_dbg, reduce object size")
> 
> Export the symbol usb_stor_dbg.
> Add export.h
> 
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>  drivers/usb/storage/debug.c | 2 ++
>  1 file changed, 2 insertions(+)

You forgot the "Reported-by:" line :(

I'll go add it now, thanks for the quick fix-up patch.

greg k-h
