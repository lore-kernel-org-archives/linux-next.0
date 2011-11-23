From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] netprio_cgroup: Fix build break
Date: Wed, 23 Nov 2011 15:53:05 -0500 (EST)
Message-ID: <20111123.155305.1621375962249427854.davem@davemloft.net>
References: <1322051553-28987-1-git-send-email-nhorman@tuxdriver.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([198.137.202.13]:38704 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752819Ab1KWU4Z (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 23 Nov 2011 15:56:25 -0500
In-Reply-To: <1322051553-28987-1-git-send-email-nhorman@tuxdriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: nhorman@tuxdriver.com
Cc: netdev@vger.kernel.org, kirr@mns.spb.ru, john.r.fastabend@intel.com, robert.w.love@intel.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org

From: Neil Horman <nhorman@tuxdriver.com>
Date: Wed, 23 Nov 2011 07:32:33 -0500

> I broke the build with the addition of netprio_cgroups if CONFIG_CGROUPS=n.
> This patch corrects it by moving the offending struct into an ifdef
> CONFIG_CGROUPS block.  Also clean up a few needless defines and inline functions
> that don't get called if CONFIG_CGROUPS isn't defined while Im at it.
> 
> Signed-off-by: Neil Horman <nhorman@tuxdriver.com>

Applied, thanks.
