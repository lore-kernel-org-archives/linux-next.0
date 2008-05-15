From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: powercp-next build failure
Date: Thu, 15 May 2008 02:59:24 -0700 (PDT)
Message-ID: <20080515.025924.244953352.davem@davemloft.net>
References: <20080515145913.5436adb9.sfr@canb.auug.org.au>
	<18476.327.432007.66792@cargo.ozlabs.ibm.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:41833
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1752993AbYEOJ73 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 15 May 2008 05:59:29 -0400
In-Reply-To: <18476.327.432007.66792@cargo.ozlabs.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: paulus@samba.org
Cc: linux-next@vger.kernel.org, linuxppc-dev@ozlabs.org, olaf@aepfle.de, sfr@canb.auug.org.au

From: Paul Mackerras <paulus@samba.org>
Date: Thu, 15 May 2008 19:24:23 +1000

> > drivers/of/device.c: In function `modalias_show':
> > drivers/of/device.c:66: error: implicit declaration of function `of_device_get_modalias'
> 
> Dave, how would you prefer to fix this?  We could move
> of_device_get_modalias into drivers/of/device.c, or I could simply
> revert that commit.

Feel free to move that function into drivers/of/device.c
