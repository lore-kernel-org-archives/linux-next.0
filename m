From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the thermal-soc tree with the arm tree
Date: Mon, 17 Aug 2015 12:17:54 +1000
Message-ID: <20150817121754.04736e67@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57017 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751440AbbHQCRz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 16 Aug 2015 22:17:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eduardo Valentin <edubezval@gmail.com>, Russell King <linux@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>

Hi Eduardo,

Today's linux-next merge of the thermal-soc tree got a conflict in:

  drivers/thermal/cpu_cooling.c

between commit:

  df6f527755a5 ("thermal: cpu_cooling: fix lockdep problems in cpu_cooling")

from the arm tree and commits:

  02373d7c69b4 ("thermal: cpu_cooling: fix lockdep problems in cpu_cooling")
  a24af233a1fd ("thermal/cpu_cooling: convert 'switch' block to 'if' block in notifier")

from the thermal-soc tree.

I fixed it up (the first two look like two versions of the same patch,
so I used the version from the thermal-soc tree) and can carry the fix
as necessary (no action is required).

Russell: that commit in your tree has no Signed-off-by :-(

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
