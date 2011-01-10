From: Paul Walmsley <paul@pwsan.com>
Subject: Re: [PATCH] arm: omap4: pandaboard: turn on PHY reference clock at
 init
Date: Mon, 10 Jan 2011 11:52:24 -0700 (MST)
Message-ID: <alpine.DEB.2.00.1101101152040.5731@utopia.booyaka.com>
References: <1294670535-9059-1-git-send-email-gadiyar@ti.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1294670535-9059-1-git-send-email-gadiyar@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Anand Gadiyar <gadiyar@ti.com>
Cc: linux-omap@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg KH <gregkh@suse.de>, Felipe Balbi <balbi@ti.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Benoit Cousson <b-cousson@ti.com>, Tony Lindgren <tony@atomide.com>
List-Id: linux-next.vger.kernel.org

On Mon, 10 Jan 2011, Anand Gadiyar wrote:

> The SMSC 3320 USB PHY on the OMAP4 Pandaboard needs a 19.2 MHz
> reference clock. This clock is provided from the OMAP4's fref_clk3
> pad.
> 
> Recent changes to clock44xx_data.c made the clock framework aware
> of the existence of these fref_clk[i] lines. If the option
> CONFIG_OMAP_RESET_CLOCKS is enabled in the kernel, then the
> clock framework will turn these clocks off during bootup.
> 
> Explicitly request and keep this clock enabled at init for the
> Pandaboard, so that the PHY receives this clock at all times.
> 
> Reported-by: Ming Lei <tom.leiming@gmail.com>
> Signed-off-by: Anand Gadiyar <gadiyar@ti.com>
> Cc: Benoit Cousson <b-cousson@ti.com>
> Cc: Paul Walmsley <paul@pwsan.com>
> Cc: Tony Lindgren <tony@atomide.com>

Reviewed-by: Paul Walmsley <paul@pwsan.com>


- Paul
