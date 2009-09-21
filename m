From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH v6] RO/NX protection for loadable kernel modules
Date: Tue, 22 Sep 2009 09:29:29 +0930
Message-ID: <200909220929.32301.rusty@rustcorp.com.au>
References: <817ecb6f0909101950v2fc6dc6u5cbc40cd9a9dde77@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:60275 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754532AbZIUX7h (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 21 Sep 2009 19:59:37 -0400
In-Reply-To: <817ecb6f0909101950v2fc6dc6u5cbc40cd9a9dde77@mail.gmail.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Siarhei Liakh <sliakh.lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, Arjan van de Ven <arjan@infradead.org>, James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>

On Fri, 11 Sep 2009 12:20:47 pm Siarhei Liakh wrote:
> +/*
> + * LKM RO/NX protection: protect module's text/ro-data
> + * from modification and any data from execution.
> + */
> +static void set_section_ro_nx(void *base,
> +			unsigned long text_size,
> +			unsigned long ro_size,
> +			unsigned long total_size)
> +{
> +#ifdef CONFIG_X86

This is usually considered a bad idea.  Make a new config option,
CONFIG_HAVE_SET_MEMORY_PROTECTION, select it in arch/x86/Kconfig.
Then wrap the entire functions in one #ifdef CONFIG_HAVE_....
and put empty versions in the #else.

Thanks,
Rusty.
