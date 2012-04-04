From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
Date: Tue, 03 Apr 2012 21:43:42 -0600
Message-ID: <4F7BC36E.4070000@wwwdotorg.org>
References: <20120404124437.ff05ebcc4db98109d5fcee22@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:42156 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755428Ab2DDDno (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Apr 2012 23:43:44 -0400
In-Reply-To: <20120404124437.ff05ebcc4db98109d5fcee22@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 04/03/2012 08:44 PM, Stephen Rothwell wrote:
> Hi Linus,
> 
> After merging the pinctrl tree, today's linux-next build (powerpc 
> ppc64_defconfig) failed like this:
> 
> drivers/pinctrl/devicetree.c: In function 'dt_free_map': 
> drivers/pinctrl/devicetree.c:44:42: error: dereferencing pointer to
> incomplete type drivers/pinctrl/devicetree.c:45:6: error:
> dereferencing pointer to incomplete type 
> drivers/pinctrl/devicetree.c: In function 'dt_to_map_one_config': 
> drivers/pinctrl/devicetree.c:140:21: error: dereferencing pointer
> to incomplete type drivers/pinctrl/devicetree.c:141:10: error:
> dereferencing pointer to incomplete type 
> drivers/pinctrl/devicetree.c:146:11: error: dereferencing pointer
> to incomplete type

This doesn't repro for me with tegra_defconfig, which has both
CONFIG_PINCTRL and CONFIG_OF enabled.

I believe this happens because of the following in
drivers/pinctrl/Makefile:

obj-$(CONFIG_OF)		+= devicetree.o

On ppc64, CONFIG_OF is probably true, yet the rest of PINCTRL isn't
enabled, hence the headers that are included probably don't declare
all the types needed to compile that file.

In fact, the file shouldn't be compiled, since it's not needed if
!CONFIG_PINCTRL. So perhaps the Makefile should be more like:

ifeq ($(CONFIG_OF),y)
obj-$(CONFIG_PINCTRL)		+= devicetree.o
endif

(I see something similar to that in drivers/mmc/host/Makefile)

But, I notice the same construct in ./drivers/regulator/Makefile, and
I don't believe regulators are enabled for ppc64. Perhaps the
regulator headers always declare the types, so the issue doesn't come
up, although I daresay that perhaps the regulator file also shouldn't
be compiled when CONFIG_REGULATOR is off?
