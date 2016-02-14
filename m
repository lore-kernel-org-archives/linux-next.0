From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: next: sparc64 crashes due to 'blk-mq: dynamic h/w context count'
Date: Sun, 14 Feb 2016 12:04:34 -0800
Message-ID: <56C0DDD2.50802@roeck-us.net>
References: <20160214131704.GA19659@roeck-us.net>
 <CACVXFVMx5o8csfpXKHuKJc65pvb95WOjqA_NuW1-6GUB-GOZyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:37249 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751420AbcBNUEi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 14 Feb 2016 15:04:38 -0500
In-Reply-To: <CACVXFVMx5o8csfpXKHuKJc65pvb95WOjqA_NuW1-6GUB-GOZyg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ming Lei <tom.leiming@gmail.com>
Cc: Keith Busch <keith.busch@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jens Axboe <axboe@fb.com>, linux-block@vger.kernel.org, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On 02/14/2016 07:14 AM, Ming Lei wrote:
> On Sun, Feb 14, 2016 at 9:17 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>> Hi,
>>
>> my runtime tests of linux-next crash for sparc64 due to commit 'blk-mq: dynamic
>> h/w context count'. Reverting the patch fixes the problem. Bisect log is
>> attached below. Full crash log is available at http://kerneltests.org/builders,
>> in the table with qemu test results.
>
> Guenter, could you test patch in the following link to see if it can be fixed?
>
> http://marc.info/?l=linux-kernel&m=145526562410555&w=2
>

Yes, that fixes the problem.

Thanks,
Guenter
