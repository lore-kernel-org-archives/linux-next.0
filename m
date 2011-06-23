From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the wireless tree
Date: Wed, 22 Jun 2011 20:46:33 -0700 (PDT)
Message-ID: <20110622.204633.1270632754342154052.davem@davemloft.net>
References: <20110623130317.b3a6085e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([198.137.202.13]:42077 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758238Ab1FWDum (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Jun 2011 23:50:42 -0400
In-Reply-To: <20110623130317.b3a6085e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linville@tuxdriver.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, anderson.briglia@openbossa.org, anderson.lizardo@openbossa.org, bruna.moreira@openbossa.org, vinicius.gomes@openbossa.org, padovan@profusion.mobi, adobriyan@gmail.com, netdev@vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 23 Jun 2011 13:03:17 +1000

> Caused by commit d22ef0bc83c5 ("Bluetooth: Add LE SMP Cryptoolbox
> functions").  Missing include file, presumably.  This batch has been in
> the bluetooth tree since June 14, so it may have been exposed by the
> removal of linux/mm.h from netdevice.h ...

This is almost certainly the reason.
