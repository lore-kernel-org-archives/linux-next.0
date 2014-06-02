From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 2/2] of: of_mdio: export symbol of_mdiobus_link_phydev
Date: Mon, 02 Jun 2014 10:43:28 -0700 (PDT)
Message-ID: <20140602.104328.1194997557262570284.davem@davemloft.net>
References: <1401708766-5530-1-git-send-email-zonque@gmail.com>
	<1401708766-5530-2-git-send-email-zonque@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:35203 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751962AbaFBRn3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Jun 2014 13:43:29 -0400
In-Reply-To: <1401708766-5530-2-git-send-email-zonque@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: zonque@gmail.com
Cc: linux-next@vger.kernel.org, netdev@vger.kernel.org, sfr@canb.auug.org.au

From: Daniel Mack <zonque@gmail.com>
Date: Mon,  2 Jun 2014 13:32:46 +0200

> Make of_mdiobus_link_phydev externally available.
> This fixes CONFIG_OF_MDIO=m.
> 
> Signed-off-by: Daniel Mack <zonque@gmail.com>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Fixes: 86f6cf41272 ("net: of_mdio: add of_mdiobus_link_phydev()")

Applied.
