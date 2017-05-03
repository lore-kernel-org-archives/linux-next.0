From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net-next tree with Linus' tree
Date: Wed, 03 May 2017 00:08:56 -0400 (EDT)
Message-ID: <20170503.000856.253462815755050143.davem@davemloft.net>
References: <20170503110703.0945929d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:58800 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750819AbdECEJB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 May 2017 00:09:01 -0400
In-Reply-To: <20170503110703.0945929d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, egtvedt@samfundet.no, hskinnemoen@gmail.com, nicolas.ferre@microchip.com, johunt@akamai.com, sridhar.samudrala@intel.com, alexander.h.duyck@intel.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 3 May 2017 11:07:03 +1000

> Hi all,
> 
> Today's linux-next merge of the net-next tree got a conflict in:
> 
>   arch/avr32/include/uapi/asm/socket.h
> 
> between commit:
> 
>   26202873bb51 ("avr32: remove support for AVR32 architecture")
> 
> from Linus' tree and commits:
> 
>   a2d133b1d465 ("sock: introduce SO_MEMINFO getsockopt")
>   6d4339028b35 ("net: Introduce SO_INCOMING_NAPI_ID"
>   5daab9db7b65 ("New getsockopt option to get socket cookie")
> 
> from the net-next tree.
> 
> I fixed it up (I removed the file) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Duly noted in the pull request I sent to Linus, and now that he took
net-next in it is resolved in his tree.

Thanks!
