From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: sound tree build warning
Date: Wed, 15 Jul 2009 09:35:21 +0100
Message-ID: <20090715083521.GB8689@rakim.wolfsonmicro.main>
References: <20090715131354.da512c72.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:58142 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752855AbZGOIfX (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Jul 2009 04:35:23 -0400
Content-Disposition: inline
In-Reply-To: <20090715131354.da512c72.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Takashi Iwai <tiwai@suse.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jul 15, 2009 at 01:13:54PM +1000, Stephen Rothwell wrote:

> Today's linux-next build (x86_64 allmodconfig) produced this warning:

That's one of the configurations I regularly test build but I've not
seen this - which compiler are you using?  Might be worth reporting that
along with warnings.

> sound/soc/codecs/wm8993.c: In function 'wm8993_hw_params':
> sound/soc/codecs/wm8993.c:1799: warning: array subscript is above array bounds

Fixed, though Takashi seems to be away at the minute so it'll not appear
in -next until he reappears.
