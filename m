From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the sound tree
Date: Sun, 31 Aug 2008 21:36:07 -0700 (PDT)
Message-ID: <20080831.213607.09599119.davem@davemloft.net>
References: <20080901142030.513d82eb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:54236
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1750753AbYIAEgN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 1 Sep 2008 00:36:13 -0400
In-Reply-To: <20080901142030.513d82eb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: tiwai@suse.de, linux-next@vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 1 Sep 2008 14:20:30 +1000

> Today's linux-next merge of the sound tree got a conflict in
> sound/core/memalloc.c between commit
> 759ee81be6d87c150ea2b300c221b4fec8b5f646 ("alsa: Remove special SBUS
> dma support code.") from the sparc tree and commit
> d3acb92557b99feb051ac173d119d06900c364f5 ("ALSA: Kill snd_assert()
> in sound/core/*") from the sound tree.
> 
> The former removes code modified by the latter.  I just removed the
> code.  I will carry the fixup.

Thanks Stephen.

Takashi-san, FYI, in the Sparc tree we have removed all SBUS specific
BUS probing and device code, all drivers are now generic and use plain
linux/dma-mapping.h interfaces.

So the sound layer SBUS code was superfluous and unused, so we
deleted it.
