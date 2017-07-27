From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing in commit in the arm-soc tree
Date: Fri, 28 Jul 2017 01:21:34 +1000
Message-ID: <20170728012134.39de1c48@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53439 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751122AbdG0PVh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 27 Jul 2017 11:21:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Sverdlin <alexander.sverdlin@gmail.com>

Hi all,

I noticed that commit

  2cb68e9b44f7 ("ARM: ep93xx: normalize clk API")

has no Signed-off-by from its committer.

-- 
Cheers,
Stephen Rothwell
