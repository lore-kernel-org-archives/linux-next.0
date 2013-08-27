From: Benoit Cousson <bcousson@baylibre.com>
Subject: Re: linux-next: manual merge of the arm-soc tree with the usb tree
Date: Tue, 27 Aug 2013 16:05:45 +0200
Message-ID: <521CB239.6050409@baylibre.com>
References: <20130827181353.319c150858829df1bb68d60b@canb.auug.org.au> <521C6961.9020103@linutronix.de> <CABxcv=mg6t5wPqpF3j5sr_76qfZ7N7KgpWhcKSGoPTOcaR=V6A@mail.gmail.com> <521CA888.1080909@baylibre.com> <521CAF59.1090203@linutronix.de> <521CB046.9070408@baylibre.com> <521CB18B.4080000@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <521CB18B.4080000@linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Javier Martinez Canillas <javier@dowhile0.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Felipe Balbi <balbi@ti.com>, linux-next@vger.kernel.org, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, "khilman@linaro.org" <khilman@linaro.org>
List-Id: linux-next.vger.kernel.org

On 27/08/2013 16:02, Sebastian Andrzej Siewior wrote:
> On 08/27/2013 03:57 PM, Benoit Cousson wrote:
>> + Kevin,
>>
>> On 27/08/2013 15:53, Sebastian Andrzej Siewior wrote:
>>> What do we do now?
>>
>> Cannot you just merge the stable arm-soc/dt branch into your branch
>> before applying your patches?
>
> That is up to Greg. This changes sat in his usb-next tree for a while
> now. And before they hit Greg they were in Felipe's tree for a while.
>
> To be exact, last .dts change via USB was:
>
> Author:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> AuthorDate: Thu Jun 20 12:13:04 2013 +0200
> Commit:     Felipe Balbi <balbi@ti.com>
> CommitDate: Fri Aug 9 17:40:16 2013 +0300
>
> 	usb: musb dma: add cppi41 dma driver

Mmm, if that branch is supposed to be stable, I'm not sure it will be 
doable...

Maybe we should do the other way around? And merge usb-next into arm-soc/dt.

Kevin, Olof?

Regards,
Benoit
