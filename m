From: Doug Ledford <dledford@redhat.com>
Subject: Re: linux-next: build failure after merge of the rdma tree
Date: Wed, 28 Sep 2016 11:00:11 -0400
Message-ID: <57EBDAFB.9060204@redhat.com>
References: <20160927112334.3615159e@canb.auug.org.au>
 <20160928114348.2832fe46@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="nWCflHI5DOiBLEWRVnRVkApnOtHXj42Ku"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:59234 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750988AbcI1PAL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Sep 2016 11:00:11 -0400
In-Reply-To: <20160928114348.2832fe46@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Greg KH <greg@kroah.com>, Oleg Drokin <oleg.drokin@intel.com>, Andreas Dilger <andreas.dilger@intel.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nWCflHI5DOiBLEWRVnRVkApnOtHXj42Ku
Content-Type: multipart/mixed; boundary="M8nd0eO10qaTCIwLkBXv9BCPmS1RakSNl";
 protected-headers="v1"
From: Doug Ledford <dledford@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, Greg KH <greg@kroah.com>,
 Oleg Drokin <oleg.drokin@intel.com>,
 Andreas Dilger <andreas.dilger@intel.com>
Message-ID: <57EBDAFB.9060204@redhat.com>
Subject: Re: linux-next: build failure after merge of the rdma tree
References: <20160927112334.3615159e@canb.auug.org.au>
 <20160928114348.2832fe46@canb.auug.org.au>
In-Reply-To: <20160928114348.2832fe46@canb.auug.org.au>

--M8nd0eO10qaTCIwLkBXv9BCPmS1RakSNl
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 9/27/16 9:43 PM, Stephen Rothwell wrote:
> Hi Stephen,
>=20
> On Tue, 27 Sep 2016 11:23:34 +1000 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>>
>> Hi Doug,
>>
>> After merging the rdma tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c: In function 'kibl=
nd_hdev_setup_mrs':
>> drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c:2317:7: error: imp=
licit declaration of function 'ib_get_dma_mr' [-Werror=3Dimplicit-functio=
n-declaration]
>>   mr =3D ib_get_dma_mr(hdev->ibh_pd, acflags);
>>        ^
>> drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c:2317:5: warning: a=
ssignment makes pointer from integer without a cast [-Wint-conversion]
>>   mr =3D ib_get_dma_mr(hdev->ibh_pd, acflags);
>>      ^
>>
>> Caused by commit
>>
>>   5ef990f06bd7 ("IB/core: remove ib_get_dma_mr")
>>
>> I have used the rdma tree from next-20160923 for today.
>=20
> As pointed out by Christoph, I should have just disabled the driver in
> staging, so today I just applied the patch below.  Doug, that should
> probably be applied to the rdma tree so that you don't break Linus'
> tree when it gets merged.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 28 Sep 2016 11:35:28 +1000
> Subject: [PATCH] starging/lustre: disable LNET infiniband support
>=20
> Commit 5ef990f06bd7 ("IB/core: remove ib_get_dma_mr") broke the
> lustre LNET infiniband support.  Since this is in drivers/staging,
> lets just disable it for now until ti can be fixed properly.
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/staging/lustre/lnet/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/staging/lustre/lnet/Kconfig b/drivers/staging/lust=
re/lnet/Kconfig
> index 2b5930150cda..13b43278a38d 100644
> --- a/drivers/staging/lustre/lnet/Kconfig
> +++ b/drivers/staging/lustre/lnet/Kconfig
> @@ -35,6 +35,7 @@ config LNET_SELFTEST
>  config LNET_XPRT_IB
>  	tristate "LNET infiniband support"
>  	depends on LNET && INFINIBAND && INFINIBAND_ADDR_TRANS
> +	depends on BROKEN
>  	default LNET && INFINIBAND
>  	help
>  	  This option allows the LNET users to use infiniband as an
>=20

That doesn't seem like a particularly good thing to put in.  Wouldn't
you end up just reverting it later when they fix lustre?  And are you
going to revert the revert when it breaks again and revert the revert of
the revert when it's fixed again?  That just seems a lot of churn.  I
thought it was generally accepted that things in staging might or might
not work and if they don't, we don't care?  Am I wrong on that?

--=20
Doug Ledford <dledford@redhat.com>    GPG Key ID: 0E572FDD
  Red Hat, Inc.
  100 E. Davie St
  Raleigh, NC 27601 USA


--M8nd0eO10qaTCIwLkBXv9BCPmS1RakSNl--

--nWCflHI5DOiBLEWRVnRVkApnOtHXj42Ku
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBCgAGBQJX69r7AAoJELgmozMOVy/dv2cP/1rAMlqrN82/5LrW2hwjG0gI
200H6USrhGfiylFGEnxctwZcsyWiniOxYLFxS9xchEN+ry6SR5uEj2LRdBSLuoRb
azKI/DZnltztsJTts9yda13NisL0108PmuhokY6BNmRM6rsdMonnyscZ9b1WrYZE
KohCX3fv8q49CynEQMhjpUNPpi5H4Vc7gwKM4wqIgnQDj+b+m+AppRX+/F78im3I
+nbUT8Ybqp+sJbK4+5a6UPSQvVjH3J/ErBdzy/ibNevDDRq9LerlgjMiUKhfnZoq
GCDMGzrJOrzqDBnjvqAGuXUq33viWttwHFgBLpwAigw/WB4SWIvT+lEWaCJfdy3R
z53jfd4mOza2IzWWwX4IlJJgcFEMbNaOf2xrWYMDt18EhzZ2MSOqQo77eddXK+xh
0TbXd77PFTonR0dFTUD5FwJhFHMD/VC6WFyZk7A//EoAqwgq0CHfpQZOZVSRr8RM
topXgApGvi36bW2InDib748LsFLMfsWb97xTNB0NeI7qr6pO05i4+V2rHHIRWW/n
pNDr64XofWIxrtHHbSOOyMHQGnUmsPPHyle0InfSyHK1TJMePIcFiHU/RjE+9hBO
wZuZO7j+uy1FthSDoXJgJOmTp2duVWwnRzgkKBP3VxUeSZ25N7/7tVzB+mpg1Mji
8aUcKQ135TcJi+86g8X3
=EmNh
-----END PGP SIGNATURE-----

--nWCflHI5DOiBLEWRVnRVkApnOtHXj42Ku--
