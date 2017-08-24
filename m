From: James Morris <jmorris@namei.org>
Subject: Re: [PATCH] apparmor: fix build failure on sparc caused by undeclared,
 signals
Date: Thu, 24 Aug 2017 11:16:38 +1000 (AEST)
Message-ID: <alpine.LRH.2.20.1708241116190.26611@namei.org>
References: <20170823211213.0b014b1e@canb.auug.org.au> <40445189-181f-fc19-3c44-8fa2ab23d2f9@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from namei.org ([65.99.196.166]:47902 "EHLO namei.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750715AbdHXBQq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 23 Aug 2017 21:16:46 -0400
In-Reply-To: <40445189-181f-fc19-3c44-8fa2ab23d2f9@canonical.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: John Johansen <john.johansen@canonical.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, 23 Aug 2017, John Johansen wrote:

> 
>   In file included from security/apparmor/ipc.c:23:0:
>   security/apparmor/include/sig_names.h:26:3: error: 'SIGSTKFLT' undeclared here (not in a function)
>     [SIGSTKFLT] = 16, /* -, 16, - */
>      ^
>   security/apparmor/include/sig_names.h:26:3: error: array index in initializer not of integer type
>   security/apparmor/include/sig_names.h:26:3: note: (near initialization for 'sig_map')
>   security/apparmor/include/sig_names.h:51:3: error: 'SIGUNUSED' undeclared here (not in a function)
>     [SIGUNUSED] = 34, /* -, 31, - */
>      ^
>   security/apparmor/include/sig_names.h:51:3: error: array index in initializer not of integer type
>   security/apparmor/include/sig_names.h:51:3: note: (near initialization for 'sig_map')
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Fixes: c6bf1adaecaa ("apparmor: add the ability to mediate signals")
> Signed-off-by: John Johansen <john.johansen@canonical.com>
> ---
>  security/apparmor/include/sig_names.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied to
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security.git next


-- 
James Morris
<jmorris@namei.org>
