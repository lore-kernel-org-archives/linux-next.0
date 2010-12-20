From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH] misc: Make AB8500_PWM driver depend on U8500 due to
 PWM breakage
Date: Mon, 20 Dec 2010 14:00:05 +0100
Message-ID: <20101220130004.GG11095@sortiz-mobl>
References: <20101220192121.47767525.sfr@canb.auug.org.au>
 <1292848091-29959-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1292848091-29959-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Linus Walleij <linus.walleij@stericsson.com>, Arun Murthy <arun.murthy@stericsson.com>, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Mark,

On Mon, Dec 20, 2010 at 12:28:11PM +0000, Mark Brown wrote:
> Since we don't have a PWM API every PWM driver ends up exporting its
> own version and we need to limit the platforms we try to build them on
> in order to avoid multiple definitions. As the AB8500 is normally a
> companion chip for the U8500 CPU depend on that architecture.
> 
> Previously the driver was relying on the AB8500 core only being built
> on U8500 but this did not give us build coverage of any of the other
> functions for the device.
> 
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
> 
> Here's a better way of solving the problem, 
Definitely nicer, yes. Patch applied, thanks a lot.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
