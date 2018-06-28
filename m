From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the btrfs-kdave tree
Date: Fri, 29 Jun 2018 09:58:58 +1000
Message-ID: <20180629095858.655ae88f@canb.auug.org.au>
References: <20180627085936.4f9cc4f2@canb.auug.org.au>
        <20180628161102.GJ2287@suse.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/nI2ElGffOETyszhKHdSp_Ti"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180628161102.GJ2287@suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: David Sterba <dsterba@suse.cz>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nikolay Borisov <nborisov@suse.com>
List-Id: linux-next.vger.kernel.org

--Sig_/nI2ElGffOETyszhKHdSp_Ti
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi David,

On Thu, 28 Jun 2018 18:11:03 +0200 David Sterba <dsterba@suse.cz> wrote:
>
> On Wed, Jun 27, 2018 at 08:59:36AM +1000, Stephen Rothwell wrote:
> > After merging the btrfs-kdave tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> >=20
> > fs/btrfs/print-tree.c: In function 'print_extent_item':
> > fs/btrfs/print-tree.c:56:3: error: implicit declaration of function 'bt=
rfs_print_v0_err'; did you mean 'btrfs_print_tree'? [-Werror=3Dimplicit-fun=
ction-declaration]
> >    btrfs_print_v0_err(eb->fs_info);
> >    ^~~~~~~~~~~~~~~~~~
> >    btrfs_print_tree =20
>=20
> Should be fixed in today's branch.

Sorry, still broken.  I fetched your tree only about 5 minutes ago.

--=20
Cheers,
Stephen Rothwell

--Sig_/nI2ElGffOETyszhKHdSp_Ti
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAls1dkIACgkQAVBC80lX
0GxQXAf/YfufiSebI9R2qYp/QA0I67edCMf19zdig0If3eJCDE+3piD8HDTVFfHs
AqO1NoFFnhAOBTyEjMMQBl9rvVMfhvNYc4OncuFu4aDooe99S5nXw73d7C9pEysn
tfzmZndJ+GrfwS9ai1v2MklmLfnlHtq0deq3LwD4s+jU2/AAXClDN6G90fsxSnvA
N6YHphWir89r5IPN8Qd3SU1xUT/GCVZ8KKl3vWclIF13U63Q+580clBXBy88LDx5
jZz+X3U948pAKGkaipvhOQ/SCuqTLQo6jgILClj/zi9hQvsO6J3lFJng6JG+5VBC
IqeEYw3na0+2/18+yA9JHGyKk1YEWQ==
=1SJz
-----END PGP SIGNATURE-----

--Sig_/nI2ElGffOETyszhKHdSp_Ti--
