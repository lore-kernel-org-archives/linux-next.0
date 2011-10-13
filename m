From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [alsa-devel] linux-next: Tree for Oct 12
 (sound/soc/codecs/wm1250-ev1)
Date: Thu, 13 Oct 2011 11:24:28 +0100
Message-ID: <20111013102427.GG1098@sirena.org.uk>
References: <20111012175425.a2e3e6e6a92265e433aeca25@canb.auug.org.au>
 <4E9634C9.3020404@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:50055 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752571Ab1JMKYh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 13 Oct 2011 06:24:37 -0400
Content-Disposition: inline
In-Reply-To: <4E9634C9.3020404@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, alsa-devel@alsa-project.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Liam Girdwood <lrg@ti.com>

On Wed, Oct 12, 2011 at 05:46:01PM -0700, Randy Dunlap wrote:

> When no GPIO kconfig options are enabled:
> (not GPIOLIB, not GENERIC_GPIO):

As ever the consumer side GPIO API is supposed to stub itself out when
not in use.
