From: James Hogan <james.hogan@imgtec.com>
Subject: Re: EXPORT_SYMBOL(min_low_pfn);
Date: Thu, 14 Mar 2013 11:38:05 +0000
Message-ID: <5141B69D.4080406@imgtec.com>
References: <CA+8MBbLW333z1Subx=fLu46u2RQXkNB1iTbORuKbq7YpZi1X_w@mail.gmail.com> <20130206113655.dd95bbcfc4e47e5cc8009d67@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigE60639042709CB980BEBC02E"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from multi.imgtec.com ([194.200.65.239]:5043 "EHLO multi.imgtec.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755972Ab3CNLiS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 14 Mar 2013 07:38:18 -0400
In-Reply-To: <20130206113655.dd95bbcfc4e47e5cc8009d67@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sanjay Lal <sanjayl@kymasys.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Tony Luck <tony.luck@intel.com>, linux-next@vger.kernel.org

--------------enigE60639042709CB980BEBC02E
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 06/02/13 00:36, Stephen Rothwell wrote:
> Hi all,
>=20
> On Tue, 5 Feb 2013 11:31:22 -0800 Tony Luck <tony.luck@intel.com> wrote=
:
>>
>> Today i noticed in linux-next this commit:
>>
>> commit b0d9c17503444c2df8cb8e93ccfa4877edd71933
>> Author: Sanjay Lal <sanjayl@kymasys.com>
>> Date:   Wed Nov 21 18:34:14 2012 -0800
>>
>>     MIPS: Export symbols used by KVM/MIPS module
>>
>> which causes this kernel build warning on ia64:
>>
>> WARNING: vmlinux: 'min_low_pfn' exported twice. Previous export was in=
 vmlinux
>>
>>
>> We just need to delete the arch/ia64 specific export (and grep says
>> for arch/metag too):
>>
>> $ git grep min_low_pfn | grep EXPORT
>> arch/ia64/kernel/ia64_ksyms.c:EXPORT_SYMBOL(min_low_pfn);	/* defined
>> by bootmem.c, but not exported by generic code */
>> arch/metag/kernel/metag_ksyms.c:EXPORT_SYMBOL(min_low_pfn);
>> mm/bootmem.c:EXPORT_SYMBOL(min_low_pfn);
>>
>>
>> Can you do this in the same branch as the mips change so the bits
>> will flow to Linus together in the next window?
>>
>> ia64 change (which gmail will no doubt mangle)
>=20
> It did :-)
>=20
>> From: "Luck, Tony" <tony.luck@intel.com>
>>
>> min_low_pfn is now exported by generic code
>>
>> Signed-off-by: Tony Luck <tony.luck@intel.com>
>>
>> ---
>>
>> diff --git a/arch/ia64/kernel/ia64_ksyms.c b/arch/ia64/kernel/ia64_ksy=
ms.c
>> index 5b7791d..ca95c8b 100644
>> --- a/arch/ia64/kernel/ia64_ksyms.c
>> +++ b/arch/ia64/kernel/ia64_ksyms.c
>> @@ -25,7 +25,6 @@ EXPORT_SYMBOL(copy_page);
>>
>>  #ifdef CONFIG_VIRTUAL_MEM_MAP
>>  #include <linux/bootmem.h>
>> -EXPORT_SYMBOL(min_low_pfn);    /* defined by bootmem.c, but not
>> exported by generic code */
>>  EXPORT_SYMBOL(max_low_pfn);    /* defined by bootmem.c, but not
>> exported by generic code */
>>  #endif
>=20
> I applied this as a merge fix to the mips tree merge for today, but it
> should be added to the mips tree.
>=20
> I also applied this as a merge fix (which only I can apply as the metag=

> tree is not in Linus' tree yet):
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 6 Feb 2013 11:31:24 +1100
> Subject: [PATCH] metag: min_low_pfn is now exported by generic code
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Acked-by: James Hogan <james.hogan@imgtec.com>

This has now cropped up again in linux-next:
> $ cgrep min_low_pfn | grep EXPORT_SY
> ./arch/ia64/kernel/ia64_ksyms.c:28:EXPORT_SYMBOL(min_low_pfn);  /* defi=
ned by bootmem.c, but not exported by generic code */
> ./arch/metag/kernel/metag_ksyms.c:15:EXPORT_SYMBOL(min_low_pfn);
> ./mm/bootmem.c:35:EXPORT_SYMBOL(min_low_pfn);

Please can Tony's ia64 and Stephen's metag patches be applied to the
relevant MIPS branch containing the "MIPS: Export symbols used by
KVM/MIPS module" change (which is now based on v3.9-rc2 so contains
arch/metag) so they can flow nicely to Linus?

Cheers
James


--------------enigE60639042709CB980BEBC02E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iQIcBAEBAgAGBQJRQbanAAoJEKHZs+irPybfqUkQAKKRpx6m5gwmkpYvMowuNQSe
kc8s4UiQROZNj7pfkaKpU7LDRg8Yi+ifOeyXRQfQoOlnB8MvffAxHNaHxiXfO1yB
rORTeqNl1TdcPwilyb4MnJyUyYTRJmSzftYc7YAgoCUkssWR9WQGcHFf64xo5/ll
r/3RmAUFaTtpoOndVqmvAEB5QxDW3YuoxDpVNUCUktOUsdOlOEIKSoapIWmFfHDE
eDsPhqUGfGHTiLCfAVTMRzLn7OSUc9O41nIUtDL8p4uGD96+CueQLuJh65Me0UTZ
XLXLelHhsAWnnXWAYhqBUO7ydCYXi1B0CII432l8C47BwXjYvbGoWIxvTN14r/QX
ctqH6hCcyGOve31V2pE4ENbYecNdIOKKRfcGk254IHrr4GWAppoBKl13gu6IVnjh
N88AYvZii6heQilWtcvz9Byq24PTWD93lKRcFoKvxXsmJbmHHLoTB+sdBKSItMAB
cgohtSgPKriTt2DWGakLSjjys6Cl62t0oAjHxKF59vddRGz367tqUE/rh3gvKka4
W/zLwb7qMk3/QrQrJJ1OAlbGLk10PzAz2avBm1QcR4bR9LcLeuDv66YyFo70FDBt
22I9zMw1JMaLt4baRtjF3YmObeNnURO9onAvSjgtE1rFv7RiwfKBrfGTp7DxRfR/
EeKRD6OcpZ1OKZL0PgI1
=CdCX
-----END PGP SIGNATURE-----

--------------enigE60639042709CB980BEBC02E--
