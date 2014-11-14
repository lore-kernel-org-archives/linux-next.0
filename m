From: Josh Triplett <josh@joshtriplett.org>
Subject: Re: linux-next: build warnings after merge of the tiny tree
Date: Fri, 14 Nov 2014 12:38:30 -0800
Message-ID: <20141114203830.GA16553@jtriplet-mobl1>
References: <20141111174304.69b9ed45@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:35587 "EHLO
	relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754377AbaKNUij (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 14 Nov 2014 15:38:39 -0500
Content-Disposition: inline
In-Reply-To: <20141111174304.69b9ed45@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Catalina Mocanu <catalina.mocanu@gmail.com>

On Tue, Nov 11, 2014 at 05:43:04PM +1100, Stephen Rothwell wrote:
> Hi Josh,
> 
> After merging the tiny tree, today's linux-next build (powerpc64
> allnoconfig) produced these warnings:
> 
> kernel/compat.c:33:12: warning: 'compat_get_timex' defined but not used [-Wunused-function]
>  static int compat_get_timex(struct timex *txc, struct compat_timex __user *utp)
>             ^
> kernel/compat.c:63:12: warning: 'compat_put_timex' defined but not used [-Wunused-function]
>  static int compat_put_timex(struct compat_timex __user *utp, struct timex *txc)
>             ^
> 
> Introduced by commit 7beb114f18e0 ("kernel: time: Compile out NTP
> support").  Neither of these functions is needed if CONFIG_NTP is not
> set.

Fixed.

- Josh Triplett
