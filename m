From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Build break in drivers/net/ethernet/mellanox/mlx4/eq.c:1240  (was
 Re: linux-next: Tree for Jun 1)
Date: Tue, 02 Jun 2015 10:58:52 +1000
Message-ID: <1433206732.26379.7.camel@ellerman.id.au>
References: <20150601231028.1f3c02fd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48361 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750922AbbFBA6y (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Jun 2015 20:58:54 -0400
In-Reply-To: <20150601231028.1f3c02fd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, matanb@mellanox.com, idos@mellanox.com, ogerlitz@mellanox.com, "David S.Miller" <davem@davemloft.net>

On Mon, 2015-06-01 at 23:10 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150529:


Commit c66fa19c "net/mlx4: Add EQ pool" breaks the SMP=n build for powerpc:

  drivers/net/ethernet/mellanox/mlx4/eq.c:1240:11: error: 'eq' undeclared (first use in this function)
  make[6]: *** [drivers/net/ethernet/mellanox/mlx4/eq.o] Error 1

  http://kisskb.ellerman.id.au/kisskb/buildresult/12435167/


This will also break for any config with CONFIG_RFS_ACCEL=n.

cheers
