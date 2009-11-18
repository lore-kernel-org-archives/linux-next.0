From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net tree build failure
Date: Tue, 17 Nov 2009 23:05:30 -0800 (PST)
Message-ID: <20091117.230530.108140449.davem@davemloft.net>
References: <20091118165145.d0c3114b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:57242
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752251AbZKRHFN (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 18 Nov 2009 02:05:13 -0500
In-Reply-To: <20091118165145.d0c3114b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, sbhatewara@vmware.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 18 Nov 2009 16:51:45 +1100

> drivers/net/vmxnet3/vmxnet3_drv.c: In function 'vmxnet3_prepare_tso':
> drivers/net/vmxnet3/vmxnet3_drv.c:826: error: implicit declaration of function 'csum_ipv6_magic'
> 
> Revealed by commit 115924b6bdc7cc6bf7da5b933b09281e1f4e17a9 ("net:
> Getting rid of the x86 dependency to built vmxnet3") which allowed this
> driver to be built on PowerPC at all.

Enabling on more platforms helps find problems like this :-)

> Subject: [PATCH] net: using csum_ipv6_magic requires including net/ip6_checksum.h
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Applied, thanks!
