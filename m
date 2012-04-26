From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM:mfd: fix ezx-pcap build failure
Date: Thu, 26 Apr 2012 23:04:38 +0100
Message-ID: <20120426220437.GC9415@sirena.org.uk>
References: <1335366163-12920-1-git-send-email-mark.asselstine@windriver.com>
 <20120426215258.GG24211@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:58500 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757554Ab2DZWEp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 26 Apr 2012 18:04:45 -0400
Content-Disposition: inline
In-Reply-To: <20120426215258.GG24211@n2100.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Mark Asselstine <mark.asselstine@windriver.com>, Grant Likely <grant.likely@secretlab.ca>, openezx-devel@lists.openezx.org, linux-next@vger.kernel.org, sameo@linux.intel.com, linux-arm-kernel@lists.infradead.org, haojian.zhuang@marvell.com

On Thu, Apr 26, 2012 at 10:52:58PM +0100, Russell King - ARM Linux wrote:

> The real answer is to fix SPI et.al. so that its possible to pass the
> _GPIO_ number into this driver (that's what the driver wants for its
> interrupt line after all).  To fix that, SPI folk need to get involved
> (added Grant as a first step.)

Or, in the short term, add platform data to pass in a GPIO and ignore
any IRQ that might get passed in.
