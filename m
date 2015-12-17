From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rebase of the drm-panel tree
Date: Fri, 18 Dec 2015 09:17:29 +1100
Message-ID: <20151218091729.1e923834@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42442 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933145AbbLQWRb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Dec 2015 17:17:31 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Airlie <airlied@linux.ie>

Hi Thierry,

I noticed that you have rebased the drm-panel tree today.  Unfortunately,
Dave merged the previous version of your tree :-(

So, now in linux-next today, we are going to have 2 copies of all theose
patches, plus at least 2 of the patches have beenm changed in you new
version so there will probably be conflicts.

Please either go back to the old version, or just rebase what you have
now on top of Dave's drm tree.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
