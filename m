From: Simon Horman <horms@verge.net.au>
Subject: Re: linux-next: manual merge of the slave-dma tree with the arm-soc
 tree
Date: Thu, 19 Mar 2015 10:10:50 +0900
Message-ID: <20150319011048.GA14051@verge.net.au>
References: <20150318120347.21288162@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56499 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932101AbbCSBKx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 18 Mar 2015 21:10:53 -0400
Content-Disposition: inline
In-Reply-To: <20150318120347.21288162@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Vinod Koul <vinod.koul@intel.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Magnus Damm <damm+renesas@opensource.se>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

On Wed, Mar 18, 2015 at 12:03:47PM +1100, Stephen Rothwell wrote:
> Hi Vinod,
> 
> Today's linux-next merge of the slave-dma tree got a conflict in
> arch/arm/mach-shmobile/board-mackerel.c between commit a521422ea4ae
> ("ARM: shmobile: mackerel: Remove Legacy C board code") from the
> arm-soc tree and commit c078c62a7528 ("mmc: sh_mobile_sdhi: remove
> sh_mobile_sdhi_info v2") from the slave-dma tree.
> 
> I fixed it up (the former removed the file, so I did that) and can
> carry the fix as necessary (no action is required).

Thanks Stephen,

my understanding is that the plan is to correct the file in Vinod's tree
even thought it is removed in mine. Your fix is correct from my point of view.
