From: "Vegard Nossum" <vegard.nossum@gmail.com>
Subject: Re: linux-next: x86 tree build failure
Date: Thu, 17 Jul 2008 11:23:36 +0200
Message-ID: <19f34abd0807170223t7a81dbcfyb860b5e3fc32251c@mail.gmail.com>
References: <20080717120754.66b6c14c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from el-out-1112.google.com ([209.85.162.182]:19777 "EHLO
	el-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754385AbYGQJXi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Jul 2008 05:23:38 -0400
Received: by el-out-1112.google.com with SMTP id z25so1185432ele.1
        for <linux-next@vger.kernel.org>; Thu, 17 Jul 2008 02:23:37 -0700 (PDT)
In-Reply-To: <20080717120754.66b6c14c.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org

On Thu, Jul 17, 2008 at 4:07 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>
> arch/x86/kernel/syscall_64.c:27: error: array index in initializer exceeds array bounds
> arch/x86/kernel/syscall_64.c:27: error: (near initialization for 'sys_call_table')
> arch/x86/kernel/syscall_64.c:27: warning: excess elements in array initializer
> arch/x86/kernel/syscall_64.c:27: warning: (near initialization for 'sys_call_table')
>
> Reverting commit aa27f95867447916d97c7aa6e5422ff6518630dd ("x86:
> consolidate header guards") makes it build ok.  I found that hard to
> believe, so I undid the revert and it fails again.

Oh, this is in next already?

The basic problem is that I completely overlooked the fact that some
headers use the guards of _other_ headers in #if-checks. I think we
should drop the consolidations completely until I have fixed the
script to replace the header guard names which are used in other files
as well. I'm sorry :-/


Vegard

-- 
"The animistic metaphor of the bug that maliciously sneaked in while
the programmer was not looking is intellectually dishonest as it
disguises that the error is the programmer's own creation."
	-- E. W. Dijkstra, EWD1036
