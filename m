From: Ludovic Desroches <ludovic.desroches@atmel.com>
Subject: [PATCH 0/2] Fixes for next
Date: Mon, 28 Sep 2015 11:41:11 +0200
Message-ID: <1443433273-17417-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from eusmtp01.atmel.com ([212.144.249.243]:23655 "EHLO
	eusmtp01.atmel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932183AbbI1JlA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 28 Sep 2015 05:41:00 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linus.walleij@linaro.org, sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, nicolas.ferre@atmel.com, Ludovic Desroches <ludovic.desroches@atmel.com>

Hi Stephen, Linus,

Here are fixes for next. I did the at91-pio4 patches on top of next-20150916
which doesn't contain some tglx's updates about irqs.

Ludovic Desroches (2):
  pinctrl: at91-pio4: use irq_set_handler_locked
  pinctrl: at91-pio4: irq argument as been removed from irq flow
    handlers

 drivers/pinctrl/pinctrl-at91-pio4.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

-- 
2.5.0
