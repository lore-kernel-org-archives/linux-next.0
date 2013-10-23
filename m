From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: linux-next: manual merge of the mvebu tree
Date: Wed, 23 Oct 2013 04:59:48 -0400
Message-ID: <20131023085948.GC24520@titan.lakedaemon.net>
References: <1382369814-7582-1-git-send-email-treding@nvidia.com>
 <1382454649-16442-1-git-send-email-treding@nvidia.com>
 <1382454649-16442-5-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mho-03-ewr.mailhop.org ([204.13.248.66]:17861 "EHLO
	mho-01-ewr.mailhop.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751757Ab3JWI7t (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 23 Oct 2013 04:59:49 -0400
Content-Disposition: inline
In-Reply-To: <1382454649-16442-5-git-send-email-treding@nvidia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-next@vger.kernel.org

On Tue, Oct 22, 2013 at 05:10:49PM +0200, Thierry Reding wrote:
> Today's linux-next merge of the mvebu tree got conflicts in
> 
> 	arch/arm/mach-kirkwood/board-dt.c
> 
> caused by commits a169e3a (ARM: kirkwood: remove custom .init_time hook)
> and 14867b4 (ARM: kirkwood: remove lagacy clk workarounds).
> 
> I fixed them up (see below). Please verify that the resolution looks good.

Looks good,

thx,

Jason.
