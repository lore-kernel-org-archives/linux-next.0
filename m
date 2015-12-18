From: Pramod Kumar <pramodku@broadcom.com>
Subject: RE: linux-next: build failure after merge of the pinctrl tree
Date: Fri, 18 Dec 2015 06:12:44 +0000
Message-ID: <0C803592FC378B4E83922050AB46442A2ADB1CB8@SJEXCHMB10.corp.ad.broadcom.com>
References: <20151218144516.77c8e052@canb.auug.org.au>
	<0C803592FC378B4E83922050AB46442A2ADB1C73@SJEXCHMB10.corp.ad.broadcom.com>
 <20151218165757.1c8d35ec@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:49161 "EHLO
	mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751873AbbLRGMo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 18 Dec 2015 01:12:44 -0500
In-Reply-To: <20151218165757.1c8d35ec@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>

Hi Stephen,

The issue I pointed out is the relevant and is fully related to the statement-

" After merging the pinctrl tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:"

Even I tried the build for config "arm multi_v7_defconfig" it was compile failed. After fixing this I see compilation successful. I don't think we see any more issue after this fix.

Please let me know in case I should try any more compilation.

Regards,
Pramod

> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: 18 December 2015 11:28
> To: Pramod Kumar
> Cc: Linus Walleij; linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Ray
> Jui; Scott Branden
> Subject: Re: linux-next: build failure after merge of the pinctrl tree
> 
> Hi Pramod,
> 
> On Fri, 18 Dec 2015 05:34:58 +0000 Pramod Kumar
> <pramodku@broadcom.com> wrote:
> >
> > Hi Stephen/Linus,
> >
> > Please suggest us how could we fix this issue.
> 
> I think you issue is different from what I reported, What I reported was caused
> by the addition of the dependency on COMPILE_TEST which allowed the driver
> to be built on architectures/platforms that do not have the needed definitions.
> 
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
