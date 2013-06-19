From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: linux-next: manual merge of the samsung tree with the usb tree
Date: Wed, 19 Jun 2013 20:53:05 +0900
Message-ID: <1f6801ce6ce3$8f1b7380$ad525a80$%kim@samsung.com>
References: <20130619164521.f5477ccb559cc6c6f8b0a19a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:52050 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933666Ab3FSLxH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 Jun 2013 07:53:07 -0400
In-reply-to: <20130619164521.f5477ccb559cc6c6f8b0a19a@canb.auug.org.au>
Content-language: ko
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: 'Stephen Rothwell' <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Greg KH' <greg@kroah.com>, 'Tomasz Figa' <t.figa@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>

Stephen Rothwell wrote:
> 
> Hi Kukjin,
> 
Hi,

> Today's linux-next merge of the samsung tree got a conflict in
> drivers/usb/Kconfig between commit d9ea21a77927 ("usb: host: make
> USB_ARCH_HAS_?HCI obsolete") from the usb tree and commit 58d5b72088cc
> ("USB: Check for ARCH_EXYNOS separately") from the samsung tree.
> 
> I fixed it up (USB_ARCH_HAS_EHCI is no longer used) and can carry the fix
> as necessary (no action is required).
> 
Looks good to me, thanks.

- Kukjin
