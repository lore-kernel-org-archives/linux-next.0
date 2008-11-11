From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree
Date: Mon, 10 Nov 2008 23:00:49 -0800 (PST)
Message-ID: <20081110.230049.128216257.davem@davemloft.net>
References: <20081110140253.f2c1d262.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:52725
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751500AbYKKHAt (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 11 Nov 2008 02:00:49 -0500
In-Reply-To: <20081110140253.f2c1d262.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, alan@lxorguk.ukuu.org.uk, johannes@sipsolutions.net

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 10 Nov 2008 14:02:53 +1100

> Today's linux-next merge of the net tree got a conflict in
> drivers/message/fusion/mptlan.c between commit
> 54e7ff9d6249ba88e393d7fbc8008da9279723be ("trivial: MPT fusion - remove
> long dead code") from Linus' tree and commit
> 7c510e4b730a92cecf94ada45c989d8be0200d47 ("net: convert more to %pM")
> from the net tree.
> 
> The former just removed some of the code that the latter modified.  I
> have removed the code and expect the ocnflict will be fixed in your tree
> soon.

Thanks for the heads up.  There will be even more conflicts,
between net-2.6 and net-next-2.6, that will need resolving
as well.

I hope to have this resolved within the next day.
