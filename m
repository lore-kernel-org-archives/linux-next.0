From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the rcu tree with Linus' tree
Date: Mon, 18 Jun 2018 13:48:49 +1000
Message-ID: <20180618134849.70831fe2@canb.auug.org.au>
References: <20180612104607.69f6f15b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_EDMy2JLIg6kqTbs3sy2/XA"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180612104607.69f6f15b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Joerg Roedel <jroedel@suse.de>
List-Id: linux-next.vger.kernel.org

--Sig_/_EDMy2JLIg6kqTbs3sy2/XA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 12 Jun 2018 10:46:07 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the rcu tree got a conflict in:
>=20
>   drivers/iommu/amd_iommu.c
>=20
> between commit:
>=20
>   94c793accacd ("iommu/amd: Hide unused iommu_table_lock")
>=20
> from Linus' tree and commit:
>=20
>   1df9bb146146 ("EXP iommu: Placeholder for fix in mainline")
>=20
> from the rcu tree.

I am still getting this.
--=20
Cheers,
Stephen Rothwell

--Sig_/_EDMy2JLIg6kqTbs3sy2/XA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsnK6EACgkQAVBC80lX
0GxsMgf8C6KozWVLOqxZaozY45jMbywTE6LPfeNCnrQ5R7aDNy7KWbnhKFTMd2qP
urum5b8b0oGCMfsdAeCVnfyqWyfdFYzPcMQDOPupFkMar5a4/bpclj+vfs+KKCmw
cAegeXSqHPGxdxyuEVcQN0COyd8y8BRp8D3AznX0iFI5QTXuiQ0v90dwBwFaXDAS
PPDZ1VrubtE29fVJmqBJRZPDck/4VxsMFRFyG45qQg1ox9JlydtpjN2V4RtotujB
tAmaTAWCAcvpsSfYqbhoh+UEw67dcVO7f+STtA/HFXWc/WXgfh1ZBnOljJgE21Tb
GnOG2bqSgdr2IdWaUa6peTXWBZjMMQ==
=6Pnt
-----END PGP SIGNATURE-----

--Sig_/_EDMy2JLIg6kqTbs3sy2/XA--
