From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: build failure after merge of the final tree
 (sound-asoc tree related)
Date: Fri, 2 Dec 2011 10:53:24 +0000
Message-ID: <20111202105323.GE8245@opensource.wolfsonmicro.com>
References: <20111202143845.9d912c4378d42bcbfa44a8f0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:38286 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753112Ab1LBKx0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 2 Dec 2011 05:53:26 -0500
Content-Disposition: inline
In-Reply-To: <20111202143845.9d912c4378d42bcbfa44a8f0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Liam Girdwood <lrg@slimlogic.co.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Dec 02, 2011 at 02:38:45PM +1100, Stephen Rothwell wrote:

> sound/soc/codecs/wm8994.c: In function 'wm8994_codec_probe':
> sound/soc/codecs/wm8994.c:3511:4: error: label 'err' used but not defined

PowerPC is just being nuts here.
