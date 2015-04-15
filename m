From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the xen-tip tree
Date: Wed, 15 Apr 2015 15:00:20 +1000
Message-ID: <20150415150020.37c81478@canb.auug.org.au>
References: <20150413180902.59d8e9bd@canb.auug.org.au>
	<552B802A.3080709@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/O_Zumdat8dQbE_Q/VdvFmZn"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48950 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751424AbbDOFAa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Apr 2015 01:00:30 -0400
In-Reply-To: <552B802A.3080709@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>
Cc: Bob Liu <bob.liu@oracle.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wei Liu <wei.liu2@citrix.com>, David Vrabel <david.vrabel@citrix.com>, Paul Durrant <paul.durrant@citrix.com>

--Sig_/O_Zumdat8dQbE_Q/VdvFmZn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 13 Apr 2015 16:36:58 +0800 Bob Liu <bob.liu@oracle.com> wrote:
>
> On 04/13/2015 04:09 PM, Stephen Rothwell wrote:
> >
> > After merging the xen-tip tree, today's linux-next build (x86_64 allmod=
config)
> > failed like this:
> >
> > drivers/char/tpm/xen-tpmfront.c: In function 'setup_ring':
> > drivers/char/tpm/xen-tpmfront.c:203:7: warning: passing argument 2 of '=
xenbus_grant_ring' makes pointer from integer without a cast
> >    rv =3D xenbus_grant_ring(dev, virt_to_mfn(priv->shr));
> >         ^
> > In file included from drivers/char/tpm/xen-tpmfront.c:17:0:
> > include/xen/xenbus.h:206:5: note: expected 'void *' but argument is of =
type 'long unsigned int'
> >   int xenbus_grant_ring(struct xenbus_device *dev, void *vaddr,
> >       ^
> > drivers/char/tpm/xen-tpmfront.c:203:7: error: too few arguments to func=
tion 'xenbus_grant_ring'
> >    rv =3D xenbus_grant_ring(dev, virt_to_mfn(priv->shr));
> >         ^
> > In file included from drivers/char/tpm/xen-tpmfront.c:17:0:
> > include/xen/xenbus.h:206:5: note: declared here
> >   int xenbus_grant_ring(struct xenbus_device *dev, void *vaddr,
> >       ^
> >
> > Caused by commit 1b1586eeeb8c ("xenbus_client: Extend interface to
> > support multi-page ring").
> >
> > I have used the xen-tip tree from next-20150410 for today.
> >
>=20
> Sorry for this issue, I missed the xentpm-front.c file in that patch.
> (Original patch from Wei Liu already included the right modification=20
> which didn't exist in Paul's.)
>=20
> Attached patch should fix this build failure.

I am still getting this failure :-(

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/O_Zumdat8dQbE_Q/VdvFmZn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVLfBpAAoJEMDTa8Ir7ZwVueQP/j3HS+Y5frvTr1JeYjppbKZE
31bM8bNSsNDSPJ4JiC5Kr+ZCJwrzAt5PrO+2oRNskegp3qVCrtrt+cR0pt7R8wuQ
KC3Bzu0ng4aPX160RzwXxFWzViEdSpv5GRgvmfBdYsf77VYvqVKHH2Qcd/iwlbSb
dy9o3vpucPn4HBDr2wjslz+zEPIiZwlo7w6ajZ1GbokwRVCc16w0LxX2Ytr9Sb6f
WmAswr6i5zahq6XA9xrh0XQKPsBc4oC1fYiGa7021jhQyOOiqWDMYTRPj/RYE297
VYvcuQrvqlsfFdVUWN5eRxnXXf9EXRbSiR8a7/my/NYMh+OPyP+01bGS8heKPoNk
ZFV+hIjbUcpoVShURrEkLuxehxw+iM6OZyhEXI0LLxbsVxjK7x7+mWVguMplvXN3
GfnqTpRFl6rcekjFcJv8jV2XmBnX4w6oS3WTGUraqmfF+PclnvD/m/vOVnjK+M95
HR7KQQzGd5Q8e5yTwIFz79UEBiRmlG345gKREQZaFAAMsfRUrJ4bV+Mz5ORAZXTt
Td0DLh7T+fTuKO+4kGu4uR7ZXzbPj1j2ucLe3W4TBn3fP9Qi83mcFZ+80uKRiZW8
MjtQnNvFucbtFY8Q/Mv2ZbVazuTnzjsjCCzFAopVIPvFaIg/sSx+gDHcU6yA/US8
X+ASbUjemQF90VXxQkW2
=e/Em
-----END PGP SIGNATURE-----

--Sig_/O_Zumdat8dQbE_Q/VdvFmZn--
