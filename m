From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ASoC: tpa6130a2: Fix compiler warning
Date: Tue, 28 Dec 2010 11:37:48 +0000
Message-ID: <20101228113747.GC31292@opensource.wolfsonmicro.com>
References: <1293527779-32580-1-git-send-email-peter.ujfalusi@nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:37749 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753128Ab0L1Lhh (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Dec 2010 06:37:37 -0500
Content-Disposition: inline
In-Reply-To: <1293527779-32580-1-git-send-email-peter.ujfalusi@nokia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@nokia.com>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lrg@slimlogic.co.uk>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Dec 28, 2010 at 11:16:19AM +0200, Peter Ujfalusi wrote:
> sound/soc/codecs/tpa6130a2.c: In function 'tpa6130a2_add_controls':
> sound/soc/codecs/tpa6130a2.c:342: warning: unused variable 'dapm'
> 
> Introduced by commit 39646871a47fd8808c08de0ce7d7ca8393af2805 ("ASoC:
> tpa6130a2: Replace DAPM code with direct interface").

Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
