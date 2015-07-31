From: Guenter Roeck <linux@roeck-us.net>
Subject: Build error in -next due to 'drivers/video/fbdev/atyfb: Replace MTRR
 UC hole with strong UC'
Date: Thu, 30 Jul 2015 19:26:00 -0700
Message-ID: <55BADCB8.3030503@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:35848 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750991AbbGaC0D (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 30 Jul 2015 22:26:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Luis R. Rodriguez" <mcgrof@suse.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>

Hi Luis,

probably the zero-day build already told you, but just in case:

Your commit 'drivers/video/fbdev/atyfb: Replace MTRR UC hole with strong UC'
causes build errors for architectures which don't support ioremap_uc.
This affects at least the alpha architecture, though there may be others.

Here is the build error:

drivers/video/fbdev/aty/atyfb_base.c: In function 'atyfb_setup_generic':
drivers/video/fbdev/aty/atyfb_base.c:3447:2: error: implicit declaration of function 'ioremap_uc'

Thanks,
Guenter
