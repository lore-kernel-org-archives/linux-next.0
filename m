From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with the
 efi-lock-down tree
Date: Mon, 9 Apr 2018 11:58:31 +1000
Message-ID: <20180409115831.46a351ef@canb.auug.org.au>
References: <20180315183412.01412755@canb.auug.org.au>
        <20180406092216.4579a70c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/sur8TFX3TH7kkJYAJXCQ_rF"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180406092216.4579a70c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: James Morris <jmorris@namei.org>
Cc: David Howells <dhowells@redhat.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/sur8TFX3TH7kkJYAJXCQ_rF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 6 Apr 2018 09:22:16 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Thu, 15 Mar 2018 18:34:12 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > Today's linux-next merge of the scsi-mkp tree got a conflict in:
> >=20
> >   drivers/scsi/eata.c
> >=20
> > between commit:
> >=20
> >   5b76b160badb ("scsi: Lock down the eata driver")
> >=20
> > from the efi-lock-down tree and commit:
> >=20
> >   6b1745caa14a ("scsi: eata: eata-pio: Deprecate legacy EATA drivers")
> >=20
> > from the scsi-mkp tree.
> >=20
> > I fixed it up (I just removed the file) and can carry the fix as
> > necessary. This is now fixed as far as linux-next is concerned, but any
> > non trivial conflicts should be mentioned to your upstream maintainer
> > when your tree is submitted for merging.  You may also want to consider
> > cooperating with the maintainer of the conflicting tree to minimise any
> > particularly complex conflicts. =20
>=20
> This is now a conflict between the efi-lock-down tree and Linus' tree.

This is now a conflict between the security tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/sur8TFX3TH7kkJYAJXCQ_rF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlrKyMcACgkQAVBC80lX
0Gx2Cgf6AsDYsPBGIp50pT6UssXDNkeqAgiWtV5wjl4I54eEIBQocwXXZevaB5Jb
TkUFqx4F8PWObpKI+2dXC3qc/nkBEovcICCeVQTrH4Jdfh1BPo1NlUMxNE7ICc1s
G9iI9BZIIFCej7ql0jZFC0N7Dh1r6AqwH0ogV4INeDQRulencH9l9hyJrZysD5RG
NqCNqvwHzIPKUEuvQbswdEd6vZeFV7EzwTNLZu21wn7aPsIl6134UnnURdlV286j
7DYSvMPe5k+APjUxV05/VCKeY5V4mgf2MerSovyqskYqxpcc4lxMjjoWtl5+ktXE
hJrBdqGzOtmi7Z327KJNujKgBBa3Cw==
=HNw7
-----END PGP SIGNATURE-----

--Sig_/sur8TFX3TH7kkJYAJXCQ_rF--
