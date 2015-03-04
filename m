From: NeilBrown <neilb@suse.de>
Subject: Re: linux-next: build failure after merge of the md tree
Date: Wed, 4 Mar 2015 13:44:18 +1100
Message-ID: <20150304134418.70bc4457@notabene.brown>
References: <20150302165057.29087a08@canb.auug.org.au>
	<20150302170345.742add96@notabene.brown>
	<20150302171149.0a62b072@canb.auug.org.au>
	<20150303133531.72f10682@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/DEvRnfMat0kErc_MYXXcFHa"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:59732 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757095AbbCDCpF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 3 Mar 2015 21:45:05 -0500
In-Reply-To: <20150303133531.72f10682@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Goldwyn Rodrigues <rgoldwyn@suse.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/DEvRnfMat0kErc_MYXXcFHa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Mar 2015 13:35:31 +1100 Stephen Rothwell <sfr@canb.auug.org.au>
wrote:

> Hi Neil,
>=20
> On Mon, 2 Mar 2015 17:11:49 +1100 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > On Mon, 2 Mar 2015 17:03:45 +1100 NeilBrown <neilb@suse.de> wrote:
> > >
> > > I think
> > > +               bm_blocks =3D DIV_ROUND_UP(bm_blocks, 4096);
> > >=20
> > > needs DIV_ROUND_UP_SECTOR_T()
> >=20
> > I tried that and it was not sufficient.
> >=20
> > > The first patch you identified adds that line.  The second relocates =
it.
> >=20
> > The second also changes this:
> >=20
> > bm_blocks =3D sector_div(bitmap->mddev->resync_max_sectors, (chunksize =
>> 9));
> >=20
> > (added by the first) to this:
> >=20
> > bm_blocks =3D bitmap->mddev->resync_max_sectors / (bitmap->mddev->bitma=
p_info.chunksize >> 9);
> >=20
> > where bitmap->mddev->resync_max_sectors is a sector_t ...
>=20
> So I applied this patch for today:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 3 Mar 2015 13:30:26 +1100
> Subject: [PATCH] md/bitmap: use sector_div for sector_t divisions
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/md/bitmap.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/md/bitmap.c b/drivers/md/bitmap.c
> index 23f575f0cd92..d40398404ab6 100644
> --- a/drivers/md/bitmap.c
> +++ b/drivers/md/bitmap.c
> @@ -573,7 +573,8 @@ re_read:
>  	if (bitmap->cluster_slot >=3D 0) {
>  		long long bm_blocks;
> =20
> -		bm_blocks =3D bitmap->mddev->resync_max_sectors / (bitmap->mddev->bitm=
ap_info.chunksize >> 9);
> +		bm_blocks =3D sector_div(bitmap->mddev->resync_max_sectors,
> +				       bitmap->mddev->bitmap_info.chunksize >> 9);
>  		bm_blocks =3D bm_blocks << 3;
>  		bm_blocks =3D DIV_ROUND_UP_SECTOR_T(bm_blocks, 4096);
>  		bitmap->mddev->bitmap_info.offset +=3D bitmap->cluster_slot * (bm_bloc=
ks << 3);


Thanks!
sector_div() leave the remainder in it's first argument, so this isn't quite
correct - you need to store resync_max_sectors in a temp variable.
So I made that change and applied you patch.

Thanks,
NeilBrown

--Sig_/DEvRnfMat0kErc_MYXXcFHa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUBVPZxgjnsnt1WYoG5AQL2OhAAgi8rUsHAK0s940wcb+dxil6aPFTyGMX2
omjz5zNQHBMjXRzxxx1yPQjceDFcKVoOZUfrv/oHJohIQeP5oayxbbOQLwzlRbu+
eTDtvEAvqjqfaSngHN1kMkcm0PYdPYuTE2KpjfGUOfkHX79V9GLVDD4NlI9HU9I6
GrClHEolSVVLw5JppdV0GnHywGLRDdwC1AmA342M3lAslbihsbHQxRac5Z6U8Pqj
RYMg2CRNbt/kf/YA3kvKa318P4Vp4nU0/9kUUGCx9hnpR5ZOLKHIGZ17nnB/9VLZ
YV9q/pr53y80SY94qqtLmLHxPfveH4tnWBiPfHX9YecdFEFvcjE6wGUq7xrYtqtm
TdpE66j4dRuJIdgiPWuMOIHQIYL6Hab2/VkHt4+1N60tazozmBmmJafatmnBnrBd
ZijG4O2kJpI/kkQJ6anu/QE+snmD+Vtcq0bXA45HRfp30ysIAT1v83NXaUpq2NW8
jBEm5ZGkhMJvT87xLo5bTCtHH7SHRxUgQQP8uzBLUesoipa5iuJiqy5Tvvy8nOrb
3I6trSvXxK3rK3pExMIoeheC4Gwu+1IIqa4v19E4ftf7U71c67EebJjpWKnzA3lH
QTO5CwhDHoaI/FCYWvScx7KcVEv2deU91Cu/UHsnFTUPfEh7V0tukELR+X7zQrkr
j2Zv0MTJoT8=
=2C3L
-----END PGP SIGNATURE-----

--Sig_/DEvRnfMat0kErc_MYXXcFHa--
