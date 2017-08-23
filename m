From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] apparmor: fix build failure on sparc caused by
 undeclared, signals
Date: Thu, 24 Aug 2017 09:54:07 +1000
Message-ID: <20170824095407.0825d469@canb.auug.org.au>
References: <20170823211213.0b014b1e@canb.auug.org.au>
        <40445189-181f-fc19-3c44-8fa2ab23d2f9@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55727 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751135AbdHWXyJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 23 Aug 2017 19:54:09 -0400
In-Reply-To: <40445189-181f-fc19-3c44-8fa2ab23d2f9@canonical.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: John Johansen <john.johansen@canonical.com>
Cc: James Morris <jmorris@namei.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi John,

On Wed, 23 Aug 2017 12:21:43 -0700 John Johansen <john.johansen@canonical.com> wrote:
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

I will apply this to linux-next today and will drop it when James picks
it up.

-- 
Cheers,
Stephen Rothwell
