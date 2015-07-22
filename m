From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: error fetching the ipmi tree
Date: Wed, 22 Jul 2015 11:03:31 +1000
Message-ID: <20150722110331.2ed76955@canb.auug.org.au>
References: <20150722082946.39366276@canb.auug.org.au>
	<55AED99D.1060405@mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40176 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S964893AbbGVBDg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Jul 2015 21:03:36 -0400
In-Reply-To: <55AED99D.1060405@mvista.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Corey Minyard <cminyard@mvista.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Corey,

On Tue, 21 Jul 2015 18:45:33 -0500 Corey Minyard <cminyard@mvista.com> wrote:
>
> On 07/21/2015 05:29 PM, Stephen Rothwell wrote:
> >
> > While fetching the ipmi tree
> > (git://git.code.sf.net/p/openipmi/linux-ipmi#for-next), I get this
> > error:
> >
> > fatal: unable to connect to git.code.sf.net:
> > git.code.sf.net[0: 216.34.181.155]: errno=Connection refused
> >
> > I have been getting this for a few days now.  The http and https URLs
> > don't work either (for me in Firefox).
> 
> Looks like sourceforge had a serious outage on the 18th and are still
> working on restoring it. http://sourceforge.net/blog/category/sitestatus/
> 
> Would you like me to move this someplace else?

Its not a real problem as long as you don't have any updates for the
tree before SF restore things.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
