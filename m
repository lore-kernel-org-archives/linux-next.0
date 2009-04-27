From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] virtio_net: memset scatterlist before using
Date: Sun, 26 Apr 2009 23:30:14 -0700 (PDT)
Message-ID: <20090426.233014.216353908.davem@davemloft.net>
References: <20090423163847.200f227e.sfr@canb.auug.org.au>
	<1240583823.16438.14.camel@lappy>
	<200904262228.09451.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:50539
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1753748AbZD0GaV (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Apr 2009 02:30:21 -0400
In-Reply-To: <200904262228.09451.rusty@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: rusty@rustcorp.com.au
Cc: alex.williamson@hp.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org, LKML.netdev@vger.kernel.org

From: Rusty Russell <rusty@rustcorp.com.au>
Date: Sun, 26 Apr 2009 22:28:08 +0930

> On Sat, 25 Apr 2009 12:07:03 am Alex Williamson wrote:
>> A powerpc gcc-4.4 build generates the following warnings:
>> 
>> drivers/net/virtio_net.c: In function 'virnet_vlan_rx_add_vid':
>> include/linux/scatterlist.h:57: warning: 'sg' is used uninitialized in this function
>> drivers/net/virtio_net.c:746: note: 'sg' was declared here
>> drivers/net/virtio_net.c: In function 'virnet_vlan_rx_kill_vid':
>> include/linux/scatterlist.h:57: warning: 'sg' is used uninitialized in this function
>> drivers/net/virtio_net.c:758: note: 'sg' was declared here
>> 
>> We need to clear the scatterlist before using it.  This sg entry will
>> get copied into another scatterlist before it's used, so memset it
>> rather than using sg_init_table or sg_init_one to avoid a bogus end
>> marker.
> 
> This will break CONFIG_DEBUG_SG=y.
> 
> Why not sg_init_one?  This is what it's for...

Right.

Also, patch not sent to netdev due to a typo, and if it's not
sent to netdev it won't get tracked in patchwork and is therefore
likely to get lost.
