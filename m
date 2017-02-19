From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: error fetching the ipmi tree
Date: Mon, 20 Feb 2017 08:00:19 +1100
Message-ID: <20170220080019.7972746b@canb.auug.org.au>
References: <20150722082946.39366276@canb.auug.org.au>
        <55AED99D.1060405@mvista.com>
        <20150722110331.2ed76955@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150722110331.2ed76955@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Corey Minyard <cminyard@mvista.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Corey,

On Wed, 22 Jul 2015 11:03:31 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> On Tue, 21 Jul 2015 18:45:33 -0500 Corey Minyard <cminyard@mvista.com> wrote:
> >
> > On 07/21/2015 05:29 PM, Stephen Rothwell wrote:  
> > >
> > > While fetching the ipmi tree
> > > (git://git.code.sf.net/p/openipmi/linux-ipmi#for-next), I get this
> > > error:
> > >
> > > fatal: unable to connect to git.code.sf.net:
> > > git.code.sf.net[0: 216.34.181.155]: errno=Connection refused
> > >
> > > I have been getting this for a few days now.  The http and https URLs
> > > don't work either (for me in Firefox).  
> > 
> > Looks like sourceforge had a serious outage on the 18th and are still
> > working on restoring it. http://sourceforge.net/blog/category/sitestatus/
> > 
> > Would you like me to move this someplace else?  
> 
> Its not a real problem as long as you don't have any updates for the
> tree before SF restore things.

OK, it looks like SourceForge is out again:

$ git fetch ipmi
fatal: unable to connect to git.code.sf.net:
git.code.sf.net[0: 216.34.181.155]: errno=Connection refused

It might be worth considering moving to git.kernel.org if possible and
not too much effort.

-- 
Cheers,
Stephen Rothwell
