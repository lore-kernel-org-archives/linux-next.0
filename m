From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Subject: Re: linux-next: build failure after merge of the xen-arm tree
Date: Wed, 29 May 2013 11:57:17 +0100
Message-ID: <alpine.DEB.2.02.1305291156350.4799@kaball.uk.xensource.com>
References: <20130529133459.fb060dcd20cb00049bed55cd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp02.citrix.com ([66.165.176.63]:41601 "EHLO
	SMTP02.CITRIX.COM" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965542Ab3E2K5f (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 May 2013 06:57:35 -0400
In-Reply-To: <20130529133459.fb060dcd20cb00049bed55cd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Stefano Stabellini <stefano.stabellini@eu.citrix.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 29 May 2013, Stephen Rothwell wrote:
> Hi Stefano,
> 
> After merging the xen-arm tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> kernel/sched/cputime.c:8:26: fatal error: asm/paravirt.h: No such file or directory
>  #include <asm/paravirt.h>
>                           ^
> 
> Caused by commit d31d069a9f68 ("kernel: missing include in cputime.c").
> Only three architectures have that file (x86, arm and ia64).
> 
> I have used the xen-arm tree from next-20130528 for today.

Thanks, good point.
I'll fix the issue by adding an ifdef CONFIG_PARAVIRT around it.
