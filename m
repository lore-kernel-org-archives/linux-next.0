From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: linux-next: manual merge of the c6x tree
Date: Sat, 26 Oct 2013 14:19:38 +0100
Message-ID: <20131026131938.GT16735@n2100.arm.linux.org.uk>
References: <1382632289-18523-1-git-send-email-treding@nvidia.com> <1382706224-8859-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:41666 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751695Ab3JZNT6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 26 Oct 2013 09:19:58 -0400
Content-Disposition: inline
In-Reply-To: <1382706224-8859-1-git-send-email-treding@nvidia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Will Deacon <will.deacon@arm.com>, Mark Salter <msalter@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Oct 25, 2013 at 03:03:39PM +0200, Thierry Reding wrote:
> diff --cc arch/arm/Kconfig
> index c06647d,7db8abe0..b6a708e
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@@ -5,7 -5,7 +5,8 @@@ config AR
>   	select ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE
>   	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>   	select ARCH_HAVE_CUSTOM_GPIO_H
>  +	select ARCH_USE_CMPXCHG_LOCKREF
> + 	select ARCH_MIGHT_HAVE_PC_PARPORT
>   	select ARCH_WANT_IPC_PARSE_VERSION

Thanks.  Generally we want these things to be arranged alphabetically to
reduce the longer term chances of hitting merge conflicts, but in this
case it wouldn't make any difference.
