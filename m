From: Richard Purdie <rpurdie@rpsys.net>
Subject: Re: linux-next: build failure after merge of the final tree
 (backlight related)
Date: Thu, 11 Mar 2010 09:36:10 -0800
Message-ID: <1268328970.1625.2.camel@rex>
References: <20100310180343.c6305829.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100310180343.c6305829.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, Haojian Zhuang <haojian.zhuang@marvell.com>, Samuel Ortiz <sameo@linux.intel.com>
List-Id: linux-next.vger.kernel.org

Hi,

On Wed, 2010-03-10 at 18:03 +1100, Stephen Rothwell wrote:
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/video/backlight/88pm860x_bl.c: In function 'pm860x_backlight_probe':
> drivers/video/backlight/88pm860x_bl.c:227: error: too few arguments to function 'backlight_device_register'
> drivers/video/backlight/max8925_bl.c: In function 'max8925_backlight_probe':
> drivers/video/backlight/max8925_bl.c:137: error: too few arguments to function 'backlight_device_register'
> 
> Caused by commit 85d0968607ab8c61de45a68c643b198020a1369d ("backlight:
> Allow properties to be passed at registration") interacting with commits
> d07e8bf83fd71567aaf9c27c3b133ab3cf8f3c4c ("backlight: Enable backlight in
> 88pm860x") and 4f811ef0d40048ae80b6ea77080b814725bffc58 ("backlight:
> Enable max8925 backlight") which are now in Linus' tree (via the mfd tree)

Sorry about that, I knew there were going to be issues with that patch
and had meant to commit and test but not push until I fixed that issue.
I've fixed up the tree now.

Cheers,

Richard
