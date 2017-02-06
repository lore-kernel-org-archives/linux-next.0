From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the tty tree
Date: Tue, 7 Feb 2017 07:38:23 +1100
Message-ID: <20170207073823.638e2e67@canb.auug.org.au>
References: <20170206152209.0819e332@canb.auug.org.au>
        <20170206085105.GB3726@kroah.com>
        <CAL_JsqJnzCNtg19jKekzQyMO6fuqt3b1JU-ps=5MJByKGC1xLg@mail.gmail.com>
        <20170206151822.GA13626@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170206151822.GA13626@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Rob Herring <robh@kernel.org>, linux-next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sebastian Reichel <sre@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Greg,

On Mon, 6 Feb 2017 16:18:22 +0100 Greg KH <greg@kroah.com> wrote:
>
> On Mon, Feb 06, 2017 at 08:09:16AM -0600, Rob Herring wrote:
> > 
> > It didn't, but we happened to already have a fix queued up for 4.11.
> > The fix is in your usb-next branch:
> > 
> > commit 7a3b7cd332db08546f3cdd984f11773e0d1999e7
> > Author: Stephen Boyd <stephen.boyd@linaro.org>
> > Date:   Wed Dec 28 14:56:48 2016 -0800
> > 
> >     of: device: Export of_device_{get_modalias, uvent_modalias} to modules
> > 
> >     The ULPI bus can be built as a module, and it will soon be
> >     calling these functions when it supports probing devices from DT.
> >     Export them so they can be used by the ULPI module.
> > 
> >     Acked-by: Rob Herring <robh@kernel.org>
> >     Cc: <devicetree@vger.kernel.org>
> >     Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
> >     Signed-off-by: Peter Chen <peter.chen@nxp.com>  
> 
> Ah, so the if this is pulled into linux-next at the same time, then
> there's no build error.
> 
> Stephen, do you need/want me to cherry-pick this into the tty branch, or
> is it ok as-is?

I will change things so that I merge the usb tree before the tty tree.
Please remember to tell Linus that they need to be merged in that order.

-- 
Cheers,
Stephen Rothwell
