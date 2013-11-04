From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: linux-next: manual merge of the dt-rh tree with the imx-mxs tree
Date: Mon, 4 Nov 2013 21:17:41 +0800
Message-ID: <20131104131739.GC24970@S2101-09.ap.freescale.net>
References: <20131104152739.92ae486e7d418221c6a48a1e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from co9ehsobe004.messaging.microsoft.com ([207.46.163.27]:37463
	"EHLO co9outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751782Ab3KDNRL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Nov 2013 08:17:11 -0500
Content-Disposition: inline
In-Reply-To: <20131104152739.92ae486e7d418221c6a48a1e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rob Herring <robherring2@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rostislav Lisovy <lisovy@gmail.com>, Silvio F <silvio.fricke@gmail.com>

On Mon, Nov 04, 2013 at 03:27:39PM +1100, Stephen Rothwell wrote:
> Hi Rob,
> 
> Today's linux-next merge of the dt-rh tree got a conflict in
> Documentation/devicetree/bindings/vendor-prefixes.txt between commit
> 064d7f6c985a ("ARM: dts: Add vendor prefix for Voipac Technologies
> s.r.o") from the imx-mxs tree and commit d6c3073e7fb5 ("DT: sort
> vendor-prefixes.txt") from the dt-rh tree.

Hi Rob,

Would you like to apply the patch "ARM: dts: Add vendor prefix for
Voipac Technologies s.r.o" on your tree, so that we can save this
conflict?  If so, I will drop the patch from my tree.  Just let me know.

Shawn
