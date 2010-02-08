From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH V10] RO/NX protection for loadable kernel modules
Date: Mon, 8 Feb 2010 11:59:44 +1030
Message-ID: <201002081159.45219.rusty@rustcorp.com.au>
References: <817ecb6f1002011539g3f30416fi60c7c5222cab8f3@mail.gmail.com> <201002021429.38331.rusty@rustcorp.com.au> <4B67C0F9.2020202@zytor.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:39154 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753878Ab0BHB3u (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 7 Feb 2010 20:29:50 -0500
In-Reply-To: <4B67C0F9.2020202@zytor.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Siarhei Liakh <sliakh.lkml@gmail.com>, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, Arjan van de Ven <arjan@infradead.org>, James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>

On Tue, 2 Feb 2010 04:36:49 pm H. Peter Anvin wrote:
> On 02/01/2010 07:59 PM, Rusty Russell wrote:
> > On Tue, 2 Feb 2010 10:09:53 am Siarhei Liakh wrote:
> >> This patch is a logical extension of the protection provided by
> >> CONFIG_DEBUG_RODATA to LKMs. The protection is provided by splitting
> >> module_core and module_init into three logical parts each and setting
> >> appropriate page access permissions for each individual section:
> >>
> >>   1. Code: RO+X
> >>   2. RO data: RO+NX
> >>   3. RW data: RW+NX
> >
> > Thanks, applied!
> 
> I also applied this to the -tip tree... do you prefer to carry it or 
> should I leave it as is?

I'm always happy for you to do my work for me!  There are no other module
patches likely to conflict.

Acked-by: Rusty Russell <rusty@rustcorp.com.au>

Cheers,
Rusty.
