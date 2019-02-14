From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: linux-next: build warning after merge of the leds tree
Date: Thu, 14 Feb 2019 22:13:45 +0100
Message-ID: <a741b99c-83ff-547b-90d6-f54f8f7de966@gmail.com>
References: <20190214144610.3672e9d7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190214144610.3672e9d7@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Kazior <michal@plume.com>, Pavel Machek <pavel@ucw.cz>, Anders Roxell <anders.roxell@linaro.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen and all,

On 2/14/19 4:46 AM, Stephen Rothwell wrote:
> Hi Jacek,
> 
> After merging the leds tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/leds/leds-lp55xx-common.c: In function 'lp55xx_firmware_loaded':
> drivers/leds/leds-lp55xx-common.c:217:1: warning: label 'out' defined but not used [-Wunused-label]
>   out:
>   ^~~

Thank you for the heads-up. It's my bad - I didn't use sparse on it.

Fixed up the original patch.

> Introduced by commit
> 
>    905c2157dd19 ("leds: lp55xx: fix null deref on firmware load failure")
> 

-- 
Best regards,
Jacek Anaszewski
