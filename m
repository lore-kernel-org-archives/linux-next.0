From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree
Date: Mon, 07 Jul 2008 22:14:43 -0700 (PDT)
Message-ID: <20080707.221443.109466077.davem@davemloft.net>
References: <20080708141004.4a0aef3c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:34730
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1750823AbYGHFOo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 Jul 2008 01:14:44 -0400
In-Reply-To: <20080708141004.4a0aef3c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, romieu@fr.zoreil.com, jgarzik@redhat.com, mingo@elte.hu, gorcunov@gmail.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 8 Jul 2008 14:10:04 +1000

> Today's linux-next merge of the net tree got a conflict in
> arch/x86/configs/x86_64_defconfig between commits
> 5cb04df8d3f03e37a19f2502591a84156be71772 ("x86: defconfig updates") and
> 622e3f28e50fe30cc199c735440cd7c75e0033b0 ("x86: 64-bit defconfig remake")
> from the x86 tree and commit e84e1dcea0ead6cea0fc55b949a7f018727e93c3
> ("netdev: remove unused S2IO_NAPI") and
> 768cea593522d816b374149f3bf35e7c246fc8d0 ("amd8111e: delete non NAPI code
> from the driver") from the net tree.
> 
> I thought we didn't do defconfig updates for things like this as just
> running "make oldconfig" should have the same effect ... I used the
> version from the x86 tree.

That defconfig bit is a mistake, I'll try to undo that.

Thanks!
