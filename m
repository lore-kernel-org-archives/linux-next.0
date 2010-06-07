From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] Revert adding some arch-specific signal syscalls to <linux/syscalls.h>.
Date: Mon, 7 Jun 2010 15:18:33 +0200
Message-ID: <201006071518.34013.arnd@arndb.de>
References: <201006071254.o57CsAwG002729@farm-0002.internal.tilera.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:63777 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755132Ab0FGNSq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Jun 2010 09:18:46 -0400
In-Reply-To: <201006071254.o57CsAwG002729@farm-0002.internal.tilera.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chris Metcalf <cmetcalf@tilera.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

On Monday 07 June 2010, Chris Metcalf wrote:
> It turns out there is some variance on the calling conventions for
> these syscalls, and <asm-generic/syscalls.h> is already the mechanism
> used to handle this.  Switch arch/tile over to using that mechanism and
> tweak the calling conventions for a couple of tile syscalls to match
> <asm-generic/syscalls.h>.
> 
> Signed-off-by: Chris Metcalf <cmetcalf@tilera.com>

Looks good to me.

Acked-by: Arnd Bergmann <arnd@arndb.de>
