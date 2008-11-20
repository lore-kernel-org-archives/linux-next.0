From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] Fix arch/x86/kernel/setup.c build warning when
	!CONFIG_X86_RESERVE_LOW_64K
Date: Thu, 20 Nov 2008 09:04:57 +0100
Message-ID: <20081120080457.GC21785@elte.hu>
References: <1227135915-32628-1-git-send-email-aciddeath@gmail.com> <1227135915-32628-2-git-send-email-aciddeath@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:47022 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753857AbYKTIFL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 20 Nov 2008 03:05:11 -0500
Content-Disposition: inline
In-Reply-To: <1227135915-32628-2-git-send-email-aciddeath@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Richard A. Holden III" <aciddeath@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>


* Richard A. Holden III <aciddeath@gmail.com> wrote:

> Fix
> arch/x86/kernel/setup.c:592: warning: 'dmi_low_memory_corruption' defined but not used
> 
> this is only used if CONFIG_X86_RESERVE_LOW_64K is defined.
> 
> Signed-off-by: Richard A. Holden III <aciddeath@gmail.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: H. Peter Anvin <hpa@zytor.com>
> ---
>  arch/x86/kernel/setup.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)

applied to tip/x86/memory-corruption-check, thanks Richard!

	Ingo
