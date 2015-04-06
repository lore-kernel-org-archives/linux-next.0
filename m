From: Nishanth Menon <nm@ti.com>
Subject: LDP: next-20150402: twl4030 regression?
Date: Mon, 06 Apr 2015 08:21:49 -0500
Message-ID: <5522886D.5050409@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:36210 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752834AbbDFNVv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 6 Apr 2015 09:21:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux OMAP Mailing List <linux-omap@vger.kernel.org>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org

https://github.com/nmenon/kernel-test-logs/blob/next-20150401/omap2plus_defconfig/ldp.txt
looks clean, but

https://github.com/nmenon/kernel-test-logs/blob/next-20150402/omap2plus_defconfig/ldp.txt#L488
seems to have picked up a regression in the regulator driver.

Master looks clean as well

https://github.com/nmenon/kernel-test-logs/blob/v4.0-rc6/omap2plus_defconfig/ldp.txt
