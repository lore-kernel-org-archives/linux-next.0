From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: linux-next: build warning after merge of the rtc tree
Date: Tue, 10 Jan 2017 11:59:22 +0100
Message-ID: <20170110105922.lsso4g7zjfzeryfa@piout.net>
References: <20170110140100.4a5a0158@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:56012 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932624AbdAJK7f (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Jan 2017 05:59:35 -0500
Content-Disposition: inline
In-Reply-To: <20170110140100.4a5a0158@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Gregory CLEMENT <gregory.clement@free-electrons.com>

Hi,

On 10/01/2017 at 14:01:00 +1100, Stephen Rothwell wrote :
> Hi Alexandre,
> 
> After merging the rtc tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> drivers/rtc/rtc-armada38x.c: In function 'read_rtc_register_wa':
> drivers/rtc/rtc-armada38x.c:131:25: warning: 'index_max' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   return rtc->val_to_freq[index_max].value;
>                          ^
> 
> Introduced by commit
> 
>   61cffa2438e3 ("rtc: armada38x: Follow the new recommendation for errata implementation")

This is definitively a false positive, is it worth fixing it?


-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
