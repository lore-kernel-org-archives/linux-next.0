From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH V10] RO/NX protection for loadable kernel modules
Date: Tue, 2 Feb 2010 14:29:38 +1030
Message-ID: <201002021429.38331.rusty@rustcorp.com.au>
References: <817ecb6f1002011539g3f30416fi60c7c5222cab8f3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:53616 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753947Ab0BBD7p (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Feb 2010 22:59:45 -0500
In-Reply-To: <817ecb6f1002011539g3f30416fi60c7c5222cab8f3@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Siarhei Liakh <sliakh.lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, Arjan van de Ven <arjan@infradead.org>, James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>

On Tue, 2 Feb 2010 10:09:53 am Siarhei Liakh wrote:
> This patch is a logical extension of the protection provided by
> CONFIG_DEBUG_RODATA to LKMs. The protection is provided by splitting
> module_core and module_init into three logical parts each and setting
> appropriate page access permissions for each individual section:
> 
>  1. Code: RO+X
>  2. RO data: RO+NX
>  3. RW data: RW+NX

Thanks, applied!

Cheers,
Rusty.
