From: Jonas Gorski <jogo@openwrt.org>
Subject: Re: [PATCH 0/3] Add support for the M5150 processor
Date: Wed, 12 Mar 2014 12:45:24 +0100
Message-ID: <CAOiHx=kH+e6At0coBjC+-4gc-VHpXtrXc6Cki3Ga7x3b4AKJ7Q@mail.gmail.com>
References: <1393940084-29518-1-git-send-email-markos.chandras@imgtec.com>
 <CAP=VYLribDoh9LyQuNr-RxmRdaVxqNqzCCSAgMxKoZKWd2b1YA@mail.gmail.com> <CAOiHx=mNtTv01CyjC=rXKzTeF79sbBqnZBQWbWXAkKnrGeZrng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 0.mx.nanl.de ([217.115.11.12]:42119 "EHLO mail.nanl.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752717AbaCLLpv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 12 Mar 2014 07:45:51 -0400
Received: from mail-qa0-f46.google.com (mail-qa0-f46.google.com [209.85.216.46])
	by mail.nanl.de (Postfix) with ESMTPSA id A266945F37
	for <linux-next@vger.kernel.org>; Wed, 12 Mar 2014 11:45:31 +0000 (UTC)
Received: by mail-qa0-f46.google.com with SMTP id i13so9869905qae.33
        for <linux-next@vger.kernel.org>; Wed, 12 Mar 2014 04:45:45 -0700 (PDT)
In-Reply-To: <CAOiHx=mNtTv01CyjC=rXKzTeF79sbBqnZBQWbWXAkKnrGeZrng@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Markos Chandras <markos.chandras@imgtec.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>

On Mon, Mar 10, 2014 at 8:21 PM, Jonas Gorski <jogo@openwrt.org> wrote:
> On Mon, Mar 10, 2014 at 6:43 PM, Paul Gortmaker
> <paul.gortmaker@windriver.com> wrote:
>> On Tue, Mar 4, 2014 at 8:34 AM, Markos Chandras
>> <markos.chandras@imgtec.com> wrote:
>>> Hi,
>>>
>>> This patchset adds support for the recently announced M5150 processor
>>> http://imgtec.com/mips/mips-series5-mclass-m51xx.asp?NewsID=804
>>
>> I'm going to skip the bisect, and make a guess that this patchset causes
>> the following build failures on all pre-existing mips boards:
>>
>> arch/mips/kernel/cpu-probe.c:856:7: error: 'PRID_IMP_M5150' undeclared
>> (first use in this function)
>> arch/mips/kernel/cpu-probe.c:857:16: error: 'CPU_M5150' undeclared
>> (first use in this function)
>> make[3]: *** [arch/mips/kernel/cpu-probe.o] Error 1
>>
>> See this link as one of the many linux-next mips failures:
>>
>> http://kisskb.ellerman.id.au/kisskb/buildresult/10701712/
>
>
> Looking at mips-next and patchwork, the problem isn't the patchset
> itself, but rather that only the third patch was applied.
>
> Ralf, I think you missed the following two patches :)
>
> http://patchwork.linux-mips.org/patch/6595/
> http://patchwork.linux-mips.org/patch/6596/

For me it now builds through, thank you!


Regards
Jonas
