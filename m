From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the staging tree
Date: Tue, 19 Sep 2017 08:09:15 +0200
Message-ID: <20170919060915.GA1628@kroah.com>
References: <20170919075455.59a3183b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:45991 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751109AbdISGJE (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 19 Sep 2017 02:09:04 -0400
Content-Disposition: inline
In-Reply-To: <20170919075455.59a3183b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Tobin C. Harding" <me@tobin.cc>

On Tue, Sep 19, 2017 at 07:54:55AM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Commits
> 
>   688a0206cfb8 ("staging: rtlwifi: fix parenthesis alignment")
>   85d309d53f7a ("staging: rtlwifi: use kcalloc instead of multiply")
>   f216f6cdeb1d ("staging: rtlwifi: remove unused functions")
> 
> are missing a Signed-off-by from their author.

Ugh, I totally missed that, Tobin, what went wrong here?

I can't go rewrite my tree, so I'll just accept this as an implicit "ok"
for these patches, any objection?

thanks,

greg k-h
