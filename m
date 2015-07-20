From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH 1/2] mfd: Fixup clients of
 multi_reg_write/register_patch
Date: Mon, 20 Jul 2015 11:59:35 +1000
Message-ID: <20150720115935.686b556e@canb.auug.org.au>
References: <20150717143934.4f0ce5d7@canb.auug.org.au>
	<20150717094436.GC21939@opensource.wolfsonmicro.com>
	<20150717103450.GJ11162@sirena.org.uk>
	<20150717140926.GG21939@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48184 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753947AbbGTB7h (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 19 Jul 2015 21:59:37 -0400
In-Reply-To: <20150717140926.GG21939@opensource.wolfsonmicro.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nariman Poushin <nariman@opensource.wolfsonmicro.com>
Cc: Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Fitzgerald <rf@opensource.wolfsonmicro.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Hi Nariman,

On Fri, 17 Jul 2015 15:09:26 +0100 Nariman Poushin <nariman@opensource.wolfsonmicro.com> wrote:
>
> Introduced by:
> commit 8019ff6cfc04
> ("regmap: Use reg_sequence for multi_reg_write / register_patch")
> 
> Interacting with:
> commit 561629755a21 ("mfd: arizona: Add support for WM8998 and WM1814")
> commit 81207880cef2 ("mfd: wm5110: Add register patch for rev E and above")
> 
> Signed-off-by: Nariman Poushin <nariman@opensource.wolfsonmicro.com>
> ---
>  drivers/mfd/wm5110-tables.c | 2 +-
>  drivers/mfd/wm8998-tables.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

I will apply both these patches as merge fix patches in linux-next
today.  Thanks.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
