From: Siarhei Liakh <sliakh.lkml@gmail.com>
Subject: Re: [PATCH 1/4 V2] [tip:x86/mm] Correcting improper large page
	preservation
Date: Thu, 10 Jun 2010 22:11:38 -0400
Message-ID: <AANLkTinkhXQfE9Ejcb3dJeMZWl6gxbO3-gzqPUBxei4N@mail.gmail.com>
References: <4C0C4491.80708@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:48695 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754499Ab0FKCLj convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 Jun 2010 22:11:39 -0400
In-Reply-To: <4C0C4491.80708@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org
Cc: Arjan van de Ven <arjan@infradead.org>, James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@elte.hu>, Rusty Russell <rusty@rustcorp.com.au>, Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>

On Sun, Jun 6, 2010 at 9:00 PM, Siarhei Liakh <sliakh.lkml@gmail.com> w=
rote:
> This patch fixes a bug in try_preserve_large_page() which may result
> in improper large page preservation and improper application of page
> attributes to the memory area outside of the original change request.
> More specifically, the problem manifests itself when set_memory_*() i=
s
> called for several pages at the beginning of the large page and
> try_preserve_large_page() erroneously concludes that the change can b=
e
> applied to whole large page.
> The fix consists of 3 parts:
> 1. addition of "required" protection attributes in
> static_protections(), so .data and .bss can be guaranteed to stay "RW=
"
> 2. static_protections() is now called for every small page within
> large page to determine compatibility of new protection attributes
> (instead of just small pages within the requested range).
> 3. large page can be preserved only if attribute change is
> large-page-aligned and covers whole large page.
>
> V1: =A0try_preserve_large_page() patch for Linux 2.6.34-rc2
> V2: =A0replaced pfn check with address check for kernel rw-data
>
> Signed-off-by: Siarhei Liakh <sliakh.lkml@gmail.com>
> Signed-off-by: Xuxian Jiang <jiang@cs.ncsu.edu>
> Reviewed-by: Suresh Siddha <suresh.b.siddha@intel.com>
> ---

Does anyone have any feedback on this patch set?

Thank you.
