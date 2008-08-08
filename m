From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Subject: Re: linux-next: manual merge of the avr32 tree
Date: Fri, 8 Aug 2008 11:31:25 +0200
Message-ID: <20080808113125.5fa8ed61@hskinnemo-gx745.norway.atmel.com>
References: <20080808135145.e77b8b4c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from newsmtp5.atmel.com ([204.2.163.5]:7911 "EHLO sjogate2.atmel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753064AbYHHJy2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 8 Aug 2008 05:54:28 -0400
Received: from bagnes.atmel.com ([10.175.100.4])
	by sjogate2.atmel.com (8.13.6/8.13.6) with ESMTP id m789rbKI001160
	for <linux-next@vger.kernel.org>; Fri, 8 Aug 2008 02:53:38 -0700 (PDT)
In-Reply-To: <20080808135145.e77b8b4c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Haavard Skinnemoen <hskinnemoen@atmel.com>, linux-next@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>

Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Today's linux-next merge of the avr32 tree got conflicts in arch/avr32/mach-at32ap/at32ap700x.c and arch/avr32/mach-at32ap/pm.c between commit 3663b736a5083b3bce74520b637f630f01f66a7f ("avr32: Use <mach/foo.h> instead of <asm/arch/foo.h>") from the arm-current tree and the avr32 tree.

Sorry. I should have expected that.

> The include files seem to have moved around quite a bit, so I didn't
> apply the avr32 tree for today.  Hopefully, the arm-current tree will
> migrate to Linus' tree soon and then the avr32 tree can be updated to
> reflect the changes.

The plan is to merge the conflicting stuff into the avr32 and then
rebase the few commits I currently have on top of that. I'll fix it.

Haavard
