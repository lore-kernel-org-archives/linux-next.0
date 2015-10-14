From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the arm-soc tree
Date: Thu, 15 Oct 2015 10:19:20 +1100
Message-ID: <20151015101920.7fa592f7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50187 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753717AbbJNXTW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 14 Oct 2015 19:19:22 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Antoine Tenart <antoine.tenart@free-electrons.com>, Thomas Hebb <tommyhebb@gmail.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

Hi all,

After merging the arm-soc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arch/arm/boot/dts/berlin2q.dtsi:62.24-25 syntax error
FATAL ERROR: Unable to parse input tree

I can't see what caused this error, so I have just used the arm-soc tree
from next-20151013 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
