From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: next-20170202 build: 4 failures 7 warnings (next-20170202)
Date: Thu, 2 Feb 2017 18:08:44 -0500
Message-ID: <CAP=VYLraQvfRLdFMVCiqS9DtH-GHNYdM+CYZ_hJ+K8GwWLKT+Q@mail.gmail.com>
References: <E1cZEYY-0006f4-PQ@optimist>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:34489 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751861AbdBBXJP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Feb 2017 18:09:15 -0500
Received: by mail-vk0-f65.google.com with SMTP id r136so226681vke.1
        for <linux-next@vger.kernel.org>; Thu, 02 Feb 2017 15:09:15 -0800 (PST)
In-Reply-To: <E1cZEYY-0006f4-PQ@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Build bot for Mark Brown <broonie@kernel.org>, Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Thu, Feb 2, 2017 at 5:23 AM, Build bot for Mark Brown
<broonie@kernel.org> wrote:
> Tree/Branch: next-20170202
> Git describe: next-20170202
> Commit: c356cf7a65 Add linux-next specific files for 20170202
>
> Build Time: 94 min 58 sec
>
> Passed:    6 / 10   ( 60.00 %)
> Failed:    4 / 10   ( 40.00 %)
>
> Errors: 4
> Warnings: 7
> Section Mismatches: 0
>
> Failed defconfigs:
>         arm64-allmodconfig
>         arm-allnoconfig
>         arm-allmodconfig
>
> Errors:
>
>         arm64-allmodconfig
> ../drivers/staging/bcm2835-audio/bcm2835-vchiq.c:97:9: error: implicit declaration of function 'vchi_msg_queue' [-Werror=implicit-function-declaration]
>
>         arm-allnoconfig
> ../mm/nommu.c:1201:15: error: conflicting types for 'do_mmap'
> ../mm/nommu.c:1580:5: error: conflicting types for 'do_munmap'
>

Also in sfr build: http://kisskb.ellerman.id.au/kisskb/buildresult/12924855/

Bisects as follows:

5b8d82e2e798609e113ec0dae37708f0578b68e2 is the first bad commit
commit 5b8d82e2e798609e113ec0dae37708f0578b68e2
Author: Mike Rapoport <rppt@linux.vnet.ibm.com>
Date:   Thu Feb 2 10:46:41 2017 +1100

    userfaultfd: non-cooperative: add event for memory unmaps
