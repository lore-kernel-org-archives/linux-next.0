From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: comedi: Range_table and range_table_list
Date: Mon, 27 Apr 2009 08:25:57 -0700
Message-ID: <20090427152557.GB23851@kroah.com>
References: <87skjvf5o8.fsf@free.fr> <20090427023822.GA7060@kroah.com> <72cf3fb0904270137s4ac40211i8965ef0110fad7dd@mail.gmail.com> <20090427195620.41376d41.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:36798 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756241AbZD0Pbu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Apr 2009 11:31:50 -0400
Content-Disposition: inline
In-Reply-To: <20090427195620.41376d41.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alexis Berlemont <alexis.berlemont@gmail.com>, linux-next@vger.kernel.org

On Mon, Apr 27, 2009 at 07:56:20PM +1000, Stephen Rothwell wrote:
> Also, are we going to have problems if the original developers of things
> in the staging tree are unwilling to take updates back into their trees?
> Or is this just a procedural thing i.e. do they only want things fed back
> after they have been in the staging tree?  Will this change if their work
> ends up in the kernel proper?

The upstream comedi tree should now be "dead" as everything is now fed
into mainline and linux-next through staging.  So everything should be
good.

thanks,

greg k-h
