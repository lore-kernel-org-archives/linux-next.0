From: John Doe <foobar5252@hotmail.com>
Subject: Windows does not like =?utf-8?b?YGF1eGA=?= file names.
Date: Tue, 19 Nov 2013 23:15:07 +0000 (UTC)
Message-ID: <loom.20131120T000349-818@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:60154 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752166Ab3KSXUF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 19 Nov 2013 18:20:05 -0500
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glkn-linux-next@m.gmane.org>)
	id 1ViuaR-0007t5-Ty
	for linux-next@vger.kernel.org; Wed, 20 Nov 2013 00:20:04 +0100
Received: from h246.46.28.71.dynamic.ip.windstream.net ([71.28.46.246])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-next@vger.kernel.org>; Wed, 20 Nov 2013 00:20:03 +0100
Received: from foobar5252 by h246.46.28.71.dynamic.ip.windstream.net with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-next@vger.kernel.org>; Wed, 20 Nov 2013 00:20:03 +0100
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org

Hi,

drivers/gpu/drm/nouveau/core/subdev/i2c/aux.c 

When trying to clone the linux kernel on Windows, that file will fail due to
Windows not liking the file name `aux` since it's one of the reserved words
used for DOS devices.
