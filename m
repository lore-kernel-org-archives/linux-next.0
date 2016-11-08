From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: linux-next: build failure after merge of the rtc tree
Date: Tue, 8 Nov 2016 23:21:32 +0100
Message-ID: <20161108222132.t7okgkv452baj6ub@piout.net>
References: <20161108174152.4a5620c4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from up.free-electrons.com ([163.172.77.33]:59467 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S932197AbcKHWVh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Nov 2016 17:21:37 -0500
Content-Disposition: inline
In-Reply-To: <20161108174152.4a5620c4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>

Hi,

On 08/11/2016 at 17:41:52 +1100, Stephen Rothwell wrote :
> Hi Alexandre,
> 
> After merging the rtc tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> 
> Caused by commit
> 
>   f9eb69d1ae2f ("rtc: jz4740: Add support for acting as the system power controller")
> 
> I have used the rtc tree from next-20161028 for today.
> 

Thanks for the report it is fixed in rtc-next now.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
