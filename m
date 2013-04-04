From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: linux-next: manual merge of the imx-mxs tree with the pm tree
Date: Thu, 4 Apr 2013 10:49:32 +0530
Message-ID: <CAKohpome+u870GuA411UFWA_pTdkvbCSADWcHZ1MeD53QJ3zqw@mail.gmail.com>
References: <20130404161806.8f53f96c7197b978bfa1b63e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:42287 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1763351Ab3DDFTd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Apr 2013 01:19:33 -0400
Received: by mail-oa0-f47.google.com with SMTP id o17so2326846oag.20
        for <linux-next@vger.kernel.org>; Wed, 03 Apr 2013 22:19:33 -0700 (PDT)
In-Reply-To: <20130404161806.8f53f96c7197b978bfa1b63e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Shawn Guo <shawn.guo@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Markus Pargmann <mpa@pengutronix.de>, "Rafael J. Wysocki" <rjw@sisk.pl>

On 4 April 2013 10:48, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Today's linux-next merge of the imx-mxs tree got a conflict in
> arch/arm/mach-imx/cpufreq.c between commits b43a7ffbf33b ("cpufreq:
> Notify all policy->cpus in cpufreq_notify_transition()") and eb2f50ff93f0
> ("cpufreq: drivers: Remove unnecessary assignments of policy-> members")
> from the pm tree and commit 180cb7d6ab8c ("ARM: imx: Remove cpufreq
> driver") from the imx-mxs tree.
>
> The latter removed the file, so I just did that and can carry the fix as
> necessary (no action is required).

Thanks. Looks correct.
