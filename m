From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH -next] ASoC: fix wm8958-dsp2 printk format warnings
Date: Wed, 11 May 2011 18:16:43 +0200
Message-ID: <20110511161642.GA31677@opensource.wolfsonmicro.com>
References: <20110505134959.b3761297.sfr@canb.auug.org.au>
 <20110506161310.54b22b9f.randy.dunlap@oracle.com>
 <20110508140101.GB15968@opensource.wolfsonmicro.com>
 <4DC6B8F7.4000302@oracle.com>
 <20110508160604.GB32214@opensource.wolfsonmicro.com>
 <20110508094824.b6952ae6.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110508094824.b6952ae6.randy.dunlap@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Liam Girdwood <lrg@slimlogic.co.uk>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Sun, May 08, 2011 at 09:48:24AM -0700, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Fix printk format warnings in wm8958-dsp2.c:

Applied, thanks.  With warnings like this it's useful to note which
platform you see things on - this doesn't occur on ARM for example.  I
suspect it's a 64 bit or compiler version issue but ICBW.
