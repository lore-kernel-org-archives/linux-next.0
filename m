From: Greg KH <greg@kroah.com>
Subject: Re: Can you add the staging tree to -next?
Date: Fri, 14 Nov 2008 15:06:37 -0800
Message-ID: <20081114230637.GA1415@kroah.com>
References: <20081112235600.GA27554@kroah.com> <Pine.LNX.4.64.0811140825410.11953@anakin> <20081114173258.GC22980@kroah.com> <3aaafc130811141428ta97f929va8c62cbcdbc731f7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:54523 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751664AbYKNXPK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 14 Nov 2008 18:15:10 -0500
Content-Disposition: inline
In-Reply-To: <3aaafc130811141428ta97f929va8c62cbcdbc731f7@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "J.R. Mauro" <jrm8005@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Nov 14, 2008 at 05:28:17PM -0500, J.R. Mauro wrote:
> There also seem to be a lot of build errors that no one hacking on
> staging has seen before being threshed out by all the randconfig tests
> done on -next, which will help a lot if we want the staging drivers to
> actually go anywhere.

In looking at these in some detail, the majority of them are due to api
changes in other trees, so these changes will have to be done during the
-rc1 merge window, which shouldn't be that big of an issue.

But yes, there are some kconfig dependancies as well, Randy is really
good at finding them :)  If you want to send me patches to fix these,
I'd appreciate it.

thanks,

greg k-h
