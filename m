From: Xiong Zhou <jencce.kernel@gmail.com>
Subject: Re: [PATCH -next] sound/soc/codecs: Mark snd-soc-wm2200 and
 snd-soc-wm-adsp as BROKEN
Date: Sat, 30 Mar 2013 20:30:39 +0800 (CST)
Message-ID: <alpine.DEB.2.02.1303302029231.25958@M2420>
References: <1364566347-29941-1-git-send-email-peter@hurleysoftware.com> <20130329171229.GD18316@opensource.wolfsonmicro.com> <1364582754.3559.66.camel@thor.lan> <20130329185004.GL18316@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:44235 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754462Ab3C3Mie (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 30 Mar 2013 08:38:34 -0400
Received: by mail-pd0-f180.google.com with SMTP id g10so595152pdj.25
        for <linux-next@vger.kernel.org>; Sat, 30 Mar 2013 05:38:34 -0700 (PDT)
In-Reply-To: <20130329185004.GL18316@opensource.wolfsonmicro.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Peter Hurley <peter@hurleysoftware.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Xiong Zhou <jencce.kernel@gmail.com>



On Fri, 29 Mar 2013, Mark Brown wrote:

> On Fri, Mar 29, 2013 at 02:45:54PM -0400, Peter Hurley wrote:
> 
> > This is stock Ubuntu configs.
> 
> Then the stock Ubuntu configuration is not a sensible one, enabling
> SND_SOC_ALL_CODECS for any purpose other than build coverage testing is
> just a waste of time - that's all it does.
> 

Take a look at this:

MFD_ARIZONA_I2C   select
               > -------- > MFD_ARIZONA <-|
MDF_ARIZONA_SPI                           |
                                          |
					  |depends on
					  |
					  |
SND_SOC_ALL_CODECS-\		         / \
      I2C ---------/|	       MFD_WM5110  MFD_WM5102
		    |		     |           |
		    |		     |select     | select
		    |		     |           |
		    v		     v           v
          SND_SOC_WM2200     SND_SOC_WM5102   SND_SOC_WM5110
                |                    | |           |
		|____________________| |___________|
		        |                   |
			| if M/Y            | if M/Y
			v                   v
		SND_SOC_WM_ADSP        SND_SOC_ARIZONA


If I2C is enabled normally, and SND_SOC_ALL_CODECS is keeped in the
sound card configure options.

Then, disable ALL options in:

	Device drivers  ---->
		Multifunction device drivers --->

which includes MFD_ARIZONA_I2C and MDF_ARIZONA_SPI. 

So the failure comes. Yes, this config is kind of specific, not much.

The definition of one array which is cited by one module comes in 
another module, and this dependence does not appear in Kconfig 
architecture. Indeed, the help text of ALL_CODECS reminds the 
separated surpporting bus options. Still I think this is unreasonable.
Even though build coverage test is the only proper purpose. It breaks
the whole building procedure.

I think copying the same array definition across c file is ugly, and Mark
said that this is not a Kconfig issue. So far, I have not got any other
idea to fix this. Code cruising.
