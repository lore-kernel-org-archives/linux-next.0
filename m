From: "Zi Yan" <zi.yan@cs.rutgers.edu>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Tue, 01 Aug 2017 07:30:07 -0400
Message-ID: <00BCCF64-C319-44F0-992B-7F78D4676B5E@cs.rutgers.edu>
References: <20170801163904.7d49881a@canb.auug.org.au>
 <20170801205054.17c8579f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary="=_MailMate_E24B9B8B-5478-4D62-8B88-3E4A25894F95_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bl2nam02on0110.outbound.protection.outlook.com ([104.47.38.110]:36400
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751166AbdHALaN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 1 Aug 2017 07:30:13 -0400
In-Reply-To: <20170801205054.17c8579f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 3156 and 4880).

--=_MailMate_E24B9B8B-5478-4D62-8B88-3E4A25894F95_=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

The warning after removing __pmd() is caused by a gcc bug: https://gcc.gn=
u.org/bugzilla/show_bug.cgi?id=3D53119
so (pmd_t) {0} causes warning in some GCC versions.

__pmd() is defined in alpha, arm, arm64, frv, ia64, m32r, m68k, microblaz=
e, mips, parisc,
powerpc, s390, sh, sparc, tile, um, x86, and asm-generic, according to
http://elixir.free-electrons.com/linux/latest/ident/__pmd

I am not sure about whether arc, blackfin, c6x, cris, h8300, hexagon, met=
ag, mn10300, nios2, score,
xtensa use __pmd() in asm-generic or not.

I am looking for other workarounds for this warning now.


=E2=80=94
Best Regards,
Yan Zi

On 1 Aug 2017, at 6:50, Stephen Rothwell wrote:

> Hi all,
>
> On Tue, 1 Aug 2017 16:39:04 +1000 Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote:
>>
>> After merging the akpm tree, today's linux-next build (sparc defconfig=
)
>> failed like this:
>>
>> In file included from mm/vmscan.c:55:0:
>> include/linux/swapops.h: In function 'swp_entry_to_pmd':
>> include/linux/swapops.h:226:9: error: implicit declaration of function=
 '__pmd' [-Werror=3Dimplicit-function-declaration]
>>   return __pmd(0);
>>          ^
>> include/linux/swapops.h:226:9: error: incompatible types when returnin=
g type 'int' but 'pmd_t {aka struct <anonymous>}' was expected
>>
>> Caused by commit
>>
>>   9bb18490758c ("mm-thp-enable-thp-migration-in-generic-path-fix")
>>
>> It looks like sparc 32 bit has no __pmd() ...
>>
>> I have reverted that commit for today.
>
> OK, that is a pain as it causes many build warnings some of which are
> treated as errors :-(  (see e.g.
> https://na01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fkissk=
b.ellerman.id.au%2Fkisskb%2Fbuildresult%2F13112192%2F&data=3D02%7C01%7Czi=
=2Eyan%40cs.rutgers.edu%7Cbf7a7ad57ad04505172f08d4d8cb31c5%7Cb92d2b234d35=
447093ff69aca6632ffe%7C1%7C0%7C636371814609835949&sdata=3DdiTid245prNY3Jy=
1pPEaL5q8dSBifFVzliKRq54fXhk%3D&reserved=3D0).  So maybe
> we need to fix sthe sparc32 build instead?  Are there any other
> architectures/platforms that do not define __pmd() ?
>
> -- =

> Cheers,
> Stephen Rothwell

--=_MailMate_E24B9B8B-5478-4D62-8B88-3E4A25894F95_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename=signature.asc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQEcBAEBCgAGBQJZgGY/AAoJEEGLLxGcTqbM14IH/i0cYfKue27hDGYyON8LEIkI
khELbzbu7zGXCeRcKdtyc6I+0MOfpd1rsumRE9CPeKo3PAp7bUERg8w5FbpdzYDZ
X39PrxB5cK/9ARE4cDiuXTKdwrB893tC7vRMwBJ29MSXdf9tHuF4F5GuTzDY5NNf
D6i+gGS42QETBrKowmqWTQ8K5+vya003v5QAvA4AEERMUaThFrzLsgjc1GRGvfVl
Sg6rZRQkxSDYOzoBa3ejdT9ADo7t3bJaUpkmv1dLn7s13clhyUYF/7rnFBIijuyQ
T/4tszLeBhWIsZsJtPnLLJRzVmZy//JyVRlrpktTrY6UIfjNdIFfGcIuZAY6KJs=
=Q/SV
-----END PGP SIGNATURE-----

--=_MailMate_E24B9B8B-5478-4D62-8B88-3E4A25894F95_=--
