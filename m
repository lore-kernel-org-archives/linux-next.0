From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the tty tree
Date: Mon, 6 Feb 2017 16:18:22 +0100
Message-ID: <20170206151822.GA13626@kroah.com>
References: <20170206152209.0819e332@canb.auug.org.au>
 <20170206085105.GB3726@kroah.com>
 <CAL_JsqJnzCNtg19jKekzQyMO6fuqt3b1JU-ps=5MJByKGC1xLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJnzCNtg19jKekzQyMO6fuqt3b1JU-ps=5MJByKGC1xLg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sebastian Reichel <sre@kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Feb 06, 2017 at 08:09:16AM -0600, Rob Herring wrote:
> On Mon, Feb 6, 2017 at 2:51 AM, Greg KH <greg@kroah.com> wrote:
> > On Mon, Feb 06, 2017 at 03:22:09PM +1100, Stephen Rothwell wrote:
> >> Hi Greg,
> >>
> >> After merging the tty tree, today's linux-next build (x86_64 allmodconfig)
> >> failed like this:
> >>
> >> ERROR: "of_device_uevent_modalias" [drivers/tty/serdev/serdev.ko] undefined!
> >> ERROR: "of_device_get_modalias" [drivers/tty/serdev/serdev.ko] undefined!
> >>
> >> Caused by commit
> >>
> >>   cd6484e1830b ("serdev: Introduce new bus for serial attached devices")
> >>
> >> I have used the tty tree from next-20170203 for today.
> >
> > Ugh, how has this been passing the 0-day bot builds succesfully?
> >
> > Rob, any ideas?
> 
> It didn't, but we happened to already have a fix queued up for 4.11.
> The fix is in your usb-next branch:
> 
> commit 7a3b7cd332db08546f3cdd984f11773e0d1999e7
> Author: Stephen Boyd <stephen.boyd@linaro.org>
> Date:   Wed Dec 28 14:56:48 2016 -0800
> 
>     of: device: Export of_device_{get_modalias, uvent_modalias} to modules
> 
>     The ULPI bus can be built as a module, and it will soon be
>     calling these functions when it supports probing devices from DT.
>     Export them so they can be used by the ULPI module.
> 
>     Acked-by: Rob Herring <robh@kernel.org>
>     Cc: <devicetree@vger.kernel.org>
>     Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
>     Signed-off-by: Peter Chen <peter.chen@nxp.com>

Ah, so the if this is pulled into linux-next at the same time, then
there's no build error.

Stephen, do you need/want me to cherry-pick this into the tty branch, or
is it ok as-is?

thanks,

greg k-h
