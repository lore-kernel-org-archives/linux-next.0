From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: randconfig build error with next-20140206, in drivers/hwmon/ltc2945.c
Date: Thu, 06 Feb 2014 06:07:20 -0800
Message-ID: <52F39718.9070205@roeck-us.net>
References: <CA+r1ZhgB-DpgshX24HmzuqZPQr5wsueg4GYACy-669RmTL4xRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+r1ZhgB-DpgshX24HmzuqZPQr5wsueg4GYACy-669RmTL4xRA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jim Davis <jim.epost@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, jdelvare@suse.de, lm-sensors@lm-sensors.org
List-Id: linux-next.vger.kernel.org

On 02/06/2014 05:57 AM, Jim Davis wrote:
> Building with the attached random configuration file,
>
> drivers/built-in.o: In function `ltc2945_set_value':
> ltc2945.c:(.text+0x58b1ad): undefined reference to `__udivdi3'
> ltc2945.c:(.text+0x58b1cc): undefined reference to `__udivdi3'
> ltc2945.c:(.text+0x58b1dd): undefined reference to `__udivdi3'
> ltc2945.c:(.text+0x58b1fb): undefined reference to `__udivdi3'
> make: *** [vmlinux] Error 1
>

I really love those auto-builders :-)

Should be fixed in the next version of -next.

Guenter
