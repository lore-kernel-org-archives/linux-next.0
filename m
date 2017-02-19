From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: error fetching the ipmi tree
Date: Mon, 20 Feb 2017 10:33:01 +1100
Message-ID: <20170220103301.24f1ac6c@canb.auug.org.au>
References: <20150722082946.39366276@canb.auug.org.au>
        <55AED99D.1060405@mvista.com>
        <20150722110331.2ed76955@canb.auug.org.au>
        <20170220080019.7972746b@canb.auug.org.au>
        <1d5ff522-7a88-ff61-bc0c-fff28d6882ae@acm.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51425 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751470AbdBSXdF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 19 Feb 2017 18:33:05 -0500
In-Reply-To: <1d5ff522-7a88-ff61-bc0c-fff28d6882ae@acm.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Corey Minyard <minyard@acm.org>
Cc: Corey Minyard <cminyard@mvista.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Corey,

On Sun, 19 Feb 2017 16:26:18 -0600 Corey Minyard <minyard@acm.org> wrote:
>
> Dang, I was hoping SourceForge had cleaned up their act.  I can ask for 
> an account on
> kernel.org, but I'm not sure I will be able to get one.

Yeah, you need a well signed GPG key ...

> I'm in the process of moving userland things I support to github, which 
> seems more
> stable than SourceForge.  Would that be better?

Probably better than SourceForge :-)  Keep in mind that Linus requires
signed tags for pulls from basically anywhere besides kernel.org.

-- 
Cheers,
Stephen Rothwell
