From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the final tree (net
 tree related)
Date: Wed, 28 Jul 2010 22:21:05 -0700 (PDT)
Message-ID: <20100728.222105.26961969.davem@davemloft.net>
References: <20100729141306.f27fad7a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:36831
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750845Ab0G2FUx (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 29 Jul 2010 01:20:53 -0400
In-Reply-To: <20100729141306.f27fad7a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, dmitry@broadcom.com, eilong@broadcom.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 29 Jul 2010 14:13:06 +1000

> net: bnx2x_cmn.c needs net/ip6_checksum.h for csum_ipv6_magic
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Applied, thanks Stephen.
