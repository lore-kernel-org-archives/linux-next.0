From: Leon Romanovsky <leon@kernel.org>
Subject: Re: linux-next: manual merge of the rdma tree with Linus' tree
Date: Fri, 14 Jul 2017 06:34:16 +0300
Message-ID: <20170714033416.GS1528@mtr-leonro.local>
References: <20170714111437.69a6b100@canb.auug.org.au>
 <1499995033.2936.12.camel@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="76FMtSTO4ih9Ca2q"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1499995033.2936.12.camel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Jurgens <danielj@mellanox.com>, Paul Moore <paul@paul-moore.com>, Parav Pandit <parav@mellanox.com>, Eli Cohen <eli@mellanox.com>
List-Id: linux-next.vger.kernel.org


--76FMtSTO4ih9Ca2q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 13, 2017 at 09:17:13PM -0400, Doug Ledford wrote:
> On Fri, 2017-07-14 at 11:14 +1000, Stephen Rothwell wrote:
> > Hi Doug,
> >
> > Today's linux-next merge of the rdma tree got conflicts in:
> >
> >   drivers/infiniband/core/uverbs_cmd.c
> >   drivers/infiniband/core/verbs.c
> >
> > between commit:
> >
> >   d291f1a65232 ("IB/core: Enforce PKey security on QPs")
> >
> > from Linus' tree and commits:
> >
> >   c7c0fb974caa ("IB/core: Introduce modify QP operation with udata")
> >   5f4bc420f35f ("IB/uverbs: Make use of ib_modify_qp variant to avoid
> > resolving DMAC")
> >
> > from the rdma tree.
> >
> > I fixed it up (I used the latter version of uverbs_cmd.c and see
> > below)
> > and can carry the fix as necessary. This is now fixed as far as
> > linux-next
> > is concerned, but any non trivial conflicts should be mentioned to
> > your
> > upstream maintainer when your tree is submitted for merging.  You may
> > also want to consider cooperating with the maintainer of the
> > conflicting
> > tree to minimise any particularly complex conflicts.
>
> This was expected.  The SELinux changes went through the SELinux tree
> and the referenced patches touch the same code.  Your fix is correct.

Sorry Doug, but it is not expected at all for the code which will go to 4.14.

Both patches in question were targeted for 4.13 and you was expected to
see the merge conflicts during last month or so, prior to merge window of 4.13.

In 4.14, you should base your tree on Linus's tree and don't have ANY
conflicts in your subsystem, between ANY subsystems and especially
Linus, so we will be able to develop and test.

For me, this merge conflict puts a large sign, that your tree is not ready for 4.14.

Please base your tree on Linus's tree.

Thanks

> Thanks.
>
> --
> Doug Ledford <dledford@redhat.com>
>     GPG KeyID: B826A3330E572FDD
>     Key fingerprint = AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FDD
>

--76FMtSTO4ih9Ca2q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEkhr/r4Op1/04yqaB5GN7iDZyWKcFAlloO7gACgkQ5GN7iDZy
WKd8ABAAxriDSSPAdGyF1iIoZy8IyJO83QAsMjHwa1WAAd3n3VHd3fqs/ev/GFan
ljzUKGHuoJjJvjgBWaQowyHqU/poXTC73jkaf0h410O1rStxxk+Bbdq0T5nWBW8/
XaHxpuk9+HrOeO1/Xa+6TIrK2NOwmbpPyzQIEA4m1LdEp6hjlxL2kqhRSfs6LRZg
7J4D8QK0Obo7/YYHnM0N+HmsaCRNvS23Wh/dAFkl/Z/N1TO9coDZbUBTYhg9YMI3
wDGEe91mY4G0tJJmw/wO5TnoqpANeunyNPsVRXztSufZl6qPm6RLr5qgI+jbmqd1
qJkHzPKGMPHzUddjSEFkxdgKNcr6m5DXwho4CAErJMJNhhGNajXz9ANQnzuUBtSd
1W6s6BynvW0AfEFbX/l7jnHmI54vFM0QqLEtRd//BBe6oDp6v07rYF/rdBho4Lkb
DplWNVEGr9GMBCA/bb6SYKZAe6eWW3vwUFQ1LlaaXVggYbka3ESU/bdIetXGk27j
O1MAyqkWaaV+p+Aokhl+3zS78oYT+s5LA81lP8434Jy319Yc1hSYRFDcEG7iZFwY
5K5NAYnsWVZ/btJLQDgUGTi4dnTif4uC8GpgoJDK0P5h+gi1ybyQt8txElOrQAE4
XHXlLG+6LF8A8d9XhztfBc0vmic1A3XomS/m4htcgw/0PcvByEw=
=rfOs
-----END PGP SIGNATURE-----

--76FMtSTO4ih9Ca2q--
