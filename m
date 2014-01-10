From: David Vrabel <david.vrabel@citrix.com>
Subject: Re: randconfig build error with next-20140108, in drivers/xen/platform-pci.c
Date: Fri, 10 Jan 2014 15:33:45 +0000
Message-ID: <52D012D9.1010602@citrix.com>
References: <CA+r1ZhinEQiBzonB_+ev_9hry+-7wscEVWcwqW46ExjGC2SYYg@mail.gmail.com> <20140110150738.GC19124@phenom.dumpdata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp02.citrix.com ([66.165.176.63]:37526 "EHLO
	SMTP02.CITRIX.COM" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750944AbaAJPds (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 10 Jan 2014 10:33:48 -0500
In-Reply-To: <20140110150738.GC19124@phenom.dumpdata.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Jim Davis <jim.epost@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com, xen-devel@lists.xenproject.org

On 10/01/14 15:07, Konrad Rzeszutek Wilk wrote:
> On Wed, Jan 08, 2014 at 03:32:00PM -0700, Jim Davis wrote:
>> Building with the attached random configuration file,
>>
>> drivers/xen/platform-pci.c: In function =E2=80=98platform_pci_init=E2=
=80=99:
>> drivers/xen/platform-pci.c:131:2: error: implicit declaration of
>> function =E2=80=98pci_request_region=E2=80=99 [-Werror=3Dimplicit-fu=
nction-declaration]
>>   ret =3D pci_request_region(pdev, 1, DRV_NAME);
>>   ^
>> drivers/xen/platform-pci.c:170:2: error: implicit declaration of
>> function =E2=80=98pci_release_region=E2=80=99 [-Werror=3Dimplicit-fu=
nction-declaration]
>>   pci_release_region(pdev, 0);
>>   ^
>> cc1: some warnings being treated as errors
>> make[2]: *** [drivers/xen/platform-pci.o] Error 1
>>
>> These warnings appeared too:
>>
>> warning: (XEN_PVH) selects XEN_PVHVM which has unmet direct
>> dependencies (HYPERVISOR_GUEST && XEN && PCI && X86_LOCAL_APIC)
>=20
> Hey Jim,
>=20
> This fix works for me:
>=20
>=20
> diff --git a/arch/x86/xen/Kconfig b/arch/x86/xen/Kconfig
> index d88bfd6..01b9026 100644
> --- a/arch/x86/xen/Kconfig
> +++ b/arch/x86/xen/Kconfig
> @@ -53,6 +53,5 @@ config XEN_DEBUG_FS
> =20
>  config XEN_PVH
>  	bool "Support for running as a PVH guest"
> -	depends on X86_64 && XEN
> -	select XEN_PVHVM
> +	depends on X86_64 && XEN && XEN_PVHVM
>  	def_bool n
>=20
> David, you OK with that? You suggested to use 'select' in the patchse=
t
> instead of 'depends' and this throws away your suggestion.

Yes.

David
