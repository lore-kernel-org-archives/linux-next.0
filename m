From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: mmotm 2018-03-07-16-19 uploaded (UML & memcg)
Date: Thu, 8 Mar 2018 16:06:50 +1100
Message-ID: <20180308160650.6c62683e@canb.auug.org.au>
References: <20180308002016.L3JwBaNZ9%akpm@linux-foundation.org>
        <41ec9eeb-f0bf-e26d-e3ae-4a684c314360@infradead.org>
        <20180307184141.3dff2f6c0f7d415912e50030@linux-foundation.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/7/NY81eOkhTXLaucIb0LHt4"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180307184141.3dff2f6c0f7d415912e50030@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, broonie@kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-next@vger.kernel.org, mhocko@suse.cz, Shakeel Butt <shakeelb@google.com>
List-Id: linux-next.vger.kernel.org

--Sig_/7/NY81eOkhTXLaucIb0LHt4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Wed, 7 Mar 2018 18:41:41 -0800 Andrew Morton <akpm@linux-foundation.org>=
 wrote:
>
> On Wed, 7 Mar 2018 18:20:12 -0800 Randy Dunlap <rdunlap@infradead.org> wr=
ote:
>=20
> > On 03/07/2018 04:20 PM, akpm@linux-foundation.org wrote: =20
> > > The mm-of-the-moment snapshot 2018-03-07-16-19 has been uploaded to
> > >=20
> > >    http://www.ozlabs.org/~akpm/mmotm/
> > >=20
> > > mmotm-readme.txt says
> > >=20
> > > README for mm-of-the-moment:
> > >=20
> > > http://www.ozlabs.org/~akpm/mmotm/
> > >=20
> > > This is a snapshot of my -mm patch queue.  Uploaded at random hopeful=
ly
> > > more than once a week. =20
> >=20
> > UML on i386 and/or x86_64:
> >=20
> > defconfig, CONFIG_MEMCG is not set:
> >=20
> > ../fs/notify/group.c: In function 'fsnotify_final_destroy_group':
> > ../fs/notify/group.c:41:24: error: dereferencing pointer to incomplete =
type
> >    css_put(&group->memcg->css); =20
>=20
> oops.
>=20
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: fs-fsnotify-account-fsnotify-metadata-to-kmemcg-fix
>=20
> fix CONFIG_MEMCG=3Dn build
>=20
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Amir Goldstein <amir73il@gmail.com>
> Cc: Christoph Lameter <cl@linux.com>
> Cc: David Rientjes <rientjes@google.com>
> Cc: Greg Thelen <gthelen@google.com>
> Cc: Jan Kara <jack@suse.cz>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
> Cc: Mel Gorman <mgorman@suse.de>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Pekka Enberg <penberg@kernel.org>
> Cc: Shakeel Butt <shakeelb@google.com>
> Cc: Vladimir Davydov <vdavydov.dev@gmail.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
>=20
>  fs/notify/group.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> --- a/fs/notify/group.c~fs-fsnotify-account-fsnotify-metadata-to-kmemcg-f=
ix
> +++ a/fs/notify/group.c
> @@ -38,7 +38,7 @@ static void fsnotify_final_destroy_group
>  		group->ops->free_group_priv(group);
> =20
>  	if (group->memcg)
> -		css_put(&group->memcg->css);
> +		mem_cgroup_put(group->memcg);
> =20
>  	kfree(group);
>  }

I have applied that to linux-next today.
--=20
Cheers,
Stephen Rothwell

--Sig_/7/NY81eOkhTXLaucIb0LHt4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqgxOoACgkQAVBC80lX
0GyQWwf+OOTRT0HPC735Gokgc+/Y8u9pLLyug4KOqXIfCRPYrP++L7efcpPd6l6u
yN50iQc1S0G+j6D63YmvasTWrwfuRas2IwFa7oidgTWBfNg+0Jp77zrNS68HOXCh
t0YhG70DJGOuH56DFjSQuGiYwfRwax4JzdC19YIokMnhtUGVn+fW9LCepA7xSn8t
6nIApzXiVDUE9DoPukl62eo+RnHTEzAWCjKwPLPSrQBnkJQUQxEO2lTuXxOcbAjM
RVLEXCcdTaVPjL8//1jFqs/X1EUgpdSkypyZku0sdpmjgQqVTXuJLVudY3DeobIx
OzG/NrpPzcgwYUNfrLASML9iKqyQkA==
=tnki
-----END PGP SIGNATURE-----

--Sig_/7/NY81eOkhTXLaucIb0LHt4--
