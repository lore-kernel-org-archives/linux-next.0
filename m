From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the drivers-x86 tree
Date: Fri, 26 May 2017 09:34:12 +1000
Message-ID: <20170526093412.3af222e6@canb.auug.org.au>
References: <20170519132317.5dc47b24@canb.auug.org.au>
        <20170519220931.GA24990@fury>
        <CAHp75VcJ0eWgiRnsxqEVJjEtsNWzkH2+vRGuT6NmeHsH8NbyQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58259 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965610AbdEYXeR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 25 May 2017 19:34:17 -0400
In-Reply-To: <CAHp75VcJ0eWgiRnsxqEVJjEtsNWzkH2+vRGuT6NmeHsH8NbyQQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ritesh Raj Sarraf <rrs@debian.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi Andy,

On Mon, 22 May 2017 21:03:06 +0300 Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
> On Sat, May 20, 2017 at 1:09 AM, Darren Hart <dvhart@infradead.org> wrote:
> > On Fri, May 19, 2017 at 01:23:17PM +1000, Stephen Rothwell wrote:  
> >>
> >> After merging the drivers-x86 tree, today's linux-next build (x86_64
> >> allmodconfig) produced this warning:
> >>
> >> drivers/platform/x86/ideapad-laptop.c:438:16: warning: 'touchpad_store' defined but not used [-Wunused-function]
> >>  static ssize_t touchpad_store(struct device *dev,
> >>                 ^
> >>
> >> Introduced by commit
> >>
> >>   7f363145992c ("platform/x86: ideapad-laptop: Switch touchpad attribute to be RO")  
> >
> >
> > Andy, you warned me about this and I had forgotten before I included it in next.
> >
> > Would you like to drop this change, or drop the touchpad_store function?  
> 
> I would go with Arnd's patch if he respins one addressing my comment.

Any progress on this?

-- 
Cheers,
Stephen Rothwell
