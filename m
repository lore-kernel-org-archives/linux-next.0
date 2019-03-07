From: Darren Hart <dvhart@infradead.org>
Subject: Re: linux-next: manual merge of the drivers-x86 tree with the
 watchdog tree
Date: Wed, 6 Mar 2019 21:42:09 -0800
Message-ID: <20190307054209.GD44339@wrath>
References: <20190304143735.308edd1e@canb.auug.org.au>
 <20190307052701.GC44339@wrath>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190307052701.GC44339@wrath>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Wim Van Sebroeck <wim@iguana.be>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michael Shych <michaelsh@mellanox.com>, Vadim Pasternak <vadimp@mellanox.com>
List-Id: linux-next.vger.kernel.org

On Wed, Mar 06, 2019 at 09:27:01PM -0800, Darren Hart wrote:
> On Mon, Mar 04, 2019 at 02:37:35PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the drivers-x86 tree got a conflict in:
> > 
> >   include/linux/platform_data/mlxreg.h
> > 
> > between commit:
> > 
> >   9f03161a1bd8 ("platform_data/mlxreg: additions for Mellanox watchdog driver.")
> > 
> > from the watchdog tree and commit:
> > 
> >   9b28aa1d0eae ("platform_data/mlxreg: Document fixes for core platform data")
> > 
> > from the drivers-x86 tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> 
> Thanks Stephen.
> 
> I suspect this will be a rare occurence. That said - Vadim - could you please
> ensure that all the mellanox driver changes Cc the platform driver x86 mailing
> list by adding it to MAINTAINERS?

And, turns out, not so rare. We've been down this road before. I'll just prepare
the patch for the MAINTAINERS.

-- 
Darren Hart
VMware Open Source Technology Center
