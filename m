From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: linux-next: sh tree build failure
Date: Thu, 13 Nov 2008 12:24:40 +0900
Message-ID: <20081113032440.GA18176@linux-sh.org>
References: <20081113110416.6d93c698.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mta23.gyao.ne.jp ([125.63.38.249]:45854 "EHLO mx.gate01.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750956AbYKMDZk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 12 Nov 2008 22:25:40 -0500
Content-Disposition: inline
In-Reply-To: <20081113110416.6d93c698.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Thu, Nov 13, 2008 at 11:04:16AM +1100, Stephen Rothwell wrote:
> Hi Paul,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> ERROR: "clk_enable" [drivers/media/video/sh_mobile_ceu_camera.ko] undefined!
> ERROR: "clk_disable" [drivers/media/video/sh_mobile_ceu_camera.ko] undefined!
> ERROR: "clk_put" [drivers/media/video/sh_mobile_ceu_camera.ko] undefined!
> ERROR: "clk_get" [drivers/media/video/sh_mobile_ceu_camera.ko] undefined!
> 
> Maybe that needs restricting to SH or those routines need exporting?
> Anyway, I have dropped the sh tree for today.
> 
Sorry about that, it was missing a HAVE_CLK dependency. Fixed now,
thanks.
