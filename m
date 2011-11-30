From: Richard Kuo <rkuo@codeaurora.org>
Subject: Re: linux-next: manual merge of the vhost tree with the hexagon
 tree
Date: Wed, 30 Nov 2011 00:45:53 -0600
Message-ID: <20111130064553.GA2393@codeaurora.org>
References: <20111129142259.78d3e10678c8e9d8376d52aa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251]:40573 "EHLO
	wolverine02.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751820Ab1K3GyH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 30 Nov 2011 01:54:07 -0500
Content-Disposition: inline
In-Reply-To: <20111129142259.78d3e10678c8e9d8376d52aa@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Nov 29, 2011 at 02:22:59PM +1100, Stephen Rothwell wrote:
> Hi Michael,
> 
> Today's linux-next merge of the vhost tree got a conflict in
> arch/hexagon/Kconfig between commit 5237bae0d8c9 ("various Kconfig
> cleanup and old platform build code removal") from the hexagon tree and
> commit4673ca8eb369  ("lib: move GENERIC_IOMAP to lib/Kconfig") from the
> vhost tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.
> -- 

I was figuring this would happen.  What would be the best way for me to
fix this?  Maybe rebase my patches on top of the vhost tree?


Thanks,
Richard Kuo



-- 

Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
