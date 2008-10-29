From: Andreas Oberritter <obi@linuxtv.org>
Subject: Re: linux-next: v4l-dvb tree build failure
Date: Wed, 29 Oct 2008 13:26:05 +0100
Message-ID: <4908565D.6020000@linuxtv.org>
References: <20081029132011.920a9b6f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ffm.saftware.de ([83.141.3.46]:33711 "EHLO ffm.saftware.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752372AbYJ2Mel (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Oct 2008 08:34:41 -0400
In-Reply-To: <20081029132011.920a9b6f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-next@vger.kernel.org

Hello Stephen,

Stephen Rothwell wrote:
> Hi Mauro,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> drivers/media/dvb/dvb-core/dvbdev.c: In function 'dvb_register_device':
> drivers/media/dvb/dvb-core/dvbdev.c:254: error: implicit declaration of function 'nums2minor'
> 
> Caused by commit f3d9182030d9655d9ffff33dfceb45b4a127b6ec ("V4L/DVB
> (9361): Dynamic DVB minor allocation") which clearly has not even been
> built with CONFIG_DVB_DYNAMIC_MINORS=y.
> 
> I applied the following patch.
> 
> More care required, please.

thank you! The error is hidden by #if LINUX_VERSION_CODE > KERNEL_VERSION(2, 6, 27)
in the v4l-dvb repository. That's why it didn't show up during testing.

Regards,
Andreas
