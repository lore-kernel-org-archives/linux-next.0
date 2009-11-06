From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: sparc tree build failure
Date: Fri, 06 Nov 2009 00:19:30 -0800 (PST)
Message-ID: <20091106.001930.121210402.davem@davemloft.net>
References: <20091106180248.7a6aa9ba.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:36263
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752887AbZKFITE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Nov 2009 03:19:04 -0500
In-Reply-To: <20091106180248.7a6aa9ba.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, kristoffer@gaisler.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 6 Nov 2009 18:02:48 +1100

> Caused by commit d4ac42a582e46d7f86f0acb4253a310423c72c4c ("sparc:
> Support for GRLIB APBUART serial port") (yes again :-)).  I have applied
> my patch to make it only build on SPARC again ...
> 
> (Including linux/of_platform.h - where struct of_platform_driver,
> of_register_driver() and of_platform_bus_type are declared - would be a
> good start ...  and the code should probably be using
> of_register_platform_driver() instead of of_register_driver() in any
> case.)

Sorry, sparc is getting those headers indirectly.

I'll fix this up.
