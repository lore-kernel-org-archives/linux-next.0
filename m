From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for June 24 (ivtv)
Date: Tue, 24 Jun 2008 17:24:14 -0700
Message-ID: <20080624172414.22c91416.randy.dunlap@oracle.com>
References: <20080624175612.cdf29651.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:12967 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750770AbYFYA3X (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 24 Jun 2008 20:29:23 -0400
In-Reply-To: <20080624175612.cdf29651.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, v4l-dvb-maintainer@linuxtv.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, hverkuil@xs4all.nl, ivtv-devel@ivtvdriver.org


ivtv-ioctl.c uses struct fields that are protected by
CONFIG_VIDEO_ADV_DEBUG even when that config option is not set, causing:

build-r2146.out:/local/linsrc/linux-next-20080624/drivers/media/video/ivtv/ivtv-ioc
tl.c:1899: error: 'struct video_device' has no member named 'vidioc_g_register'
build-r2146.out:/local/linsrc/linux-next-20080624/drivers/media/video/ivtv/ivtv-ioc
tl.c:1900: error: 'struct video_device' has no member named 'vidioc_s_register'
build-r2146.out:make[5]: *** [drivers/media/video/ivtv/ivtv-ioctl.o] Error 1


---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/
