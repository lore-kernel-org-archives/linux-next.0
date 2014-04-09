From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: linux-next: Tree for Apr 9 (media/i2c/s5c73m3)
Date: Wed, 09 Apr 2014 18:20:54 +0200
Message-ID: <53457366.6000905@samsung.com>
References: <20140409172233.093c15de27c3b9f3c7c61bd7@canb.auug.org.au>
 <53456EDE.5000807@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <53456EDE.5000807@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media <linux-media@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>
List-Id: linux-next.vger.kernel.org

Hi,

On 09/04/14 18:01, Randy Dunlap wrote:
> On 04/09/2014 12:22 AM, Stephen Rothwell wrote:
>> > Hi all,
>> > 
>> > Please do not add material intended for v3.16 to your linux-next included
>> > branches until after v3.15-rc1 is released.
>> > 
>> > This tree still fails (more than usual) the powerpc allyesconfig build.
>> > 
>> > Changes since 20140408:
>> > 
> on i386:
> CONFIG_OF is not enabled.
> 
> drivers/media/i2c/s5c73m3/s5c73m3-core.c: In function 's5c73m3_get_platform_data':
> drivers/media/i2c/s5c73m3/s5c73m3-core.c:1619:2: error: implicit declaration of function 'v4l2_of_get_next_endpoint' [-Werror=implicit-function-declaration]
> drivers/media/i2c/s5c73m3/s5c73m3-core.c:1619:10: warning: assignment makes pointer from integer without a cast [enabled by default]

I have already prepared a patch for this issue:
https://patchwork.linuxtv.org/patch/23465

--
Thanks,
Sylwester
