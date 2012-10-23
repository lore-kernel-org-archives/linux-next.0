From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: linux-next: build failure after merge of the final tree (usb
 tree related)
Date: Mon, 22 Oct 2012 21:22:02 -0700
Message-ID: <20121023042202.GA23647@kroah.com>
References: <20121023151354.497d9b4f25b9ce7ff54e0785@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:59273 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752814Ab2JWEVd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 23 Oct 2012 00:21:33 -0400
Received: by mail-pb0-f46.google.com with SMTP id rr4so141813pbb.19
        for <linux-next@vger.kernel.org>; Mon, 22 Oct 2012 21:21:32 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20121023151354.497d9b4f25b9ce7ff54e0785@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Florian Fainelli <florian@openwrt.org>

On Tue, Oct 23, 2012 at 03:13:54PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> In file included from drivers/usb/host/ohci-hcd.c:1165:0:
> drivers/usb/host/ohci-sm501.c: In function 'ohci_sm501_resume':
> drivers/usb/host/ohci-sm501.c:241:2: error: implicit declaration of function 'ohci_finish_controller_resume' [-Werror=implicit-function-declaration]
> 
> Caused by commit cfa49b4b88fe ("USB: ohci: merge
> ohci_finish_controller_resume with ohci_resume").

Ick.  Florian, can you send me a fix-up patch for this?

thanks,

greg k-h
