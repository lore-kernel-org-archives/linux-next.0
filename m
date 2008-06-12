From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Subject: Re: linux-next: mtd/avr32 merge conflict
Date: Thu, 12 Jun 2008 22:24:03 +0200
Message-ID: <20080612222403.18755932@siona.local>
References: <20080612145538.0835c0b8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from newsmtp5.atmel.com ([204.2.163.5]:19184 "EHLO
	sjogate2.atmel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751199AbYFLVWU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 Jun 2008 17:22:20 -0400
Received: from bagnes.atmel.com ([10.175.100.4])
	by sjogate2.atmel.com (8.13.6/8.13.6) with ESMTP id m5CKjv1R000008
	for <linux-next@vger.kernel.org>; Thu, 12 Jun 2008 13:45:58 -0700 (PDT)
In-Reply-To: <20080612145538.0835c0b8.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-next@vger.kernel.org, Hans-Christian Egtvedt <hcegtvedt@atmel.com>

Hi Stephen and David,

On Thu, 12 Jun 2008 14:55:38 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi David,
> 
> Today's linux-next merge of the mtd tree got a trivial conflict in
> include/asm-avr32/arch-at32ap/board.h between commit
> f01fb51fc0e2b77c8bbf4d41adfd74c367173b02 ("avr32: Add PSIF platform
> devices") from the avr32 tree and commit
> 62090a08aba579e6c69319fac4d4a1f806f26400 ("[MTD] [NAND] avr32: atmel_nand
> platform code for AT32AP700x") from the mtd tree.
> 
> It was just a case of overlapping additions.

I moved the at32_add_device_psif() prototype a bit up. I think that
took care of the conflict.

Haavard
