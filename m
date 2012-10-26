From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Please add bcm2835 tree to linux-next
Date: Thu, 25 Oct 2012 21:02:07 -0600
Message-ID: <5089FD2F.9090507@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:47063 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755319Ab2JZDCR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 25 Oct 2012 23:02:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

StephenR,

Could you please add the bcm2835 ARM SoC tree to linux-next. It's
available at:

git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-rpi.git for-next

Its probably best to insert it into the list somewhere after the
existing arm-soc tree. I also maintain the Tegra tree, so if you insert
it right next to that, any issues related to me will be triggered at the
same time:-)

Right now, it's based on v3.7-rc2, plus 5 patches.

Thanks.
