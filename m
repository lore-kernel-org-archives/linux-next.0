From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the char-misc tree with Linus' tree
Date: Mon, 29 Jul 2013 15:25:12 -0700
Message-ID: <20130729222512.GA4391@kroah.com>
References: <20130729150129.76a9fab4023ee22c940b7920@canb.auug.org.au>
 <20130729192649.GA9191@kroah.com>
 <CA+i0qc7+Q416voe3sQLd3WUbu2kWRcduw9ayVq9+R+eL4zPEbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:42086 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754553Ab3G2WZO (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Jul 2013 18:25:14 -0400
Content-Disposition: inline
In-Reply-To: <CA+i0qc7+Q416voe3sQLd3WUbu2kWRcduw9ayVq9+R+eL4zPEbA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tomas Winkler <tomasw@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jul 30, 2013 at 01:16:38AM +0300, Tomas Winkler wrote:
> >> (Unrelated white space changes are a pest :-()
> >>
> >> I fixed it up (see below) and can carry the fix as necessary (no action
> >> is required).
> >
> > Thanks, I've merged the char-misc-next branch into 3.11-rc3, so this
> > merge problem should no longer be there.
> 
>  I've preferred the blank line there as these ifs became a bit  dense
> nevertheless thanks for taking care of it.

Ah, sorry about that, feel free to change it back in the next round of
patches you send :)

greg k-h
