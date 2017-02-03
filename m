From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: next-20170202 build: 4 failures 7 warnings (next-20170202)
Date: Fri, 3 Feb 2017 18:04:41 +0100
Message-ID: <CAK8P3a3MkTfHyHi=ggrvygV-tCSP+2=jNuT_kX-GKt5d=FYtkQ@mail.gmail.com>
References: <E1cZEYY-0006f4-PQ@optimist> <CAP=VYLraQvfRLdFMVCiqS9DtH-GHNYdM+CYZ_hJ+K8GwWLKT+Q@mail.gmail.com>
 <20170203120123.ep5ceio5gzbnismn@sirena.org.uk> <20170203164442.GA3183@rapoport-lnx>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:35742 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750808AbdBCREm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Feb 2017 12:04:42 -0500
Received: by mail-io0-f194.google.com with SMTP id m98so2806802iod.2
        for <linux-next@vger.kernel.org>; Fri, 03 Feb 2017 09:04:42 -0800 (PST)
In-Reply-To: <20170203164442.GA3183@rapoport-lnx>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc: Mark Brown <broonie@kernel.org>, linaro-kernel@lists.linaro.org, kernel-build-reports@lists.linaro.org, Hillf Danton <hillf.zj@alibaba-inc.com>, Michal Hocko <mhocko@suse.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On Fri, Feb 3, 2017 at 5:44 PM, Mike Rapoport <rppt@linux.vnet.ibm.com> wrote:

>> >     userfaultfd: non-cooperative: add event for memory unmaps
>>
>> I'm seeing that showing up as 197b090832eaa4a6e in -next, adding the
>> other people who acked/signed off on the commit.
>
> Michal Hocko sent a fix yesterday:
>
> http://www.spinics.net/lists/linux-mm/msg121252.html

Sorry I missed that, and sent another copy now. It seems that Michal
only fixed mm/nommu.c though, while I caught another hunk in ipc/shm.c
that also needs to be fixed.

Let me know if I should resend that one line change by itself.

    Arnd
