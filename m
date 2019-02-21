From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: linux-next: build failure after merge of the xarray tree
Date: Thu, 21 Feb 2019 17:40:08 +0000
Message-ID: <20190221174000.GG17515@mellanox.com>
References: <20190212162003.1aa1ffbd@canb.auug.org.au>
 <20190212161528.GN12668@bombadil.infradead.org>
 <20190212162324.GU24706@mellanox.com>
 <20190213212621.GW12668@bombadil.infradead.org>
 <20190213220929.GO24706@mellanox.com>
 <20190221234716.2144eba3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190221234716.2144eba3@canb.auug.org.au>
Content-Language: en-US
Content-ID: <E0E23B6138D82145A628566764491D93@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Matthew Wilcox <willy@infradead.org>, Doug Ledford <dledford@redhat.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Feb 21, 2019 at 11:47:16PM +1100, Stephen Rothwell wrote:
> Hi Jason,
>=20
> On Wed, 13 Feb 2019 22:09:36 +0000 Jason Gunthorpe <jgg@mellanox.com> wro=
te:
> >
> > I personally think it is not good to put major logic changes in merge
> > commits, so I would prefer the #2 approach for this case.
>=20
> These are not difficult merge fixes or logic changes.

That comment was directed at Matt's correct suggestion to use
alloc_cyclic, this same suggestion applies to this conflict as well.

The mechanical change of the args is not so bad for a merge commit.

> > SFR's tree is just a reference. Who ever takes care to resolve these
> > conflicts has to manually do the fixing up. If you do send your tree
> > early I will fix it up as part of prepping the RDMA tree PR. Otherwise
> > you will have to fix it.
>=20
> Neither of you need to fix it ...

Not quite, I always re-do and verify all your merge resolutions and
send them to Linus as both a raw diff and as an actual merge commit
for him to reference. This way these things are checked in multiple
ways.

It is difficult to run this flow if we don't have an agreed order of
trees, as producing the resolutions for an unmerged tree is not so
straight forward.

Jason
