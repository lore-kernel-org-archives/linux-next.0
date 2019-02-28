From: Leon Romanovsky <leon@kernel.org>
Subject: Re: linux-next: manual merge of the net-next tree with the rdma tree
Date: Thu, 28 Feb 2019 11:05:38 +0200
Message-ID: <20190228090538.GI15253@mtr-leonro.mtl.com>
References: <20190227112522.2f32b5d7@canb.auug.org.au>
 <16f0ac6227f948165b7062a72e1fa82f1dfe4697.camel@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Sw7tCqrGA+HQ0/zt"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <16f0ac6227f948165b7062a72e1fa82f1dfe4697.camel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Jason Gunthorpe <jgg@mellanox.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shamir Rabinovitch <shamir.rabinovitch@oracle.com>, Jakub Kicinski <jakub.kicinski@netronome.com>
List-Id: linux-next.vger.kernel.org


--Sw7tCqrGA+HQ0/zt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 27, 2019 at 11:24:51AM -0500, Doug Ledford wrote:
> On Wed, 2019-02-27 at 11:25 +1100, Stephen Rothwell wrote:
> > Hi all,
> >
> > Today's linux-next merge of the net-next tree got a conflict in:
> >
> >   drivers/infiniband/hw/mlx4/Kconfig
> >
> > between commit:
> >
> >   6fa8f1afd337 ("IB/{core,uverbs}: Move ib_umem_xxx functions from ib_core to ib_uverbs")
> >
> > from the rdma tree and commit:
> >
> >   f4b6bcc7002f ("net: devlink: turn devlink into a built-in")
> >
> > from the net-next tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >
>
> Thanks Stephen, we'll add it to the (largish this release) list of
> conflicts to bring to Linus' attention.

Thanks

>
> --
> Doug Ledford <dledford@redhat.com>
>     GPG KeyID: B826A3330E572FDD
>     Key fingerprint = AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FDD



--Sw7tCqrGA+HQ0/zt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJcd6RiAAoJEORje4g2cling6UQALWqfFTY0PGurqrSq5C/SMa0
+drjsyY7SaxOO1pE6kXGAzA3QrM4qjD4jMPkk4yMdDx+Z9cdM0ycApnIKQhfzfGq
VO+lWr3cvRRmYq2q+Hh0doLh8MWlBooTicc1m1DzLgziYRQUw1LyAs5El6UbcQvl
BWnlPHF0ilcqIw5JCtKStchov7JLo/UYsrFtVX7G+0SSyw8TNmo53BaFQ4RwwR25
XrYy93M86UGs7dALYmMVco+JTp5JvgD5u2f+7EQfe6DMHixcLQT2ynCDSwF4Fh02
EYDiPw6N/ca1xpBYbZxE/Log8B3cAIGuh1W6yBeXidAYfDWuR89ep/RAotdAJuNM
Q81+xMbwNmx49HP2ex7Jf4Ppjn6SPvPbkktzXjzgIDEs2YB0ElW9jj+HAPzwHEp3
HPmuysZawGQY4SI3QETgUBtkFp+erezKoM8DxtC4mKCiDf8r12ZObmEuL5cDjORB
gMUXh+L5J6C6H3SxTInMp9C/2dAEhpfWZvOKszZ4FxEV6FsQxmyqGV0z0TgvarCu
UfzYpqiIIcPXRamjUcPJIHSgssORO6MNw5BBRbEwpsx11ux7me5vK6lB3FseNmUi
YkpleORNneUZlfDLRuPWOGdXyafWhuKlwrBOkiI6dsNJ8Tt/fE848cx0hF43LHH/
8oIm6QU4gEpIKQZkOBBt
=WiJt
-----END PGP SIGNATURE-----

--Sw7tCqrGA+HQ0/zt--
