From: Paul Mackerras <paulus@samba.org>
Subject: Re: linux-next: powercp-next build failure
Date: Thu, 15 May 2008 19:24:23 +1000
Message-ID: <18476.327.432007.66792@cargo.ozlabs.ibm.com>
References: <20080515145913.5436adb9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:52143 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753669AbYEOJYb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 15 May 2008 05:24:31 -0400
In-Reply-To: <20080515145913.5436adb9.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, linuxppc-dev@ozlabs.org, Olaf Hering <olaf@aepfle.de>, Stephen Rothwell <sfr@canb.auug.org.au>

> drivers/of/device.c: In function `modalias_show':
> drivers/of/device.c:66: error: implicit declaration of function `of_device_get_modalias'

Dave, how would you prefer to fix this?  We could move
of_device_get_modalias into drivers/of/device.c, or I could simply
revert that commit.

Paul.
