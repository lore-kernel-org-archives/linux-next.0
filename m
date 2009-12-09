From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with the trivial tree
Date: Wed, 9 Dec 2009 12:28:54 -0800
Message-ID: <20091209202854.GA8222@kroah.com>
References: <20091209162826.a28c6c68.sfr@canb.auug.org.au>
 <alpine.LNX.2.00.0912091536230.3755@pobox.suse.cz>
 <20091210021100.b606b224.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:43985 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757824AbZLIUkL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Dec 2009 15:40:11 -0500
Content-Disposition: inline
In-Reply-To: <20091210021100.b606b224.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jiri Kosina <jkosina@suse.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>

On Thu, Dec 10, 2009 at 02:11:00AM +1100, Stephen Rothwell wrote:
> Hi Jiri,
> 
> On Wed, 9 Dec 2009 15:38:19 +0100 (CET) Jiri Kosina <jkosina@suse.cz> wrote:
> >
> > On Wed, 9 Dec 2009, Stephen Rothwell wrote:
> > 
> > > I just used the tty tree version where they clashed.  Jiri, you might
> > > consider sending that patch to Greg for the tty tree.
> > 
> > the trivial tree pull request has already been sent to Linus a day ago. I 
> > am now waiting whether it will be merged or missed.
> > 
> > In the latter case, I will split the tty hunk out and send to Greg. In the 
> > former case the conflict would have to be solved either by Greg or Linus.
> 
> OK, that's fine, thanks.

Sounds good to me as well.

thanks,

greg k-h
