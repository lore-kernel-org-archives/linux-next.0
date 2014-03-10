From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH 0/3] Add support for the M5150 processor
Date: Mon, 10 Mar 2014 13:43:56 -0400
Message-ID: <CAP=VYLribDoh9LyQuNr-RxmRdaVxqNqzCCSAgMxKoZKWd2b1YA@mail.gmail.com>
References: <1393940084-29518-1-git-send-email-markos.chandras@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-we0-f179.google.com ([74.125.82.179]:63485 "EHLO
	mail-we0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754422AbaCJRo1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 10 Mar 2014 13:44:27 -0400
Received: by mail-we0-f179.google.com with SMTP id x48so8979805wes.38
        for <linux-next@vger.kernel.org>; Mon, 10 Mar 2014 10:44:26 -0700 (PDT)
In-Reply-To: <1393940084-29518-1-git-send-email-markos.chandras@imgtec.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Markos Chandras <markos.chandras@imgtec.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>

On Tue, Mar 4, 2014 at 8:34 AM, Markos Chandras
<markos.chandras@imgtec.com> wrote:
> Hi,
>
> This patchset adds support for the recently announced M5150 processor
> http://imgtec.com/mips/mips-series5-mclass-m51xx.asp?NewsID=804

I'm going to skip the bisect, and make a guess that this patchset causes
the following build failures on all pre-existing mips boards:

arch/mips/kernel/cpu-probe.c:856:7: error: 'PRID_IMP_M5150' undeclared
(first use in this function)
arch/mips/kernel/cpu-probe.c:857:16: error: 'CPU_M5150' undeclared
(first use in this function)
make[3]: *** [arch/mips/kernel/cpu-probe.o] Error 1

See this link as one of the many linux-next mips failures:

http://kisskb.ellerman.id.au/kisskb/buildresult/10701712/

Paul.
--

>
> This patchset is for the upstream-sfr/mips-for-linux-next tree
>
> Leonid Yegoshin (3):
>   MIPS: Add processor identifier for the M5150 processor
>   MIPS: Add support for the M5150 processor
>   MIPS: kernel: cpu-probe: Add support for probing M5150 cores
>
>  arch/mips/include/asm/cpu-type.h     | 1 +
>  arch/mips/include/asm/cpu.h          | 3 ++-
>  arch/mips/kernel/cpu-probe.c         | 4 ++++
>  arch/mips/kernel/idle.c              | 1 +
>  arch/mips/mm/c-r4k.c                 | 1 +
>  arch/mips/mm/tlbex.c                 | 1 +
>  arch/mips/oprofile/common.c          | 1 +
>  arch/mips/oprofile/op_model_mipsxx.c | 4 ++++
>  8 files changed, 15 insertions(+), 1 deletion(-)
>
> --
> 1.9.0
>
>
