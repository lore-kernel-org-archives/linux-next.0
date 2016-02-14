From: Jens Axboe <axboe@kernel.dk>
Subject: Re: next: sparc64 crashes due to 'blk-mq: dynamic h/w context count'
Date: Sun, 14 Feb 2016 15:35:48 -0700
Message-ID: <56C10144.9030906@kernel.dk>
References: <20160214131704.GA19659@roeck-us.net>
 <CACVXFVMx5o8csfpXKHuKJc65pvb95WOjqA_NuW1-6GUB-GOZyg@mail.gmail.com>
 <56C0DDD2.50802@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56C0DDD2.50802@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>, Ming Lei <tom.leiming@gmail.com>
Cc: Keith Busch <keith.busch@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jens Axboe <axboe@fb.com>, linux-block@vger.kernel.org, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 02/14/2016 01:04 PM, Guenter Roeck wrote:
> On 02/14/2016 07:14 AM, Ming Lei wrote:
>> On Sun, Feb 14, 2016 at 9:17 PM, Guenter Roeck <linux@roeck-us.net>
>> wrote:
>>> Hi,
>>>
>>> my runtime tests of linux-next crash for sparc64 due to commit
>>> 'blk-mq: dynamic
>>> h/w context count'. Reverting the patch fixes the problem. Bisect log is
>>> attached below. Full crash log is available at
>>> http://kerneltests.org/builders,
>>> in the table with qemu test results.
>>
>> Guenter, could you test patch in the following link to see if it can
>> be fixed?
>>
>> http://marc.info/?l=linux-kernel&m=145526562410555&w=2
>>
>
> Yes, that fixes the problem.

Ming, I've added it to 4.6/core, thanks.

-- 
Jens Axboe
