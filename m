From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the wireless-drivers-next
 tree
Date: Wed, 22 Jul 2015 10:32:39 +1000
Message-ID: <20150722103239.04995fda@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49474 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933999AbbGVAcl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Jul 2015 20:32:41 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>

Hi Kalle,

After merging the wireless-drivers-next tree, today's linux-next build
(x86_64 allmodconfig) failed like this:

ERROR: "of_default_bus_match_table" [drivers/bcma/bcma.ko] undefined!

Caused by commit

  cae761b5a6bd ("bcma: populate bus DT subnodes as platform_device-s")

I have used the wireless-drivers-next tree from next-20150721 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
