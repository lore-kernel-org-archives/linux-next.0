From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Change to the Tegra URL for linux-next
Date: Tue, 26 Aug 2014 09:29:14 -0600
Message-ID: <53FCA7CA.7040105@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:37234 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752722AbaHZP2r (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 26 Aug 2014 11:28:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thierry Reding <treding@nvidia.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

Stephen,

Can you please adjust the Tegra tree's URL in linux-next. The current 
URL is:

git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git#for-next

The new URL is:

git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git#for-next

It's the same repo (the swarren path is just an alias for the tegra path 
now), but the tegra path is the new canonical location.

BTW, any issues with this repo should now additionally be reported to 
Thierry Reding <treding@nvidia.com>.

Thanks!
