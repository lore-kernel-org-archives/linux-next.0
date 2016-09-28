From: Doug Ledford <dledford@redhat.com>
Subject: Re: linux-next: build failure after merge of the rdma tree
Date: Wed, 28 Sep 2016 11:26:20 -0400
Message-ID: <57EBE11C.9090902@redhat.com>
References: <20160927112334.3615159e@canb.auug.org.au>
 <20160928114348.2832fe46@canb.auug.org.au> <57EBDAFB.9060204@redhat.com>
 <20160928152339.GA1098@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="jOUKxemRfvgH7oRIL1j1Lkkg8VaAF5we6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:44096 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932591AbcI1P0U (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Sep 2016 11:26:20 -0400
In-Reply-To: <20160928152339.GA1098@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Oleg Drokin <oleg.drokin@intel.com>, Andreas Dilger <andreas.dilger@intel.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jOUKxemRfvgH7oRIL1j1Lkkg8VaAF5we6
Content-Type: multipart/mixed; boundary="hIUf9nJxPDoU009Nq5NjVQ3LPw0sUdLCb";
 protected-headers="v1"
From: Doug Ledford <dledford@redhat.com>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, Oleg Drokin <oleg.drokin@intel.com>,
 Andreas Dilger <andreas.dilger@intel.com>
Message-ID: <57EBE11C.9090902@redhat.com>
Subject: Re: linux-next: build failure after merge of the rdma tree
References: <20160927112334.3615159e@canb.auug.org.au>
 <20160928114348.2832fe46@canb.auug.org.au> <57EBDAFB.9060204@redhat.com>
 <20160928152339.GA1098@kroah.com>
In-Reply-To: <20160928152339.GA1098@kroah.com>

--hIUf9nJxPDoU009Nq5NjVQ3LPw0sUdLCb
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 9/28/16 11:23 AM, Greg KH wrote:
> On Wed, Sep 28, 2016 at 11:00:11AM -0400, Doug Ledford wrote:
>> On 9/27/16 9:43 PM, Stephen Rothwell wrote:
>>> Hi Stephen,
>>>
>>> On Tue, 27 Sep 2016 11:23:34 +1000 Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>>>>
>>>> Hi Doug,
>>>>
>>>> After merging the rdma tree, today's linux-next build (x86_64
>>>> allmodconfig) failed like this:
>>>>
>>>> drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c: In function 'ki=
blnd_hdev_setup_mrs':
>>>> drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c:2317:7: error: i=
mplicit declaration of function 'ib_get_dma_mr' [-Werror=3Dimplicit-funct=
ion-declaration]
>>>>   mr =3D ib_get_dma_mr(hdev->ibh_pd, acflags);
>>>>        ^
>>>> drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c:2317:5: warning:=
 assignment makes pointer from integer without a cast [-Wint-conversion]
>>>>   mr =3D ib_get_dma_mr(hdev->ibh_pd, acflags);
>>>>      ^
>>>>
>>>> Caused by commit
>>>>
>>>>   5ef990f06bd7 ("IB/core: remove ib_get_dma_mr")
>>>>
>>>> I have used the rdma tree from next-20160923 for today.
>>>
>>> As pointed out by Christoph, I should have just disabled the driver i=
n
>>> staging, so today I just applied the patch below.  Doug, that should
>>> probably be applied to the rdma tree so that you don't break Linus'
>>> tree when it gets merged.
>>>
>>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>>> Date: Wed, 28 Sep 2016 11:35:28 +1000
>>> Subject: [PATCH] starging/lustre: disable LNET infiniband support
>>>
>>> Commit 5ef990f06bd7 ("IB/core: remove ib_get_dma_mr") broke the
>>> lustre LNET infiniband support.  Since this is in drivers/staging,
>>> lets just disable it for now until ti can be fixed properly.
>>>
>>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>>> ---
>>>  drivers/staging/lustre/lnet/Kconfig | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/staging/lustre/lnet/Kconfig b/drivers/staging/lu=
stre/lnet/Kconfig
>>> index 2b5930150cda..13b43278a38d 100644
>>> --- a/drivers/staging/lustre/lnet/Kconfig
>>> +++ b/drivers/staging/lustre/lnet/Kconfig
>>> @@ -35,6 +35,7 @@ config LNET_SELFTEST
>>>  config LNET_XPRT_IB
>>>  	tristate "LNET infiniband support"
>>>  	depends on LNET && INFINIBAND && INFINIBAND_ADDR_TRANS
>>> +	depends on BROKEN
>>>  	default LNET && INFINIBAND
>>>  	help
>>>  	  This option allows the LNET users to use infiniband as an
>>>
>>
>> That doesn't seem like a particularly good thing to put in.  Wouldn't
>> you end up just reverting it later when they fix lustre?  And are you
>> going to revert the revert when it breaks again and revert the revert =
of
>> the revert when it's fixed again?
>=20
> Yup :)
>=20
> Well, in reality just keep adding and removing the line without dealing=

> with reverts, much simpler...
>=20
>> That just seems a lot of churn.  I
>> thought it was generally accepted that things in staging might or migh=
t
>> not work and if they don't, we don't care?  Am I wrong on that?
>=20
> Nope, you are not wrong, but it is nice to not break some people's
> builds if it's possible.

Okie dokie, got it.


--=20
Doug Ledford <dledford@redhat.com>    GPG Key ID: 0E572FDD
  Red Hat, Inc.
  100 E. Davie St
  Raleigh, NC 27601 USA


--hIUf9nJxPDoU009Nq5NjVQ3LPw0sUdLCb--

--jOUKxemRfvgH7oRIL1j1Lkkg8VaAF5we6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBCgAGBQJX6+EcAAoJELgmozMOVy/dAq4P/0pW3oPxb72MyoqAsChFHenj
K6SgFoRG0Sm6JZ1nDjqJK3SdVg/sNSl2fAY+oRe65aiH1mXoqiznb7yYITUqBBXK
PstcHplaHfa2QkUqYF7/hRzDm2OoiTXwNjKkTmzgFcv6PyqxWR6XzHOTNyagSlJ9
NJvJYdMdBZQQK1STPaZu7MnUtFp+b2BHm4hm1PeC+70F9027f2C4CEazmhjOuicq
kKysCWISHrO2Eyn0WVkDUlKy5fxl1PeVmgPeIcOhUWDeolEPpUVxYiHNYaDE6slC
nK014EuUo/E2H1Xb0cWnsRNGcPQOMnemdJpPLvcO+dwzOQRiQ4NYEm42ahH5v1VG
JgJ6D50Zxezi/M3rQF1NMyoGCAFEAUIxZQQH8kwfPNPc09/Jdl+PHfD22xlWChqf
VGiRAlNORSJbNYDr6dxdhihMo/AqNDGpqgq8NET7BieooFGwGiPSCy6Tn2oLvkfl
k22XWLoirdOCqtsIWSpWws5RDM0Q/29NEtQdgFIx92xRWoxnkzVT0AbPgnrYmGCs
X0R13QWtzWfdi0RbSenbOI7qvLBuID1Uh0csPkIzces2E/uF+Kirf+cQZag/KwPy
kZRUSug6UNpShyEWADf4NSm7KG8BFxiBZxbEr72008qOBq+wtS81PGTw7nzdUxiD
aOpbGDl1+RcaIn2vke8Q
=nEq+
-----END PGP SIGNATURE-----

--jOUKxemRfvgH7oRIL1j1Lkkg8VaAF5we6--
