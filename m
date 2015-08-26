From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the mmc-uh tree
Date: Wed, 26 Aug 2015 12:04:35 +1000
Message-ID: <20150826120435.27ed1e89@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46096 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752553AbbHZCEh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Aug 2015 22:04:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Hi Ulf,

After merging the mmc-uh tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "pinctrl_bind_pins" [drivers/mmc/core/mmc_core.ko] undefined!

Caused by commit

  175172f6367f ("mmc: pwrseq: bind pinctrl pins before using the gpios")

I have used te mmc-uh tree from next-20150825 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
