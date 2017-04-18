From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: linux-next: manual merge of the mux tree with the i2c tree
Date: Tue, 18 Apr 2017 10:54:04 +0200
Message-ID: <20170418085404.GA5578@kroah.com>
References: <20170418155958.73116b94@canb.auug.org.au>
 <ca40279d-4b8c-b139-4d52-77ff67c5eb70@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ca40279d-4b8c-b139-4d52-77ff67c5eb70@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: Wolfram Sang <wsa@the-dreams.de>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michael Hennerich <michael.hennerich@analog.com>, Philipp Zabel <p.zabel@pengutronix.de>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 18, 2017 at 08:52:16AM +0200, Peter Rosin wrote:
> On 2017-04-18 07:59, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the mux tree got conflicts in:
> > 
> >   drivers/i2c/muxes/Makefile
> >   drivers/i2c/muxes/Kconfig
> > 
> > between commit:
> > 
> >   dbed8a803bd3 ("i2c: mux: ltc4306: LTC4306 and LTC4305 I2C multiplexer/switch")
> > 
> > from the i2c tree and commit:
> > 
> >   69c689cbeefa ("i2c: i2c-mux-gpmux: new driver")
> > 
> > from the mux tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> 
> This is trivial IMHO, and I see no need to juggle with immutable branches
> etc. Or maybe the whole thing is moot since it is getting late for the mux
> series anyway, but the only one who can answer that is Greg.
> 
> So Greg, any news on the timeline for the mux series? BTW, other people are
> starting to take an interest, see
> 
>   http://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1377069.html
> 
> They apparently need to mux video with either gpio pins or a syscon/mmio
> register and the new mux subsystem abstracts this nicely for them.

I've now provided some review comments on what I had questions/comments
on.  So I can't take the current series.

> Also Greg, if it indeed is too late for the mux series to hit 4.12, should
> I then remove it from linux-next? And then simply wait for it to hit -next
> when you take it? I only had it added to -next in the first place since I
> was deluded and thought you would pull it from my mux repo, and wanted early
> feedback from autobuilders etc before making the pull request. But as it
> turned out, you wanted raw patches...

I want patches that are reviewed and correct, this isn't an issue of me
taking a pull request or not.  I wanted to review the code, so you need
patches for that.

> However, I'm reluctant to take it out of -next, since that may cause
> trouble for the above new users?

As I doubt this is going to make 4.12, I don't know how you are having
dependant users without them also being in your tree.  It's not wise of
those developers to put them in a different tree.

thanks,

greg k-h
