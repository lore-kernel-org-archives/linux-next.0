From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for November 19 (mtd build error)
Date: Wed, 19 Nov 2008 11:06:09 -0800
Message-ID: <492463A1.3000306@oracle.com>
References: <20081119175917.7d21cf77.sfr@canb.auug.org.au>	 <20081119105321.477e618a.randy.dunlap@oracle.com> <1227121104.27728.618.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:38086 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752824AbYKSTGg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 Nov 2008 14:06:36 -0500
In-Reply-To: <1227121104.27728.618.camel@macbook.infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Michael Brown <mbrown@fensystems.co.uk>, Ben Hutchings <bhutchings@solarflare.com>

David Woodhouse wrote:
> On Wed, 2008-11-19 at 10:53 -0800, Randy Dunlap wrote:
>> On Wed, 19 Nov 2008 17:59:17 +1100 Stephen Rothwell wrote:
>>
>> (.text+0x104879): undefined reference to `add_mtd_device'
>> (.text+0x1048e1): undefined reference to `del_mtd_device'
>> mtd.c:(.text+0x104999): undefined reference to `mtd_erase_callback'
>>
>>
>> config attached.
> 
> CONFIG_SFC_MTD=y
> 
> What's that?

drivers/net/sfc/Kconfig:

config SFC_MTD
	bool "Solarflare Solarstorm SFC4000 flash MTD support"
	depends on SFC && MTD
	default y
	help
	  This exposes the on-board flash memory as an MTD device (e.g.
          /dev/mtd1).  This makes it possible to upload new boot code
          to the NIC.


sfc people added to cc.

-- 
~Randy
