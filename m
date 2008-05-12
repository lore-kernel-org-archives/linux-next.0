From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: sparc build failure
Date: Mon, 12 May 2008 00:40:31 -0700 (PDT)
Message-ID: <20080512.004031.205637810.davem@davemloft.net>
References: <20080512173658.01dc993f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:44813
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1756182AbYELHkh (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 12 May 2008 03:40:37 -0400
In-Reply-To: <20080512173658.01dc993f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 12 May 2008 17:36:58 +1000

> Seems to have been introduced by commit
> 28e6103665301ce60634e8a77f0b657c6cc099de ("sparc: Fix debugger syscall
> restart interactions") which went into Linus' tree recently ("bool" seems
> to be missing a definition).

Fixed in current sparc-2.6.git

