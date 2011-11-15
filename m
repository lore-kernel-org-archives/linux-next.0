From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: AT91 defconfig
Date: Tue, 15 Nov 2011 07:03:25 +0100
Message-ID: <20111115060325.GA19322@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mo4.mail-out.ovh.net ([178.32.228.4]:54426 "EHLO
	mo4.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753329Ab1KOIbm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 15 Nov 2011 03:31:42 -0500
Received: from mail172.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo4.mail-out.ovh.net (Postfix) with SMTP id 6BDDF100451F
	for <linux-next@vger.kernel.org>; Tue, 15 Nov 2011 07:11:21 +0100 (CET)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org

HI Stephen,

	the at91 defconfig have changed

	the followong defconfig at91sam9260ek_defconfig,
	at91sam9g20ek_defconfig, at91sam9rlek_defconfig, at91cap9adk_defconfig
	are replace by at91sam9260_defconfig, at91sam9g20_defconfig
	at91cap9_defconfig and at91sam9rl_defconfig

	where all the board are enabled

	to cover all board now we just need to compile this list of defconfg
	on AT91
	at91cap9_defconfig  at91rm9200_defconfig  at91sam9260_defconfig
	at91sam9261_defconfig  at91sam9263_defconfig  at91sam9g20_defconfig
	at91sam9g45_defconfig  at91sam9rl_defconfig

Best Regards,
J.
