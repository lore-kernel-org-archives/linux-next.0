From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] net: via/Kconfig: GENERIC_PCI_IOMAP required if PCI
 not selected
Date: Sun, 26 Jul 2015 16:36:58 -0700 (PDT)
Message-ID: <20150726.163658.1558548081941865290.davem@davemloft.net>
References: <1437582854-3320-1-git-send-email-borneo.antonio@gmail.com>
	<20150722.110836.422018977846427052.davem@davemloft.net>
	<CAAj6DX3WpzogwYFa4EQ-b1o+n-4kE0iXOokYQA5NpV=3YBmM_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:36771 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755333AbbGZXg7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 26 Jul 2015 19:36:59 -0400
In-Reply-To: <CAAj6DX3WpzogwYFa4EQ-b1o+n-4kE0iXOokYQA5NpV=3YBmM_A@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: borneo.antonio@gmail.com
Cc: paul.gortmaker@windriver.com, netdev@vger.kernel.org, linux-next@vger.kernel.org, alchark@gmail.com

From: Antonio Borneo <borneo.antonio@gmail.com>
Date: Thu, 23 Jul 2015 09:35:51 +0800

> Digging in git log, arch that used to provide such empty instances
> moved to a centralized implementation by using GENERIC_PCI_IOMAP.
> For me such empty functions should be available by default when PCI is
> not set, but this is not the case today.

Then that is what we should fix instead of these hackish per-driver
patches.

Make it so that these fallback implementations always are present
when PCI is not set.
