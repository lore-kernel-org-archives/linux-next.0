From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: linux-next: manual merge of pcmcia tree
Date: Fri, 20 Jun 2008 19:43:21 +0200
Message-ID: <20080620174321.GA22861@comet.dominikbrodowski.net>
References: <20080616175126.e461b22b.sfr@canb.auug.org.au> <20080616081258.GA18142@isilmar.linta.de> <20080619143441.3ab03fcf@bike.lwn.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from isilmar.linta.de ([213.133.102.198]:43072 "EHLO linta.de"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752705AbYFTRng (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 20 Jun 2008 13:43:36 -0400
Content-Disposition: inline
In-Reply-To: <20080619143441.3ab03fcf@bike.lwn.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

Hi,

On Thu, Jun 19, 2008 at 02:34:41PM -0600, Jonathan Corbet wrote:
> [Finally beginning to catch up with life...]

... somehow I know too well how that is ;)

> On Mon, 16 Jun 2008 10:12:58 +0200
> Dominik Brodowski <linux@dominikbrodowski.net> wrote:
> 
> > @Alan,@Jonathan: since this is the same patch, just a different title
> > -- shall it be removed from one of our trees?
> 
> If you want to have it
> in your tree, that's fine with me; the only dependency is that it needs
> to be applied *before* the removal of BKL protection to cdev open()
> functions or there will be a range of commits over which things are
> potentially unsafe - not that I think it would burn even a single
> tester.

Well, when do you intend to push that patch? I hope Linus will apply the
pcmcia tree soon after 2.6.26 is released.

> Here's the patch; if you take it let me know and I'll remove it from
> the bkl-removal tree.

I've applied it to pcmcia-2.6.git and just pushed that to kernel.org.

Thanks,
	Dominik
