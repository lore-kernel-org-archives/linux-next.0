From: James Morris <jmorris@namei.org>
Subject: Re: linux-next: build failure after merge of the kspp tree
Date: Tue, 27 Jun 2017 13:33:36 +1000 (AEST)
Message-ID: <alpine.LRH.2.20.1706271333010.11229@namei.org>
References: <20170620145655.4b7f3efb@canb.auug.org.au> <fbcb7bd9-ca6e-eab1-350e-974c9df2875a@canonical.com> <CAGXu5jLneuMbmEOvYNKU1Q0wwe55uV7hCzQ+jCGFQ35_Zd=eeA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from namei.org ([65.99.196.166]:40944 "EHLO namei.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751445AbdF0Ddr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Jun 2017 23:33:47 -0400
In-Reply-To: <CAGXu5jLneuMbmEOvYNKU1Q0wwe55uV7hCzQ+jCGFQ35_Zd=eeA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@google.com>
Cc: John Johansen <john.johansen@canonical.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, 26 Jun 2017, Kees Cook wrote:

> >> Fixes: 8014370f1257 ("apparmor: move path_link mediation to using labels")
> >> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Acked-by: John Johansen <john.johansen@canonical.com>
> 
> Hi James,
> 
> Just a ping; this needs to get into -next to avoid build errors.

Surely Linus will resolve this when he pulls the trees in?


-- 
James Morris
<jmorris@namei.org>
