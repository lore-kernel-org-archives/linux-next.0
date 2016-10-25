From: Lina Iyer <lina.iyer@linaro.org>
Subject: Re: linux-next: manual merge of the pm tree with the imx-mxs tree
Date: Mon, 24 Oct 2016 21:32:08 -0600
Message-ID: <20161025033208.GI72940@linaro.org>
References: <20161025104729.35f5b009@canb.auug.org.au>
 <8126928.lSNgbyj5lv@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f170.google.com ([209.85.161.170]:33298 "EHLO
        mail-yw0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965056AbcJYDcL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Oct 2016 23:32:11 -0400
Received: by mail-yw0-f170.google.com with SMTP id t192so25519650ywf.0
        for <linux-next@vger.kernel.org>; Mon, 24 Oct 2016 20:32:10 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <8126928.lSNgbyj5lv@vostro.rjw.lan>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Shawn Guo <shawn.guo@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>

On Tue, Oct 25 2016 at 17:51 -0600, Rafael J. Wysocki wrote:
>On Tuesday, October 25, 2016 10:47:29 AM Stephen Rothwell wrote:
>> Hi Rafael,
>>
>> Today's linux-next merge of the pm tree got a conflict in:
>>
>>   arch/arm/mach-imx/gpc.c
>>
>> between commits:
>>
>>   eef0b282bb58 ("ARM: imx: gpc: Initialize all power domains")
>>   f9d1f7a7ad91 ("ARM: imx: gpc: Fix the imx_gpc_genpd_init() error path")
>>
>> from the imx-mxs tree and commit:
>>
>>   59d65b73a23c ("PM / Domains: Make genpd state allocation dynamic")
>>
>> from the pm tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary.
>
>Thanks Stephen!
>
>Lina, please have a look at the Stephen's fix and let me know if that
>conflict should be resolved in a different way.
>
Hi Rafael,
Stephen's conflict resolution seems correct. Thanks Stephen.

-- Lina
