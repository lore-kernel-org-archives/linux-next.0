From: Divy Le Ray <divy@chelsio.com>
Subject: Re: linux-next: manual merge of the firmware tree
Date: Fri, 28 Nov 2008 16:14:46 -0800
Message-ID: <49308976.7010206@chelsio.com>
References: <20081128160339.23fa014f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from stargate.chelsio.com ([12.22.49.110]:1589 "EHLO
	stargate.chelsio.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750897AbYK2APc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 28 Nov 2008 19:15:32 -0500
In-Reply-To: <20081128160339.23fa014f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-next@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jaswinder Singh <jaswinder@infradead.org>

Stephen Rothwell wrote:
> Hi David,
> 
> Today's linux-next merge of the firmware tree got conflicts in
> firmware/Makefile and firmware/WHENCE between commit
> ad58633c8381e88b54055771877726d3d5d24734 ("cxgb3: integrate FW and
> protocol engines in the kernel") from the net tree and various commits
> from the firmware tree.
> 
> Just overlapping additions.  I fixed it up (see below) and can carry the
> fix.
> 
> Is it time that some of these went to their respective maintainers?
> --

Hi Stephen,

I created this situation and apologize for it. I should have sent the
patch to the firmware tree maintainer.

Cheers,
Divy
