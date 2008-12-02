From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for December 2 (mfd)
Date: Tue, 02 Dec 2008 09:57:51 -0800
Message-ID: <4935771F.6050500@oracle.com>
References: <20081202173101.e2b72437.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:64944 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750799AbYLBR6I (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Dec 2008 12:58:08 -0500
In-Reply-To: <20081202173101.e2b72437.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, sameo@openedhand.com

Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20081201:
> 
> Today's tree fails the powerpc allyesconfig build.


allyesconfig on x86_64 fails with:

linux-next-20081202/drivers/mfd/twl4030-core.c:682: undefined reference to `clk_get_rate'
linux-next-20081202/drivers/mfd/twl4030-core.c:683: undefined reference to `clk_put'


-- 
~Randy
