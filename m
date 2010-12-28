From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Tue, 28 Dec 2010 02:15:39 +0000
Message-ID: <20101228021538.GA30589@opensource.wolfsonmicro.com>
References: <20101228104024.fb0e9e34.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:48459 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752822Ab0L1CP1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Dec 2010 21:15:27 -0500
Content-Disposition: inline
In-Reply-To: <20101228104024.fb0e9e34.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Liam Girdwood <lrg@slimlogic.co.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Dec 28, 2010 at 10:40:24AM +1100, Stephen Rothwell wrote:

> In sound/soc/codecs/wm8962.c, the tracepoint is protected by
> CONFIG_SOUND_SOC_WM8962_MODULE, it should be CONFIG_SND_SOC_WM8962_MODULE.

Should be fixed now.
