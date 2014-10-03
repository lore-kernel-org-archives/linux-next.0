From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: linux-next: build failure after merge of the arm-soc tree
Date: Fri, 3 Oct 2014 08:56:23 +0100
Message-ID: <20141003075623.GU5182@n2100.arm.linux.org.uk>
References: <20141002113742.2b521495@canb.auug.org.au> <14357384.nIoLZkacVq@wuerfel> <542E4721.8040300@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:51761 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750823AbaJCH4s (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 3 Oct 2014 03:56:48 -0400
Content-Disposition: inline
In-Reply-To: <542E4721.8040300@collabora.co.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Olof Johansson <olof@lixom.net>, Stephen Rothwell <sfr@canb.auug.org.au>, Kukjin Kim <kgene.kim@samsung.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Oct 03, 2014 at 08:50:09AM +0200, Javier Martinez Canillas wrote:
> Hello Arnd, Stephen,
> 
> I'm so sorry about the breakage, when I posted this patch I mentioned that
> it was meant for the 3.18-rc cycle once 3.18-rc1 was released [0]. Because
> it fixes a regression caused by a patch queued in the clock tree for 3.18.
> I should had been more explicit about the dependencies to avoid confusions.

If a patch is known to cause a regression, it shouldn't be going in during
the merge window _or_ the fix patch should also go in during the merge
window via the same route to resolve the regression before it's noticable.

Given the number of changes which go in during the merge window, waiting
for -rc to fix a known bug *before* the merge window is not on - it breaks
the ability to bisect during the period where bisect really is needed.

-- 
FTTC broadband for 0.8mile line: currently at 9.5Mbps down 400kbps up
according to speedtest.net.
