From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH V1] regulator: Add support for RICOH PMIC RC5T583 regulator
Date: Fri, 6 Apr 2012 00:37:42 -0400
Message-ID: <CAP=VYLq_X7NJb=j_GNTHwrCyW1pbZJ4duknKCXEyeAezSkH4gA@mail.gmail.com>
References: <1333523640-8820-1-git-send-email-ldewangan@nvidia.com> <20120404104948.GA9693@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:38187 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751659Ab2DFEiO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Apr 2012 00:38:14 -0400
In-Reply-To: <20120404104948.GA9693@opensource.wolfsonmicro.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, lrg@ti.com, sameo@linux.intel.com, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

On Wed, Apr 4, 2012 at 6:49 AM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Wed, Apr 04, 2012 at 12:44:00PM +0530, Laxman Dewangan wrote:
>> The RC5T583 PMIC from RICOH consists of 4 DCDC and 10
>> LDOs. This driver supports the control of different
>> regulator output through regulator interface.
>> This driver depends on MFD driver of RC5T583 and uses
>> mfd rc5t583 apis to communicate to device for accessing
>> different device's registers.
>
> Applied, thanks.

Hi Mark,

It appears this breaks linux-next allmodconfig build, because it
uses an uppercase V in the v2 of its MODULE_LICENSE.

FATAL: modpost: GPL-incompatible module rc5t583-regulator.ko uses
GPL-only symbol 'platform_driver_unregister'
make[2]: *** [__modpost] Error 1

The build is here:

http://kisskb.ellerman.id.au/kisskb/buildresult/6039758/

Thanks,
Paul.
