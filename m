From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Feb 9 (build failures)
Date: Tue, 10 Feb 2015 04:14:22 -0800
Message-ID: <54D9F61E.6040206@roeck-us.net>
References: <20150209211827.652dc2ce@canb.auug.org.au> <20150209172048.GA27107@roeck-us.net> <54D9AE2C.5080403@rempel-privat.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54D9AE2C.5080403@rempel-privat.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Oleksij Rempel <linux@rempel-privat.de>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kenneth Westfield <kwestfie@codeaurora.org>, Mark Brown <broonie@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>
List-Id: linux-next.vger.kernel.org

On 02/09/2015 11:07 PM, Oleksij Rempel wrote:
>>
>> Building sparc64:allmodconfig ... failed
>> --------------
>> Error log:
>> asm9260_timer.c:(.init.text+0x60d4): undefined reference to `of_io_request_and_map'
>
> The patch for this issue was send for two weeks:
> https://lkml.org/lkml/2015/1/31/21
>
> Should i resend it?
>

That might be a good idea. I would suggest to drop the "ARM" tag
from the headline, and make sure the clocksource maintainers are copied.
Also, add an empty line before "Reported-by:" and

Tested-by: Guenter Roeck <linux@roeck-us.net>

Guenter
