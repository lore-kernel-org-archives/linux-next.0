From: Peter Foley <pefoley2@pefoley.com>
Subject: Re: linux-next: build failure after merge of the rd-docs tree
Date: Tue, 16 Sep 2014 13:19:07 -0400
Message-ID: <CAOFdcFMDnR50cS-Geb0S1S2VRPzZqDr9zzqUp-DpMYLfF0qtvQ@mail.gmail.com>
References: <20140916171102.61509be5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-la0-f41.google.com ([209.85.215.41]:36074 "EHLO
	mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754031AbaIPRT3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 16 Sep 2014 13:19:29 -0400
Received: by mail-la0-f41.google.com with SMTP id s18so228003lam.28
        for <linux-next@vger.kernel.org>; Tue, 16 Sep 2014 10:19:27 -0700 (PDT)
In-Reply-To: <20140916171102.61509be5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, Sep 16, 2014 at 3:11 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Randy,
>
> After merging the rd-docs tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>
> Documentation/vDSO/vdso_test.c:15:22: fatal error: sys/auxv.h: No such file or directory
>

What glibc version are you running?
It appears the function getauxval (and I assume the missing header)
were only added in glibc 2.16.

Thanks,

Peter
