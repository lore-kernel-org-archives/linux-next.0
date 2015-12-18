From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: Problems with x86/x86_64 qemu tests in linux-next due to 'Enhance
 __assign_irq_vector() to rollback ...'
Date: Sat, 19 Dec 2015 00:46:56 +0200
Message-ID: <CAHp75VdTDugX_=5Vy2VaRHebQM0B0eV0-zGfGEJs86Gxg5LUUg@mail.gmail.com>
References: <56734C4C.2050202@roeck-us.net>
	<5673CE81.1030502@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yk0-f170.google.com ([209.85.160.170]:36087 "EHLO
	mail-yk0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751429AbbLRWq5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 18 Dec 2015 17:46:57 -0500
In-Reply-To: <5673CE81.1030502@linux.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiang Liu <jiang.liu@linux.intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Joe Lawrence <joe.lawrence@stratus.com>

On Fri, Dec 18, 2015 at 11:14 AM, Jiang Liu <jiang.liu@linux.intel.com> wrote:
> On 2015/12/18 7:59, Guenter Roeck wrote:

Ah, again spend few hours to get the same. I found this on today's
linux-next on some HP PC.
Does the fix available anywhere on public?

-- 
With Best Regards,
Andy Shevchenko
