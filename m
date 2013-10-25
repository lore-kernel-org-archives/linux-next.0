From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Oct 24
Date: Thu, 24 Oct 2013 22:02:22 -0700
Message-ID: <5269FB5E.6010901@roeck-us.net>
References: <1382632289-18523-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1382632289-18523-1-git-send-email-treding@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>
List-Id: linux-next.vger.kernel.org

On 10/24/2013 09:31 AM, Thierry Reding wrote:
> Hi all,
>
> I've uploaded today's linux-next tree to the master branch of the
> repository below:
>
>          git://gitorious.org/thierryreding/linux-next.git
>
> A next-20131024 tag is also provided for convenience.
>
> Quite a few new conflicts. Some of them non-trivial. I've fixed another
> set of build failures, so 32-bit and 64-bit allmodconfigs build fine on
> x86. ARM and x86 default configurations also build fine. PowerPC is in
> pretty bad shape, mostly due to some OF header rework going on.
>

Hmm ... I see

Building arm:defconfig ... failed
--------------
Error log:
drivers/built-in.o: In function `mmc_gpio_request_cd':
clkdev.c:(.text+0x74cf8): undefined reference to `devm_gpio_request_one'
make: *** [vmlinux] Error 1

Otherwise pretty much the same as yesterday, with a build log of
	total: 110 pass: 88 skipped: 4 fail: 18

This is with "v3.12-rc5-7941-g765f88c".

Guenter
