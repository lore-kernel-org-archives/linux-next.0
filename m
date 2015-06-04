From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: next-20150603 build: 5 failures 55 warnings (next-20150603)
Date: Wed, 3 Jun 2015 20:26:25 -0400
Message-ID: <CAP=VYLpdw76=RzBt0rHwQOsytoOeoZtewzCBjnsD+4oWuKhmbA@mail.gmail.com>
References: <E1Z08Mt-0006dU-4j@optimist> <CAP=VYLojVYPwC7N5ePFQ08aTd0a3G5SEirME8bfDuSASyM4jpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:36341 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752516AbbFDA05 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Jun 2015 20:26:57 -0400
Received: by wibdq8 with SMTP id dq8so108301946wib.1
        for <linux-next@vger.kernel.org>; Wed, 03 Jun 2015 17:26:56 -0700 (PDT)
In-Reply-To: <CAP=VYLojVYPwC7N5ePFQ08aTd0a3G5SEirME8bfDuSASyM4jpw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Build bot for Mark Brown <broonie@kernel.org>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Wed, Jun 3, 2015 at 6:38 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> On Wed, Jun 3, 2015 at 9:06 AM, Build bot for Mark Brown
> <broonie@kernel.org> wrote:

[...]

>
>> ../drivers/hwtracing/coresight/coresight-replicator-qcom.c:214:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
>> ../drivers/hwtracing/coresight/coresight-replicator-qcom.c:214:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]
>
> I can't fix this one from my tree since the code only exists in next.
> But I've passed the fix onto Greg since it comes via his staging tree:
>
> https://lkml.kernel.org/r/1433364777-29651-1-git-send-email-paul.gortmaker@windriver.com

BTW, A similar one is in arm64 in drivers/hwtracing/coresight/coresight-etm4x.c.
I've sent that fix to Greg as well, since I can't apply it locally to my trees.

https://lkml.kernel.org/r/1433376236-7347-1-git-send-email-paul.gortmaker@windriver.com
