From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: sparc64 build failure
Date: Tue, 08 Jul 2008 02:13:51 -0700 (PDT)
Message-ID: <20080708.021351.204695962.davem@davemloft.net>
References: <20080708190837.bcdcbbd6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:34054
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1752879AbYGHJNv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 Jul 2008 05:13:51 -0400
In-Reply-To: <20080708190837.bcdcbbd6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, andi@firstfloor.org, greg@kroah.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 8 Jul 2008 19:08:37 +1000

> Caused by commit 5b01a6a61c48d8e6ab4679d6e6208f5962d07b85 ("sysdev: Pass
> the attribute to the low level sysdev show/store function") from the
> driver-core tree.  I have applied the patch below.

If the driver-core folks could add this patch to their tree to that
changeset, I'd appreciate it. :)

Acked-by: David S. Miller <davem@davemloft.net>
