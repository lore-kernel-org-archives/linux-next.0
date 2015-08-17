From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: linux-next: manual merge of the thermal-soc tree with the arm
 tree
Date: Mon, 17 Aug 2015 07:54:07 +0530
Message-ID: <20150817022407.GN1162@linux>
References: <20150817121754.04736e67@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:35251 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752637AbbHQCYM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 16 Aug 2015 22:24:12 -0400
Received: by pdrg1 with SMTP id g1so50332948pdr.2
        for <linux-next@vger.kernel.org>; Sun, 16 Aug 2015 19:24:11 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150817121754.04736e67@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Eduardo Valentin <edubezval@gmail.com>, Russell King <linux@arm.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 17-08-15, 12:17, Stephen Rothwell wrote:
> Hi Eduardo,
> 
> Today's linux-next merge of the thermal-soc tree got a conflict in:
> 
>   drivers/thermal/cpu_cooling.c
> 
> between commit:
> 
>   df6f527755a5 ("thermal: cpu_cooling: fix lockdep problems in cpu_cooling")
> 
> from the arm tree and commits:
> 
>   02373d7c69b4 ("thermal: cpu_cooling: fix lockdep problems in cpu_cooling")
>   a24af233a1fd ("thermal/cpu_cooling: convert 'switch' block to 'if' block in notifier")
> 
> from the thermal-soc tree.
> 
> I fixed it up (the first two look like two versions of the same patch,
> so I used the version from the thermal-soc tree) and can carry the fix
> as necessary (no action is required).

Right the version from the thermal tree is the updated version and
should be picked.

> Russell: that commit in your tree has no Signed-off-by :-(

No. It does have a SOB, but that followed a bit of rant/history on why
Russell carried this patch :)

Russell should be dropping that patch soon, AFAIU.

-- 
viresh
