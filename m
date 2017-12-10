From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the kbuild tree
Date: Mon, 11 Dec 2017 09:52:28 +1100
Message-ID: <20171211095228.21562f56@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:32971 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751137AbdLJWwb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 10 Dec 2017 17:52:31 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ulf Magnusson <ulfalizer@gmail.com>, Bart Van Assche <bart.vanassche@wdc.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Hannes Reinecke <hare@suse.com>

Hi Masahiro,

After merging the kbuild tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/usb/gadget/Kconfig:487:warning: choice default symbol 'USB_ETH' is not contained in the choice

Exposed by commit

  2c37e08464a8 ("kconfig: Warn if choice default is not in choice")

Introduced by commit

  7a9618a22aad ("usb: gadget: allow to enable legacy drivers without USB_ETH")

-- 
Cheers,
Stephen Rothwell
