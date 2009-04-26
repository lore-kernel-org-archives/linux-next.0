From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH] virtio_net: memset scatterlist before using
Date: Sun, 26 Apr 2009 22:28:08 +0930
Message-ID: <200904262228.09451.rusty@rustcorp.com.au>
References: <20090423163847.200f227e.sfr@canb.auug.org.au> <1240583823.16438.14.camel@lappy>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:47720 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750871AbZDZM6N (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 26 Apr 2009 08:58:13 -0400
In-Reply-To: <1240583823.16438.14.camel@lappy>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alex Williamson <alex.williamson@hp.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "David S. Miller" <davem@davemloft.net>, linux-next@vger.kernel.org, LKML.netdev@vger.kernel.org

On Sat, 25 Apr 2009 12:07:03 am Alex Williamson wrote:
> A powerpc gcc-4.4 build generates the following warnings:
> 
> drivers/net/virtio_net.c: In function 'virnet_vlan_rx_add_vid':
> include/linux/scatterlist.h:57: warning: 'sg' is used uninitialized in this function
> drivers/net/virtio_net.c:746: note: 'sg' was declared here
> drivers/net/virtio_net.c: In function 'virnet_vlan_rx_kill_vid':
> include/linux/scatterlist.h:57: warning: 'sg' is used uninitialized in this function
> drivers/net/virtio_net.c:758: note: 'sg' was declared here
> 
> We need to clear the scatterlist before using it.  This sg entry will
> get copied into another scatterlist before it's used, so memset it
> rather than using sg_init_table or sg_init_one to avoid a bogus end
> marker.

This will break CONFIG_DEBUG_SG=y.

Why not sg_init_one?  This is what it's for...

Thanks,
Rusty
