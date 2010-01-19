From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for January 19 (vhost_net)
Date: Tue, 19 Jan 2010 10:41:39 -0800
Message-ID: <20100119104139.2ec9164b.randy.dunlap@oracle.com>
References: <20100119181041.ab55f645.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:47154 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750995Ab0ASSm2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 19 Jan 2010 13:42:28 -0500
In-Reply-To: <20100119181041.ab55f645.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, netdev <netdev@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, 19 Jan 2010 18:10:41 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20100118:


When CONFIG_TUN is not enabled:

drivers/built-in.o: In function `get_socket':
net.c:(.text+0x2899a3): undefined reference to `tun_get_socket'


so VHOST_NET can either depend on TUN or select TUN, but if it
selects TUN, it will also need to select CRC32.

---
~Randy
