From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the char-misc tree
Date: Wed, 20 Dec 2017 07:12:16 +1100
Message-ID: <20171220071216.096a2d09@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40363 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751305AbdLSUMT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 19 Dec 2017 15:12:19 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sagar Dharia <sdharia@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Mark Brown <broonie@kernel.org>

Hi all,

Commits

  46a2bb5a7f7e ("slimbus: core: Add slim controllers support")
  afbdcc7c384b ("slimbus: Add messaging APIs to slimbus framework")

are missing a Signed-off-by from their author.

-- 
Cheers,
Stephen Rothwell
