From: Matthew Wilcox <willy@infradead.org>
Subject: Re: linux-next: build failure after merge of the xarray tree
Date: Wed, 13 Feb 2019 13:26:23 -0800
Message-ID: <20190213212621.GW12668@bombadil.infradead.org>
References: <20190212162003.1aa1ffbd@canb.auug.org.au>
 <20190212161528.GN12668@bombadil.infradead.org>
 <20190212162324.GU24706@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190212162324.GU24706@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@mellanox.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Doug Ledford <dledford@redhat.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Feb 12, 2019 at 04:23:31PM +0000, Jason Gunthorpe wrote:
> On Tue, Feb 12, 2019 at 08:15:28AM -0800, Matthew Wilcox wrote:
> > Seriously, there are several defects in the published API which do
> > warrant a change.  The most severe one is that it's really easy to
> > forget to initialise the start index.  And while I'm making that change,
> > I should fix smaller things like the errno at the same time.
> 
> I hope you will send your tree in the 2nd week of the merge window
> with all these merge fixes in it..
> 
> I think Linus will not like it if he has to fix this when merging
> rdma.

Ahhahhahhah.  No.  Burned once.  Not doing that again.

https://lore.kernel.org/lkml/CA+55aFxFjAmrFpwQmEHCthHOzgidCKnod+cNDEE+3Spu9o1s3w@mail.gmail.com/

> > @@ -750,7 +738,7 @@ int ib_register_device(struct ib_device *device, const char *name)
> >  	int ret;
> >  
> >  	ret = assign_name(device, name);
> > -	if (ret)
> > +	if (ret < 0)
> >  		return ret;
> 
> This <0 should be near the xa_alloc_cyclic, I don't want the unusual
> '1' to propogate.. Far too likely that someone will forget about
> the special case.

Feel free to propose an alternate fix for sfr to put in his tree and we
can both include it as a proposed patch in our respective pull requests.
