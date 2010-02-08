From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v8] RO/NX protection for loadable kernel modules
Date: Sun, 07 Feb 2010 17:54:03 -0800
Message-ID: <4B6F6EBB.5070106@zytor.com>
References: <817ecb6f1001311522q52bf4eebmb748c486dcd5ad35@mail.gmail.com> <873a1jdyrg.fsf@basil.nowhere.org> <201002081215.31527.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:49237 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753211Ab0BHB6V (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 7 Feb 2010 20:58:21 -0500
In-Reply-To: <201002081215.31527.rusty@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Andi Kleen <andi@firstfloor.org>, Siarhei Liakh <sliakh.lkml@gmail.com>, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, Arjan van de Ven <arjan@infradead.org>, James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>

On 02/07/2010 05:45 PM, Rusty Russell wrote:
> 
> Strict RO/NX protection.  But without the option enabled, the patch gives
> best-effort protection, which is nice (for no additional space).
> 

Since Linux kernel modules are actually .o's, not .so's, in theory we
could bundle the sections together by type.  There could still be
external fragmentation, of course, but on most systems module unload is
relatively rare.

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.
