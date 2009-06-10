From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: next: voyager: sm/smp.h:205: error: 'smp_ops' undeclared
Date: Wed, 10 Jun 2009 19:14:11 +0000
Message-ID: <1244661251.17432.22.camel@mulgrave.site>
References: <a4423d670906100448o161fb18am1868878c827376b5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:35135 "EHLO
	bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757761AbZFJTOL (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Jun 2009 15:14:11 -0400
In-Reply-To: <a4423d670906100448o161fb18am1868878c827376b5@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: linux-next <linux-next@vger.kernel.org>

On Wed, 2009-06-10 at 15:48 +0400, Alexander Beregalov wrote:
> Hi
> 
> arch/x86/include/asm/smp.h: In function 'hard_smp_processor_id':
> arch/x86/include/asm/smp.h:205: error: 'smp_ops' undeclared (first use
> in this function)
> 
> The code
> static inline int hard_smp_processor_id(void)
> {
>         return smp_ops.hard_smp_processor_id();
> }
> should be under #ifdef CONFIG_SMP

Actually, that won't work either ... it turns out the UP IO-APIC case
needs hard_smp_processor_id().  I'm starting to think that turning it
into an smp_ops function was the wrong thing to do.

James
