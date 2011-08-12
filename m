From: David Miller <davem@davemloft.net>
Subject: Re: [net-next] spider_net: fix compile issue introduced by driver
 move
Date: Thu, 11 Aug 2011 23:06:39 -0700 (PDT)
Message-ID: <20110811.230639.1484435085208010743.davem@davemloft.net>
References: <1313120000-12085-1-git-send-email-jeffrey.t.kirsher@intel.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([198.137.202.13]:44291 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750830Ab1HLGIn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 12 Aug 2011 02:08:43 -0400
In-Reply-To: <1313120000-12085-1-git-send-email-jeffrey.t.kirsher@intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: jeffrey.t.kirsher@intel.com
Cc: netdev@vger.kernel.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

From: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Date: Thu, 11 Aug 2011 20:33:20 -0700

> Both Spider net driver and Sun GEM driver use the sungem_phy.o object.
> This fix creates a Kconfig object for sungem_phy (like MDIO) so that
> both drivers require the SUNGEM_PHY object.
> 
> This has been compile tested for the Sun GEM driver.
> 
> Signed-off-by: Jeff Kirsher <jeffrey.t.kirsher@intel.com>

Applied, thanks Jeff.
