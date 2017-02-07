From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build warning after merge of the tty tree
Date: Tue, 7 Feb 2017 09:37:31 +0100
Message-ID: <20170207083731.GA20338@kroah.com>
References: <20170206151638.6e0f8a60@canb.auug.org.au>
 <20170206085042.GA3726@kroah.com>
 <CAO3366y+pGVY78BDtgkeqDenKqfnhdpxaRRFPUjnw2bwoMGYnQ@mail.gmail.com>
 <20170207093709.0287cb68@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170207093709.0287cb68@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-next.vger.kernel.org

On Tue, Feb 07, 2017 at 09:37:09AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 6 Feb 2017 18:01:20 +0100 Ulrich Hecht <ulrich.hecht+renesas@gmail.com> wrote:
> >
> > On Mon, Feb 6, 2017 at 9:50 AM, Greg KH <greg@kroah.com> wrote:
> > >
> > > I think this is fixed by a patch I just took into my tree, which isn't
> > > in linux-next yet.  Right Ulrich?  
> > 
> > That is correct, it's called in "[PATCH v4 2/4] serial: sh-sci:
> > SCIFA/B RX FIFO software timeout".
> 
> I don't see that commit in any tree I have fetched.

That is correct, it's in my "testing" branch that I use to stage things
in before it gets sent to the branch that you pull from.

That branch is now merged with my -next branch, so you will see this
change the next time you sync.

thanks,

greg k-h
