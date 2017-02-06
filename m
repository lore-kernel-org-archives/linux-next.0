From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the tty tree
Date: Tue, 7 Feb 2017 09:37:09 +1100
Message-ID: <20170207093709.0287cb68@canb.auug.org.au>
References: <20170206151638.6e0f8a60@canb.auug.org.au>
        <20170206085042.GA3726@kroah.com>
        <CAO3366y+pGVY78BDtgkeqDenKqfnhdpxaRRFPUjnw2bwoMGYnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40027 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751372AbdBFWhM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Feb 2017 17:37:12 -0500
In-Reply-To: <CAO3366y+pGVY78BDtgkeqDenKqfnhdpxaRRFPUjnw2bwoMGYnQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>

Hi all,

On Mon, 6 Feb 2017 18:01:20 +0100 Ulrich Hecht <ulrich.hecht+renesas@gmail.com> wrote:
>
> On Mon, Feb 6, 2017 at 9:50 AM, Greg KH <greg@kroah.com> wrote:
> >
> > I think this is fixed by a patch I just took into my tree, which isn't
> > in linux-next yet.  Right Ulrich?  
> 
> That is correct, it's called in "[PATCH v4 2/4] serial: sh-sci:
> SCIFA/B RX FIFO software timeout".

I don't see that commit in any tree I have fetched.

-- 
Cheers,
Stephen Rothwell
