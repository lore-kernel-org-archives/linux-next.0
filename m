From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] dnet: replace obsolete *netif_rx_* functions with
 *napi_*
Date: Fri, 13 Mar 2009 09:51:57 -0700 (PDT)
Message-ID: <20090313.095157.118123047.davem@davemloft.net>
References: <20090313131655.33117fb9.sfr@canb.auug.org.au>
	<1236940253-4944-1-git-send-email-yanok@emcraft.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:55780
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1757315AbZCMQwL (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Mar 2009 12:52:11 -0400
In-Reply-To: <1236940253-4944-1-git-send-email-yanok@emcraft.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: yanok@emcraft.com
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, bhutchings@solarflare.com

From: Ilya Yanok <yanok@emcraft.com>
Date: Fri, 13 Mar 2009 13:30:53 +0300

> *netif_rx_* functions is obsolete and removed in newer kernels so
> we need to use corresponding *napi_* functions instead.
> 
> Signed-off-by: Ilya Yanok <yanok@emcraft.com>

Applied, thanks.
