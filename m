From: Leon Romanovsky <leon@kernel.org>
Subject: Re: linux-next: manual merge of the rdma tree with Linus' tree
Date: Fri, 14 Jul 2017 16:46:20 +0300
Message-ID: <20170714134620.GZ1528@mtr-leonro.local>
References: <20170714111437.69a6b100@canb.auug.org.au>
 <1499995033.2936.12.camel@redhat.com>
 <20170714033416.GS1528@mtr-leonro.local>
 <20170714135018.5c849c1c@canb.auug.org.au>
 <20170714045546.GV1528@mtr-leonro.local>
 <1500033829.2936.16.camel@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="QPGglBHe0A9IObYa"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1500033829.2936.16.camel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Jurgens <danielj@mellanox.com>, Paul Moore <paul@paul-moore.com>, Parav Pandit <parav@mellanox.com>, Eli Cohen <eli@mellanox.com>
List-Id: linux-next.vger.kernel.org


--QPGglBHe0A9IObYa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 14, 2017 at 08:03:49AM -0400, Doug Ledford wrote:
> On Fri, 2017-07-14 at 07:55 +0300, Leon Romanovsky wrote:
> > On Fri, Jul 14, 2017 at 01:50:26PM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > On Fri, 14 Jul 2017 06:34:16 +0300 Leon Romanovsky <leon@kernel.org
> > > > wrote:
> > > >
> > > > Sorry Doug, but it is not expected at all for the code which will
> > > > go to 4.14.
> > > >
> > > > Both patches in question were targeted for 4.13 and you was
> > > > expected to
> > > > see the merge conflicts during last month or so, prior to merge
> > > > window of 4.13.
> > > >
> > > > In 4.14, you should base your tree on Linus's tree and don't have
> > > > ANY
> > > > conflicts in your subsystem, between ANY subsystems and
> > > > especially
> > > > Linus, so we will be able to develop and test.
> > > >
> > > > For me, this merge conflict puts a large sign, that your tree is
> > > > not ready for 4.14.
> > > >
> > > > Please base your tree on Linus's tree.
> > >
> > > And if these commits are destined for v4.14, then they should not
> > > have
> > > been in linux-next yet.
> >
> > See, this announcement,
> > http://marc.info/?l=linux-rdma&m=149980130008834&w=2
>
> Yes, and the patch in question is one of the many that I pulled out as
> fixes that I would end up submitting during the -rc cycle.  Hence why I
> put the for-next tag on it.

OK, hope that the picture with your branches will be clear very soon.
Till when we can't create shared code.

Thanks

>
> --
> Doug Ledford <dledford@redhat.com>
>     GPG KeyID: B826A3330E572FDD
>     Key fingerprint = AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FDD
>

--QPGglBHe0A9IObYa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEkhr/r4Op1/04yqaB5GN7iDZyWKcFAlloyysACgkQ5GN7iDZy
WKeIvA//UJsUZj5Zt0s7+T4TUkpGWX+PVlYU4cNB6899A+lMarL+boQ6w6Ni2ps/
X2d3+ON50OCvbaRZkoim9Qu/5NAlL3l+aAzyOm+pt4RXzK2tz5pZ4zWgAw5yJAXD
kz3ZzmXtS5cyGow4tmHC52weCZg+BqR3jhxgfl3VWbOL4A6OOzFTgmLoS9pfwa+Y
ZfB44XcvkGgGlOTFjX7tR+6cEMD8genlsJbOAz4hng3j0A/0niAkTJapMThFX8Aa
+pyF5beLBCzblgYZ7xa8MsAJpgwvlvqe2RcjTdL+l6IH7n8IDVzJ83iyjWfIrxSX
PonOrt3QfLgPKN6UJ1MlBikMbcU7CoOZMFJBf00OgRtDW3hrL1F7wYM88yrJkZsc
9urRxA4hRaa4mLaJyzI3ItQf3u5yexbFBjOX4TbXEKAhM1uQXSzyQqBygZg+5aAN
IboSvm7DNWNBaSiDd8bgylL+Ewa7JbqyyPCj8A3I+ns/8nUTpb5SVMT5/wstrAxv
+dlmumWDWqTPO7WQahSFI3s1hXnY2kpopZVN0XM4NPR1cpNNac8jhHkS5cBAhnMO
RxVKLq6rctDfVanYMRo2jy2QrqKEqwHOrM4p4iiWd8ATnEryreevYaW/DjGiYWKS
CktVaQfp4B4yIqRmXU7dOJHFM6s/S9wg4Z+8gKlBrGG9KY7Y1cY=
=SwXf
-----END PGP SIGNATURE-----

--QPGglBHe0A9IObYa--
