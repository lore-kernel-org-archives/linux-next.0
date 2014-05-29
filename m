From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: nommu build failures on ARM in linux-next
Date: Thu, 29 May 2014 12:53:51 -0400
Message-ID: <5387661F.1050000@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:50571 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932575AbaE2QyY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 May 2014 12:54:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Russell,

The allnoconfig builds in linux-next fail because __clear_cr
lives in mmu.c without any stub or similar in nommu.c

Introduced by:

commit 247e4fff3aa927ad069447e6da05bb966b70dece
Author: Russell King <rmk+kernel@arm.linux.org.uk>
Date:   Sun Apr 13 18:57:29 2014 +0100

    ARM: provide common method to clear bits in CPU control register
    
Sample failure:
  http://kisskb.ellerman.id.au/kisskb/buildresult/11264405/

Paul.
