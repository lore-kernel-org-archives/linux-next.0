From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the mips tree with the net-current
 tree
Date: Mon, 23 Nov 2009 19:43:43 -0800 (PST)
Message-ID: <20091123.194343.232255103.davem@davemloft.net>
References: <20091124113717.c5d86d41.sfr@canb.auug.org.au>
	<20091124011958.GA8105@linux-mips.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:57642
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757880AbZKXDn0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Nov 2009 22:43:26 -0500
In-Reply-To: <20091124011958.GA8105@linux-mips.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: ralf@linux-mips.org
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, a.beregalov@gmail.com, florian@openwrt.org, linux-mips@linux-mips.org, manuel.lauss@googlemail.com

From: Ralf Baechle <ralf@linux-mips.org>
Date: Tue, 24 Nov 2009 01:19:58 +0000

> On Tue, Nov 24, 2009 at 11:37:17AM +1100, Stephen Rothwell wrote:
> 
>> Hi Ralf,
>> 
>> Today's linux-next merge of the mips tree got a conflict in
>> drivers/net/au1000_eth.c between commit
>> 63edaf647607795a065e6956a79c47f500dc8447 ("Au1x00: fix crash when trying
>> register_netdev()") from the net-current tree and commit
>> 6cdbc95856e7f4ab4e7b2f2bdab5c3844537ad83 ("NET: au1000-eth: convert to
>> platform_driver model") from the mips tree.
>> 
>> It looks to me that the mips tree change supercedes the net-current one
>> (since it moves the register_netdev() call much later), so I just used
>> this file from the mips tree.
> 
> I agree.  David, can you just drop the net-current patch then?  This fix
> is still needed for -stable however.

Why would I do that?  The bug fix is necessary for 2.6.32 too.

You're not going to merge a platform_driver conversion this late
in the -rc series are you?
