From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for December 3 (MFD)
Date: Wed, 03 Dec 2008 17:33:39 -0800
Message-ID: <49373373.2080901@oracle.com>
References: <20081203183602.c06f8c39.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:64284 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752971AbYLDBdw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Dec 2008 20:33:52 -0500
In-Reply-To: <20081203183602.c06f8c39.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, sameo@openedhand.com

Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20081202:
> 
> Today's tree fails the powerpc allyesconfig build.


drivers/mfd/twl4030-core.c uses clk_get_rate() and clk_put(),
but they don't seem to exist for x86, so I'm getting build errors:

twl4030-core.c:(.text+0x16a797): undefined reference to `clk_get_rate'
twl4030-core.c:(.text+0x16a7a6): undefined reference to `clk_put'


~Randy
