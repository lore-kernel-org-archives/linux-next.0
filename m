From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: build failure after merge of the device-mapper tree
Date: Wed, 30 May 2018 22:35:40 -0600
Message-ID: <A669939D-1AC5-48AA-AAE2-92694FB25B11@kernel.dk>
References: <20180531142302.5f7b4302@canb.auug.org.au>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180531142302.5f7b4302@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kent Overstreet <kent.overstreet@gmail.com>
List-Id: linux-next.vger.kernel.org

On May 30, 2018, at 10:23 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:=

>=20
> Hi all,
>=20
> After merging the device-mapper tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/md/dm-writecache.c: In function 'writecache_dtr':
> drivers/md/dm-writecache.c:1799:3: error: implicit declaration of function=
 'bioset_free'; did you mean 'bvec_free'? [-Werror=3Dimplicit-function-decla=
ration]
>   bioset_free(wc->bio_set);
>   ^~~~~~~~~~~
>   bvec_free
> drivers/md/dm-writecache.c: In function 'writecache_ctr':
> drivers/md/dm-writecache.c:1929:17: error: implicit declaration of functio=
n 'bioset_create'; did you mean 'bioset_exit'? [-Werror=3Dimplicit-function-=
declaration]
>   wc->bio_set =3D bioset_create(BIO_POOL_SIZE,
>                 ^~~~~~~~~~~~~
>                 bioset_exit
> drivers/md/dm-writecache.c:1929:15: warning: assignment makes pointer from=
 integer without a cast [-Wint-conversion]
>   wc->bio_set =3D bioset_create(BIO_POOL_SIZE,
>               ^
>=20
> Caused by commit
>=20
>  2105231db61b ("dm: add writecache target")
>=20
> interacting with commit
>=20
>  dad08527525f ("block: Drop bioset_create()")
>=20
> from the block tree.
>=20
> Can we please consider not immediately dropping APIs if at all
> possible. :-(

I=E2=80=99ll drop the last patch, we can do that at the end of the merge win=
dow instead.=20
