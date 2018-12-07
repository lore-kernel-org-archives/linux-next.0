From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: linux-next: build failure after merge of the thermal tree
Date: Fri, 7 Dec 2018 12:27:50 +0530
Message-ID: <CAHLCerMsVE1Rm1sP1aBvXf7eAYr3Jzk=cNda+wMRUHnv+zf27g@mail.gmail.com>
References: <20181207122456.754129f4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181207122456.754129f4@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Zhang Rui <rui.zhang@intel.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen, Rui,

On Fri, Dec 7, 2018 at 6:55 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Zhang,
>
> After merging the thermal tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/thermal/qcom/qcom-spmi-temp-alarm.c:26:10: fatal error: thermal_core.h: No such file or directory
>  #include "thermal_core.h"
>           ^~~~~~~~~~~~~~~~
>
> Caused by commit
>
>   150a4fe8c335 ("drivers: thermal: Move QCOM_SPMI_TEMP_ALARM into the qcom subdir")

Apologies for the build error. My scripts failed to enable the config
and test it correctly. There was bug on where the .config file ended
up. I've fixed it and sent v4 of the patches. Please consider applying
them instead.

Regards,
Amit

> I have used the thermal tree from next-20181206 for today.
>
> --
> Cheers,
> Stephen Rothwell
