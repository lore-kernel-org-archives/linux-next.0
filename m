From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: bad commit in the mvebu tree
Date: Fri, 16 Jun 2017 05:57:32 +1000
Message-ID: <20170616055732.4114daed@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33865 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752099AbdFOT5g (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Jun 2017 15:57:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

I noticed that commit

  c6f4e66bd0f4 ("arm64: marvell: dts: add xmdio nodes for 7k/8k")

has no Signed-off-by for its comitter.

-- 
Cheers,
Stephen Rothwell
