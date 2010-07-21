From: Ryan Mallon <ryan@bluewatersys.com>
Subject: Re: Your patch: ARM: AMBA: Add pclk definition for platforms using
 primecells
Date: Wed, 21 Jul 2010 12:49:11 +1200
Message-ID: <4C464407.5060305@bluewatersys.com>
References: <0D753D10438DA54287A00B02708426976374051D65@AUSP01VMBX24.collaborationhost.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.bluewatersys.com ([202.124.120.130]:36125 "EHLO
	hayes.bluewaternz.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1760825Ab0GUAsk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 20 Jul 2010 20:48:40 -0400
In-Reply-To: <0D753D10438DA54287A00B02708426976374051D65@AUSP01VMBX24.collaborationhost.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: H Hartley Sweeten <hartleys@visionengravers.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Takashi Iwai <tiwai@suse.de>, linux-next@vger.kernel.org, linux kernel <linux-kernel@vger.kernel.org>

On 07/21/2010 11:54 AM, H Hartley Sweeten wrote:
> Hello Russell,
> 
> Your patch added a new clock to the ep93xx platform called "apb_pclk".  This
> clock was already available as "pclk" on that platform.
> 
> Since there are no users of "pclk" in the kernel I have no problems just
> renaming it to "apb_pclk" and removing the dummy_apb_pclk that you added.
> 
> Would you like me to submit the ncessary patch or can you fix it?

The dummy_apb_pclk definition caused a merge conflict in next with the
ep93xx i2s audio clock code, which Stephen wrote a fixup patch for. Can
we sort this out all in one big go? Stephen's original message copied below.

~Ryan

---

> Hi Takashi,
> 
> Today's linux-next merge of the sound tree got a conflict in
> arch/arm/mach-ep93xx/clock.c between commit
> 5c6649e3c1511b183f12d2e884d2c172fe9001e0 ("ARM: AMBA: Add pclk definition
> for platforms using primecells") from the arm tree and commit
> ed67ea82c0d9a163458dc6a69a7a3123db1a8b3b ("EP93xx: Add i2s core support")
> from the sound tree.
> 
> Just overlapping additions.  I fixed it up (see below) and can carry the
> fix as necessary.

---
diff --cc arch/arm/mach-ep93xx/clock.c
index d40826a,8031624..0000000
--- a/arch/arm/mach-ep93xx/clock.c
+++ b/arch/arm/mach-ep93xx/clock.c
@@@ -43,9 -43,9 +43,11 @@@ static unsigned long get_uart_rate(stru

  static int set_keytchclk_rate(struct clk *clk, unsigned long rate);
  static int set_div_rate(struct clk *clk, unsigned long rate);
+ static int set_i2s_sclk_rate(struct clk *clk, unsigned long rate);
+ static int set_i2s_lrclk_rate(struct clk *clk, unsigned long rate);

 +static struct clk dummy_apb_pclk;
 +
  static struct clk clk_xtali = {
  	.rate		= EP93XX_EXT_CLK_RATE,
  };
