From: Xiong Zhou <jencce.kernel@gmail.com>
Subject: Re: [patch] sound/soc/codec : fix build failure in next-201303225
Date: Mon, 25 Mar 2013 20:34:27 +0800 (CST)
Message-ID: <alpine.DEB.2.02.1303252017020.20514@M2420>
References: <alpine.DEB.2.02.1303251950440.20514@M2420> <20130325120601.GN18316@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130325120601.GN18316@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Xiong Zhou <jencce.kernel@gmail.com>, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org



On Mon, 25 Mar 2013, Mark Brown wrote:

> On Mon, Mar 25, 2013 at 07:59:43PM +0800, Xiong Zhou wrote:
> 
> > -const char *arizona_rate_text[ARIZONA_RATE_ENUM_SIZE] = {
> > -	"SYNCCLK rate", "8kHz", "16kHz", "ASYNCCLK rate",
> > -};
> > +extern const char *arizona_rate_text[ARIZONA_RATE_ENUM_SIZE];
> >  EXPORT_SYMBOL_GPL(arizona_rate_text);
> 
> No, this isn't a good fix at all - we're moving the array to the header
> but still exporting it from this file which is not clever at all.  The
> user should be conditional.
> 

Yes, I agree with you much. Do you have some plan with this array? 
The exproting seems not necesary right now, How about just moving 
the array to the header?
