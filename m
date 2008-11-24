From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net tree build failure
Date: Sun, 23 Nov 2008 19:56:02 -0800 (PST)
Message-ID: <20081123.195602.16120267.davem@davemloft.net>
References: <20081124134301.8aebd20f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:57437
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751586AbYKXD4F (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sun, 23 Nov 2008 22:56:05 -0500
In-Reply-To: <20081124134301.8aebd20f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, shemminger@vyatta.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 24 Nov 2008 13:43:01 +1100

> Caused by commit 4e4fd4e485ad63a9074ff09a9b53ffc7a5c594ec ("ne2k: convert
> to net_device_ops").
> 
> I have dropped the net tree again.

Can't you just revert the patch to fix the build instead? :-/

The net tree won't get much testing if every obscure driver build
failure makes the net tree get removed.
