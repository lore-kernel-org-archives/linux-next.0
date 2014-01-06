From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: linux-next: build failure after merge of the mmc tree
Date: Mon, 6 Jan 2014 14:46:02 +0800
Message-ID: <20140106064600.GE26128@S2101-09.ap.freescale.net>
References: <20131213125716.f432c59bf8782a489400a5a7@canb.auug.org.au>
 <20131217132838.cc16a4dbac2f4d3218bbed1d@canb.auug.org.au>
 <CAA+hA=Shwn1P25+xB+VogD+9n7gdvCmJ-EG6khgf3a2gjGwTJQ@mail.gmail.com>
 <20131217031600.GG6691@S2101-09.ap.freescale.net>
 <CAA+hA=QU1TApbbohD1iNFiMMMHdQSamRfOsO0r3GpqmCbdiSgw@mail.gmail.com>
 <20140106172243.8067c8e72c666511129a9701@canb.auug.org.au>
 <CAA+hA=TDJM_OAh=WFd5mqsix9-ZQuPvzXe_xHH0z+4xSZRRsBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]:7225
	"EHLO ch1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751063AbaAFGpY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 6 Jan 2014 01:45:24 -0500
Content-Disposition: inline
In-Reply-To: <CAA+hA=TDJM_OAh=WFd5mqsix9-ZQuPvzXe_xHH0z+4xSZRRsBg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dong Aisheng <dongas86@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Chris Ball <cjb@laptop.org>, linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dong Aisheng <b29396@freescale.com>

On Mon, Jan 06, 2014 at 02:30:00PM +0800, Dong Aisheng wrote:
> Hi Shawn,
> 
> How do you suggest to fix this issue?
> Can we cook a patch for it directly based on linux-next tree?

No, we can not.  No patch should be targeting linux-next tree.  I just
gave a resolution to Stephen.  Before Chris shows up and drops the patch
from his tree, we will need to use that temp resolution.

Shawn
