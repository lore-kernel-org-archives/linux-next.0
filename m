From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: linux-next: manual merge of the imx-mxs tree
Date: Wed, 9 Oct 2013 09:25:56 +0800
Message-ID: <20131009012554.GB8946@S2101-09.ap.freescale.net>
References: <1381239855-16314-1-git-send-email-treding@nvidia.com>
 <1381239855-16314-2-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from co1ehsobe001.messaging.microsoft.com ([216.32.180.184]:27916
	"EHLO co1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753378Ab3JIBZl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 Oct 2013 21:25:41 -0400
Content-Disposition: inline
In-Reply-To: <1381239855-16314-2-git-send-email-treding@nvidia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Olof Johansson <olof@lixom.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Oct 08, 2013 at 03:44:12PM +0200, Thierry Reding wrote:
> Today's linux-next merge of the imx-mxs tree got conflicts in
> 
> 	arch/arm/mach-imx/mach-imx6q.c
> 
> caused by commits 4d9d18a (ARM: imx: remove custom .init_time hook),
> e709f38 (ARM: imx6: report soc info via soc device) and 3087d32 (ARM:
> imx6q: use common soc revision helpers).
> 
> I fixed it up (see below). Please verify that the resolution looks
> correct.

Thanks, Thierry.  The resolution is correct.

Shawn
