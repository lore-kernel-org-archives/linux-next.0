From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: manual merge of the mvebu tree
Date: Tue, 8 Oct 2013 10:08:07 -0400
Message-ID: <20131008140807.GG5402@titan.lakedaemon.net>
References: <1381239855-16314-1-git-send-email-treding@nvidia.com>
 <1381239855-16314-3-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mho-02-ewr.mailhop.org ([204.13.248.72]:25857 "EHLO
	mho-02-ewr.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752682Ab3JHOIJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 Oct 2013 10:08:09 -0400
Content-Disposition: inline
In-Reply-To: <1381239855-16314-3-git-send-email-treding@nvidia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Oct 08, 2013 at 03:44:13PM +0200, Thierry Reding wrote:
> Today's linux-next merge of the mvebu tree got conflicts in:
> 
> 	arch/arm/mach-dove/board-dt.c
> 
> caused by commits ffe195c (ARM: dove: remove legacy pcie and clock init),
> e3730b4 (ARM: dove: switch to DT probed mbus address windows), and 51e40f5
> (ARM: dove: remove custom .init_time hook).
> 
> I fixed them up (see below). Please verify that the resolution looks
> correct.

Looks good to me, thanks!

thx,

Jason.
