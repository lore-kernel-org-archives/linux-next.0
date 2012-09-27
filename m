From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: ASoC on today's linux-next: dma_alloc_writecombine() failing at
 least on OMAP platforms
Date: Thu, 27 Sep 2012 13:59:34 +0100
Message-ID: <20120927125934.GV4428@opensource.wolfsonmicro.com>
References: <506443AD.1060201@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:43115 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753546Ab2I0M7g (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 27 Sep 2012 08:59:36 -0400
Content-Disposition: inline
In-Reply-To: <506443AD.1060201@ti.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Girdwood, Liam" <lrg@ti.com>, linux-next@vger.kernel.org

On Thu, Sep 27, 2012 at 03:16:45PM +0300, Peter Ujfalusi wrote:

> Can someone try linux-next on non OMAP platform to see if
> dma_alloc_writecombine() works there?

> Meanwhile I'll try to find the reason why it fails for me.

Do you have CMA enabled?  There seems to be some breakage there for me
on Samsung platforms, I saw this affecting all DMA users yesterday along
with some other CMA related issues but didn't analyse it enough to
report it.
