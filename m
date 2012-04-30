From: Ryan Mallon <rmallon@gmail.com>
Subject: Request for inclusion of ep93xx tree in linux-next
Date: Tue, 01 May 2012 08:48:09 +1000
Message-ID: <4F9F16A9.9090108@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:52704 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756615Ab2D3WsP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 30 Apr 2012 18:48:15 -0400
Received: by pbbrp8 with SMTP id rp8so3760510pbb.19
        for <linux-next@vger.kernel.org>; Mon, 30 Apr 2012 15:48:15 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, H Hartley Sweeten <hartleys@visionengravers.com>, Mika Westerberg <mika.westerberg@iki.fi>, Arnd Bergmann <arnd@arndb.de>
Cc: arm@kernel.org, "'linux-arm-kernel@lists.infradead.org'" <linux-arm-kernel@lists.infradead.org>, linux-next@vger.kernel.org

Hi Stephen,

Can you please add the following branches:

  ep93xx-cleanup
  ep93xx-fixes

from the ep93xx git tree:

  git://github.com/RyanMallon/linux-ep93xx.git

To linux-next. Both branches are stable and based on v3.4-rc2. Testing
for the tree is covered by the arm ep93xx_defconfig.

Thanks,
~Ryan
