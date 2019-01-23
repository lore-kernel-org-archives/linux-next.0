From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Fixes tags need some work in the dma-mapping-fixes
 tree
Date: Wed, 23 Jan 2019 23:09:15 +1100
Message-ID: <20190123230915.18046ca7@canb.auug.org.au>
References: <20190123074747.7cd44f12@canb.auug.org.au>
        <20190123071933.GA24861@lst.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/zfTzgZkjMu+JxxAL2Rw8Bfk"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190123071933.GA24861@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ming Lei <ming.lei@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/zfTzgZkjMu+JxxAL2Rw8Bfk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Wed, 23 Jan 2019 08:19:33 +0100 Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Jan 23, 2019 at 07:47:47AM +1100, Stephen Rothwell wrote:
> >   - SHA1 should be at least 12 digits long =20
>=20
> When did we decide on that?  As far as I know it was bumped to 10
> a while ago.  12 basically makes the line even more unreadable.

=46rom Documentation//process/submitting-patches.rst:

"If your patch fixes a bug in a specific commit, e.g. you found an issue us=
ing
``git bisect``, please use the 'Fixes:' tag with the first 12 characters of
the SHA-1 ID, and the one line summary."

Apparently we already have some clashes for 11 digit abbreviations.
Also, the git-config man page has:

"core.abbrev
           Set the length object names are abbreviated to. If unspecified or
           set to "auto", an appropriate value is computed based on the
           approximate number of packed objects in your repository, which
           hopefully is enough for abbreviated object names to stay unique =
for
           some time."

and when I set mine to "auto" it produces 12 digit SHA1 abbreviations
in the linux-next tree and in Linus' tree. So there has been some
discussion of suggesting core.abbrev not be set (which is the same as
"auto"), or being set to 13 to give some leeway.

> > In commit
> >=20
> >   8218a55b6b91 ("sbitmap: Protect swap_lock from hardirq")
> >=20
> > This later patch appears to already be in Linus' tree as commit
> > fe76fc6aaf53 (also with an incorrect Fixes tag :-() =20
>=20
> That commit is not from the dma-mapping tree..

This is in my linux-next tree today:

$ git log --oneline origin/master..dma-mapping-fixes/for-linus=20
702e8ed37bed arm64/xen: fix xen-swiotlb cache flushing
eda14f8977df nvme-pci: fix nvme_setup_irqs()
7c6f88f2fb4b nvmet-tcp: fix uninitialized variable access
8218a55b6b91 sbitmap: Protect swap_lock from hardirq
f5ac6c1e96a9 md: Make bio_alloc_mddev use bio_alloc_bioset
2490a5f5f2f8 block, bfq: fix comments on __bfq_deactivate_entity

origin/master is Linus' tree and dma-mapping-fixes is
git://git.infradead.org/users/hch/dma-mapping.git#for-linus

However, the committer of 8218a55b6b91 is Jens Axboe, so have you
accidentally based your for-linus branch on something from Jens?  That
commit does not appear in any other branch in linux-next.
--=20
Cheers,
Stephen Rothwell

--Sig_/zfTzgZkjMu+JxxAL2Rw8Bfk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxIWWsACgkQAVBC80lX
0GwxsAf+LPHzHY6BWlHBnlYeErRWrj2FYpDzkLOAcdVXGmfCkVXwn3rIO9o87f/n
gJxESJTa8jOhvb0IKkK8/BH4mJxyYt948M/580ENL6i7jefwE+7n45nmw/uMvyqF
8C4trhf22rYfwtN6/e4IYQkeGoINccsX0XH0LdouxvDXhAYFHI78WGLzTk0CpG2p
2PBiZpdoHUcFGPRld/GYJn8M+pn14/wGkcSyUq4+Wocahcn/VWQFgrX4VBUW+1uv
LIc9/VNuhA4/l9BTOoqQje/TiVp6suYBCl4NO+PhJeHDNatKoYWh4S7yejW2IOaf
5gPUSv73vGfnUm5SkYZhXgyTEot98Q==
=8yEt
-----END PGP SIGNATURE-----

--Sig_/zfTzgZkjMu+JxxAL2Rw8Bfk--
