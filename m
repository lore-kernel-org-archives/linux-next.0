From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the tty tree
Date: Tue, 7 Feb 2017 22:18:40 +1100
Message-ID: <20170207221840.29af3b84@canb.auug.org.au>
References: <20170206151638.6e0f8a60@canb.auug.org.au>
        <20170206085042.GA3726@kroah.com>
        <CAO3366y+pGVY78BDtgkeqDenKqfnhdpxaRRFPUjnw2bwoMGYnQ@mail.gmail.com>
        <20170207093709.0287cb68@canb.auug.org.au>
        <20170207083731.GA20338@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52933 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753285AbdBGLSq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 7 Feb 2017 06:18:46 -0500
In-Reply-To: <20170207083731.GA20338@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>

Hi Greg,

On Tue, 7 Feb 2017 09:37:31 +0100 Greg KH <greg@kroah.com> wrote:
>
> On Tue, Feb 07, 2017 at 09:37:09AM +1100, Stephen Rothwell wrote:
> > 
> > I don't see that commit in any tree I have fetched.  
> 
> That is correct, it's in my "testing" branch that I use to stage things
> in before it gets sent to the branch that you pull from.

What an amusing idea ;-)

> That branch is now merged with my -next branch, so you will see this
> change the next time you sync.

Thanks.

-- 
Cheers,
Stephen Rothwell
