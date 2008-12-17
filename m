From: "Eilon Greenstein" <eilong@broadcom.com>
Subject: Re: linux-next: net tree build warnings
Date: Wed, 17 Dec 2008 10:04:43 +0200
Message-ID: <1229501083.28117.2.camel@lb-tlvb-eliezer>
References: <20081217182224.a7f20a12.sfr@canb.auug.org.au>
 <20081216.235355.139378362.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mms3.broadcom.com ([216.31.210.19]:3966 "EHLO MMS3.broadcom.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751745AbYLQIGk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Dec 2008 03:06:40 -0500
In-Reply-To: <20081216.235355.139378362.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "steve.glendinning@smsc.com" <steve.glendinning@smsc.com>, Yaniv Rosner <yaniv.rosner@broadcom.com>

On Tue, 2008-12-16 at 23:53 -0800, David Miller wrote:
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 17 Dec 2008 18:22:24 +1100
> 
> > Today's linux-next build (x86_64 allmodconfig) produced these warnings:
> >
> > In file included from drivers/net/bnx2x_main.c:58:
> > drivers/net/bnx2x_link.h:30:1: warning: "FLOW_CTRL_TX" redefined
> > In file included from drivers/net/bnx2x_main.c:40:
> > include/linux/mii.h:139:1: warning: this is the location of the previous definition
> > In file included from drivers/net/bnx2x_main.c:58:
> > drivers/net/bnx2x_link.h:31:1: warning: "FLOW_CTRL_RX" redefined
> > In file included from drivers/net/bnx2x_main.c:40:
> > include/linux/mii.h:140:1: warning: this is the location of the previous definition
> >
> > Caused by commit e18ce3465477502108187c6c08b6423fb784a313 ("net: Move flow control definitions to mii.h").
> > --
> 
> Thanks, I'll fix this up with the following two commits:
> 
....

> --------------------
> bnx2x: Fix namespace collision with FLOW_CTRL_{TX,RX}
> 
> These are now defined in linux/mii.h and the bnx2x driver
> defines different values which are shared with hardware
> data structures.
> 
> So add a "BNX2X_" prefix to these macro names.
> 
> Based upon a report from Stephen Rothwell.
> 
> Signed-off-by: David S. Miller <davem@davemloft.net>
> ---
>  drivers/net/bnx2x_link.c |   72 +++++++++++++++++++++++-----------------------
>  drivers/net/bnx2x_link.h |   10 +++---
>  drivers/net/bnx2x_main.c |   38 ++++++++++++------------
>  3 files changed, 60 insertions(+), 60 deletions(-)

Thanks Dave - I was just writing the email header for the exact same
fix ;)
Funny how we both miraculously chose the same prefix...

Thanks,
Eilon
