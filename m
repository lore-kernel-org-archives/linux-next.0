From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the usb tree
Date: Fri, 27 Apr 2012 11:25:31 -0700
Message-ID: <20120427182531.GA10970@kroah.com>
References: <20120427141234.242d7f7abb4b5453255d7544@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:34487 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1760485Ab2D0SZw (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Apr 2012 14:25:52 -0400
Content-Disposition: inline
In-Reply-To: <20120427141234.242d7f7abb4b5453255d7544@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Apr 27, 2012 at 02:12:34PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the usb tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> In file included from drivers/usb/host/ohci-hcd.c:1079:0:
> drivers/usb/host/ohci-ps3.c: In function 'ps3_ohci_hc_start':
> drivers/usb/host/ohci-ps3.c:48:3: error: implicit declaration of function 'err' [-Werror=implicit-function-declaration]
> 
> Caused by commit af4e1ee04026 ("USB: remove err() macro").

Ick, sorry about that, I missed some of the ohci controller drivers,
they should all now be fixed up.

greg k-h
