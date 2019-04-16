From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: linux-next: build warning after merge of the chrome-platform tree
Date: Tue, 16 Apr 2019 11:09:07 +0200
Message-ID: <3023bc2f-950f-0f78-166a-b54542cc3680@collabora.com>
References: <20190416143030.07537982@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190416143030.07537982@canb.auug.org.au>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Benson Leung <bleung@google.com>, Guenter Roeck <groeck@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nick Crews <ncrews@chromium.org>
List-Id: linux-next.vger.kernel.org



On 16/4/19 6:30, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the chrome-platform tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> In file included from drivers/platform/chrome/wilco_ec/debugfs.c:11:
> drivers/platform/chrome/wilco_ec/debugfs.c: In function 'fops_h1_gpio_open':
> drivers/platform/chrome/wilco_ec/debugfs.c:210:59: warning: format '%x' expects argument of type 'unsigned int', but argument 2 has type 'long long unsigned int' [-Wformat=]
>  DEFINE_DEBUGFS_ATTRIBUTE(fops_h1_gpio, h1_gpio_get, NULL, "0x%02x\n");
>                                                            ^~~~~~~~~~
> include/linux/debugfs.h:45:29: note: in definition of macro 'DEFINE_DEBUGFS_ATTRIBUTE'
>   __simple_attr_check_format(__fmt, 0ull);   \
>                              ^~~~~
> 
> Introduced by commit
> 
>   db6c540a0018 ("platform/chrome: wilco_ec: Add h1_gpio status to debugfs")
> 

Fixed, I need to automate my builders a bit more to catch these things. Sorry
for the noise. Thanks.

Enric
