From: Leon Romanovsky <leon@kernel.org>
Subject: Re: linux-next: manual merge of the rdma tree with Linus' tree
Date: Fri, 14 Jul 2017 07:54:17 +0300
Message-ID: <20170714045417.GU1528@mtr-leonro.local>
References: <20170714111437.69a6b100@canb.auug.org.au>
 <1499995033.2936.12.camel@redhat.com>
 <20170714033416.GS1528@mtr-leonro.local>
 <1500005553.2936.14.camel@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="85DVAmvoahDzaF7X"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:47516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750752AbdGNEyW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 14 Jul 2017 00:54:22 -0400
Content-Disposition: inline
In-Reply-To: <1500005553.2936.14.camel@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Ledford <dledford@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Jurgens <danielj@mellanox.com>, Paul Moore <paul@paul-moore.com>, Parav Pandit <parav@mellanox.com>, Eli Cohen <eli@mellanox.com>


--85DVAmvoahDzaF7X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 14, 2017 at 12:12:33AM -0400, Doug Ledford wrote:
> On Fri, 2017-07-14 at 06:34 +0300, Leon Romanovsky wrote:
> > On Thu, Jul 13, 2017 at 09:17:13PM -0400, Doug Ledford wrote:
> > > On Fri, 2017-07-14 at 11:14 +1000, Stephen Rothwell wrote:
> > > > Hi Doug,
> > > >
> > > > Today's linux-next merge of the rdma tree got conflicts in:
> > > >
> > > >   drivers/infiniband/core/uverbs_cmd.c
> > > >   drivers/infiniband/core/verbs.c
> > > >
> > > > between commit:
> > > >
> > > >   d291f1a65232 ("IB/core: Enforce PKey security on QPs")
> > > >
> > > > from Linus' tree and commits:
> > > >
> > > >   c7c0fb974caa ("IB/core: Introduce modify QP operation with
> > > > udata")
> > > >   5f4bc420f35f ("IB/uverbs: Make use of ib_modify_qp variant to
> > > > avoid
> > > > resolving DMAC")
> > > >
> > > > from the rdma tree.
> > > >
> > > > I fixed it up (I used the latter version of uverbs_cmd.c and see
> > > > below)
> > > > and can carry the fix as necessary. This is now fixed as far as
> > > > linux-next
> > > > is concerned, but any non trivial conflicts should be mentioned
> > > > to
> > > > your
> > > > upstream maintainer when your tree is submitted for merging.  You
> > > > may
> > > > also want to consider cooperating with the maintainer of the
> > > > conflicting
> > > > tree to minimise any particularly complex conflicts.
> > >
> > > This was expected.  The SELinux changes went through the SELinux
> > > tree
> > > and the referenced patches touch the same code.  Your fix is
> > > correct.
> >
> > Sorry Doug, but it is not expected at all for the code which will go
> > to 4.14.
>
> Who said anything about 4.14?  The merge window is not closed, and a
> current for-next tag need not represent code intended for 4.14.  That
> switchover doesn't happen until the merge window closes (and for many
> trees, a couple rc cycles past the merge window closing).

Really, "couple"?
Your tree contains enormous amount of code, you was listed as one of top-pusher,
and you still behave like your tree has one or two patches in the cycle.

All major trees with similar volume of patches are doing incremental
development and not "one-time" shots.

>
> > Both patches in question were targeted for 4.13 and you was expected
> > to
> > see the merge conflicts during last month or so, prior to merge
> > window of 4.13.
> >
> > In 4.14, you should base your tree on Linus's tree and don't have ANY
> > conflicts in your subsystem, between ANY subsystems and especially
> > Linus, so we will be able to develop and test.
>
> I'm sure for 4.14 that will be the issue.  I didn't put this tag on my
> 4.14 intended work.  I considered this patch series suitable as
> possible -rc fixes, so it is under a for-next tag for now to get the
> for-next testing (which is not much different than a local merge test
> right now, what it does in addition to a local merge test is catch the
> situation where some other pending patches and this conflict).

I don't get it, linux-next is much more than simple merge test. The overall
goal of linux-next is to allow other people to test it BEFORE it hits Linus.

We want to run our verification on it and catch bugs BETWEEN subsystems
(RoCE, iWARP and IPoIB for netdev vs. rdma) in advance and not after.

>
> > For me, this merge conflict puts a large sign, that your tree is not
> > ready for 4.14.
> >
> > Please base your tree on Linus's tree.
>
> Two things here.  First, no one, and I mean *NO ONE*, bases their for-
> next branch on a middle of the merge window version of Linus' tree.
> Second, I would be happy to base my work on a suitable base kernel
> version from Linus' tree from now on (such as -rc2).  Please do *NOT*
> send me another patch set that requires I sync up from net-next in
> order to make things work, because, as you say, I should sync up to
> Linus' tree.

Really? Are you comparing base point of 4.14 development with your stalled
for weeks branches?

Start to work incrementally, update your branches constantly and such
requests will disappear, so we will be able to plan and not to guess.

I respect your hard work and what you are doing, but struggling to understand
why don't you want to make it more effective and less error prone.

Thanks

>
> --
> Doug Ledford <dledford@redhat.com>
>     GPG KeyID: B826A3330E572FDD
>     Key fingerprint = AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FDD
>

--85DVAmvoahDzaF7X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEkhr/r4Op1/04yqaB5GN7iDZyWKcFAlloTnkACgkQ5GN7iDZy
WKcKTBAAr23SKH0zh9NpKVNRA5oV9XpMk/ABmMaOAaizpc8WGuMBeq3oHY5haVxq
r9wmt3PAYkOwTjbE4jt+PhhfkGU7y0v1SvlKPTK0YgYn7QZoGqZGWv9VPbXSzwfu
eV3vBismd8UjgCyN3omQxqH17XCIMyXtGfbHS6+6DN30NSYFTQ98BNtw8tV0uQ8i
i6Axvo7S/FEG0wzOg0gQB4zoPdAqMceomcrQ2l2ilGdQyzTq6fQ/5n+VHweG/ArJ
jP0z8pdK6Fc/+xsP5EIFCshqF6ACk9V8j7J+aclpBZUSbEBBSWs7AP7+M32Kw6Kw
Tz1EmH5xTaHFq2wDKC7woaqtr5FMCaVLlNA59YQnx7wOVX4fKhn1NmqhAFf0s7v7
0Y0PQcegjgS/a1Wl9V/dkX+pqh6CmGfGec5kMNoB5E8YMv0oXNpXuxaVomcuI/l2
mM2yrgFXV1H8wgq5pcvofyuW7bM7KQ2cQutV0Kj+Mm/lBJXdF/wC9mErMRjqthtX
4mzFOymQvXx7OOaB/vB1HxLwg0wCQtGpmU3ZHE2cXdxDoNHQ9iqiujfMwVe1d/sz
dVGKeNXNyKgXJHVPcAFejWnZEB4uRvng81pzKS3Fo+9mToHWnyHvTSwCy9zru1uM
iKyMsYsHjtu4vDM5uMEV25uk5pOsXaCII+YaLBPfhR3eisx93Ew=
=NK6E
-----END PGP SIGNATURE-----

--85DVAmvoahDzaF7X--
