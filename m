From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Fri, 18 May 2012 10:39:19 +0200
Message-ID: <20120518083919.GB12015@sortiz-mobl>
References: <20120516160906.25825987b7cd731a4b5215e1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:40059 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932782Ab2ERI3Y (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 May 2012 04:29:24 -0400
Content-Disposition: inline
In-Reply-To: <20120516160906.25825987b7cd731a4b5215e1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

Hi Stephen,

On Wed, May 16, 2012 at 04:09:06PM +1000, Stephen Rothwell wrote:
> Hi Samuel,
> 
> After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/built-in.o: In function `wm8400_i2c_probe':
> wm8400-core.c:(.text+0x100165): undefined reference to `devm_regmap_init_i2c'
> drivers/built-in.o: In function `wm8400_module_init':
> wm8400-core.c:(.init.text+0xb43c): undefined reference to `i2c_register_driver'
> drivers/built-in.o: In function `wm8400_module_exit':
> wm8400-core.c:(.exit.text+0x655): undefined reference to `i2c_del_driver'
> 
> Probably caused by commit 96cd102ae039 ("mfd: Don't support non-modular
> wm8400 build") which was introduced to fix other problems.  In this
> build, CONFIG_I2C=m and CONFIG_REGMAP_I2C=m.
> 
> I have used the mfd tree from next-20120511 again for today.
Sorry for the delay, this should be fixed now.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
