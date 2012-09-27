From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: ASoC on today's linux-next: dma_alloc_writecombine() failing at least
 on OMAP platforms
Date: Thu, 27 Sep 2012 15:16:45 +0300
Message-ID: <506443AD.1060201@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from na3sys009aog101.obsmtp.com ([74.125.149.67]:46190 "EHLO
	na3sys009aog101.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752418Ab2I0MPh (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 27 Sep 2012 08:15:37 -0400
Received: by obbuo13 with SMTP id uo13so1656888obb.19
        for <linux-next@vger.kernel.org>; Thu, 27 Sep 2012 05:15:35 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, "Girdwood, Liam" <lrg@ti.com>, linux-next@vger.kernel.org

Hello,

I tried today's linux-next on OMAP platform and audio is not probing be=
cause
dma_alloc_writecombine() fails to get the area.
My linux-next from two days ago works OK and I don't see anything direc=
tly
connected to OMAP which can cause this failure.

Can someone try linux-next on non OMAP platform to see if
dma_alloc_writecombine() works there?

Meanwhile I'll try to find the reason why it fails for me.

Thanks,
P=E9ter
