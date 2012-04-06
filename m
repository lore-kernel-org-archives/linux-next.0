From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V1] regulator: Add support for RICOH PMIC RC5T583 regulator
Date: Fri, 6 Apr 2012 11:06:11 +0530
Message-ID: <4F7E80CB.5060706@nvidia.com>
References: <1333523640-8820-1-git-send-email-ldewangan@nvidia.com> <20120404104948.GA9693@opensource.wolfsonmicro.com> <CAP=VYLq_X7NJb=j_GNTHwrCyW1pbZJ4duknKCXEyeAezSkH4gA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hqemgate03.nvidia.com ([216.228.121.140]:16704 "EHLO
	hqemgate03.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751937Ab2DFFqH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Apr 2012 01:46:07 -0400
In-Reply-To: <CAP=VYLq_X7NJb=j_GNTHwrCyW1pbZJ4duknKCXEyeAezSkH4gA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, "lrg@ti.com" <lrg@ti.com>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Friday 06 April 2012 10:07 AM, Paul Gortmaker wrote:
>
> It appears this breaks linux-next allmodconfig build, because it
> uses an uppercase V in the v2 of its MODULE_LICENSE.
>
> FATAL: modpost: GPL-incompatible module rc5t583-regulator.ko uses
> GPL-only symbol 'platform_driver_unregister'
> make[2]: *** [__modpost] Error 1
> .


Oops, my bad, I did not realize it. I send the patch for fixing this 
license issue.
Is it possible to catch such issue through check-patch?
