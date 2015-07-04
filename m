From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: next-20150703 build: 1 failures 73 warnings (next-20150703)
Date: Sat, 4 Jul 2015 00:01:33 -0400
Message-ID: <CAP=VYLqpwQ4OqYMBW4m9oo2ZjiZEda7vn1zSXxLEYtH7ucbOqQ@mail.gmail.com>
References: <E1ZB04o-0001MQ-6U@optimist>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:33490 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751910AbbGDECE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 4 Jul 2015 00:02:04 -0400
Received: by wiwl6 with SMTP id l6so241059352wiw.0
        for <linux-next@vger.kernel.org>; Fri, 03 Jul 2015 21:02:03 -0700 (PDT)
In-Reply-To: <E1ZB04o-0001MQ-6U@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Build bot for Mark Brown <broonie@kernel.org>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, jack@suse.cz, Andrew Morton <akpm@linux-foundation.org>

On Fri, Jul 3, 2015 at 8:28 AM, Build bot for Mark Brown
<broonie@kernel.org> wrote:
> Tree/Branch: next-20150703
> Git describe: next-20150703
> Commit: e58c24353a Add linux-next specific files for 20150703
>
> Build Time: 152 min 12 sec
>
> Passed:    8 / 9   ( 88.89 %)
> Failed:    1 / 9   ( 11.11 %)
>
> Errors: 1
> Warnings: 73
> Section Mismatches: 1
>
> Failed defconfigs:
>         arm-allmodconfig
>
> Errors:
>
>         arm-allmodconfig
> ../drivers/gpu/drm/exynos/exynos_drm_g2d.c:465:7: error: 'vec' undeclared (first use in this function)
>

Bisect:

6e9d331aec60a3dd1bbc035fbdd84a90364b8565 is the first bad commit
commit 6e9d331aec60a3dd1bbc035fbdd84a90364b8565
Author: Jan Kara <jack@suse.cz>
Date:   Fri Jun 19 09:05:45 2015 +1000

    drm/exynos: convert g2d_userptr_get_dma_addr() to use get_vaddr_frames()

Fix seems posted here...

http://permalink.gmane.org/gmane.comp.video.dri.devel/131898

Original problematic commit comes in via the akpm tree....
paul@yow:~/git/linux-head$ git describe --contains 6e9d331aec60a3dd
next-20150703~1^2~4

paul@yow:~/git/linux-head$ git rev-parse next-20150703~1
43fd9052f8cba2ae8e11c0a763ef5a5c512d187d

...which is:

43fd9052f8cb Merge branch 'akpm/master'

Paul.
