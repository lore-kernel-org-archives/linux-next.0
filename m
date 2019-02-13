From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: linux-next: build failure after merge of the xarray tree
Date: Wed, 13 Feb 2019 22:09:36 +0000
Message-ID: <20190213220929.GO24706@mellanox.com>
References: <20190212162003.1aa1ffbd@canb.auug.org.au>
 <20190212161528.GN12668@bombadil.infradead.org>
 <20190212162324.GU24706@mellanox.com>
 <20190213212621.GW12668@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190213212621.GW12668@bombadil.infradead.org>
Content-Language: en-US
Content-ID: <8529BD425F11A841A0C9B902E24867A5@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Wilcox <willy@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Doug Ledford <dledford@redhat.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Feb 13, 2019 at 01:26:23PM -0800, Matthew Wilcox wrote:
> On Tue, Feb 12, 2019 at 04:23:31PM +0000, Jason Gunthorpe wrote:
> > On Tue, Feb 12, 2019 at 08:15:28AM -0800, Matthew Wilcox wrote:
> > > Seriously, there are several defects in the published API which do
> > > warrant a change.  The most severe one is that it's really easy to
> > > forget to initialise the start index.  And while I'm making that chan=
ge,
> > > I should fix smaller things like the errno at the same time.
> >=20
> > I hope you will send your tree in the 2nd week of the merge window
> > with all these merge fixes in it..
> >=20
> > I think Linus will not like it if he has to fix this when merging
> > rdma.
>=20
> Ahhahhahhah.  No.  Burned once.  Not doing that again.

I'm not suggesting you should do that - basing on the nvdimm tree to
avoid conflicts was a terrible idea.

There are two sane approaches you can do here:

1) Base on -rcX and Merge to Linus's tree and resolve all conflicts
   before sending the PR. The PR should ideally go in the second week
   as it is a tree wide API change.

   You can read Linus's comments on handling complex merge resolutions
   in PRs here:
    https://lore.kernel.org/lkml/CA+55aFzcp=3Da2sNOVR7DTEY9dehYamXaJ1bpSfF0=
FZir_9MhsVg@mail.gmail.com/

2) Rebase on top of Linus's actual tree in the *second* week of the
   merge window and resolve all conflicts in your rebase, then
   send the PR.

In both cases coordinate with conflicting trees to have their PR's
sent in the first week so Linus sees no conflicts.
 =20
This is basically the same advise Linus gave you:

https://lore.kernel.org/lkml/CA+55aFw+dwofadgvzrM-UCMSih+f1choCwW+xFFM3aPjo=
RQX_g@mail.gmail.com/

Linus talks here about the trade off for #1 and #2, with a preference
to #1.

#2 is good for "you just want your series to make more sense on its
own" - which I think is where tree-wide changes tend to end up.

I personally think it is not good to put major logic changes in merge
commits, so I would prefer the #2 approach for this case.

Also, the general philosophy that the person doing the tree-wide
change should do the work :)

> > > @@ -750,7 +738,7 @@ int ib_register_device(struct ib_device *device, =
const char *name)
> > >  	int ret;
> > > =20
> > >  	ret =3D assign_name(device, name);
> > > -	if (ret)
> > > +	if (ret < 0)
> > >  		return ret;
> >=20
> > This <0 should be near the xa_alloc_cyclic, I don't want the unusual
> > '1' to propogate.. Far too likely that someone will forget about
> > the special case.
>=20
> Feel free to propose an alternate fix for sfr to put in his tree and we
> can both include it as a proposed patch in our respective pull requests.

SFR's tree is just a reference. Who ever takes care to resolve these
conflicts has to manually do the fixing up. If you do send your tree
early I will fix it up as part of prepping the RDMA tree PR. Otherwise
you will have to fix it.

What I don't want to see is we send both trees at the same time and
neither gives merge guidance to Linus.

Also, FWIW, there are two more series in the RDMA patchworks adding an
xa_array call.

Regards,
Jason
