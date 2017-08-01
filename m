From: "Zi Yan" <zi.yan@cs.rutgers.edu>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Tue, 01 Aug 2017 09:08:01 -0400
Message-ID: <FB1FCBDA-1F7A-40C4-9415-3E6495B0B809@cs.rutgers.edu>
References: <20170801163904.7d49881a@canb.auug.org.au>
 <20170801205054.17c8579f@canb.auug.org.au>
 <00BCCF64-C319-44F0-992B-7F78D4676B5E@cs.rutgers.edu>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary="=_MailMate_C446D28F-1B7F-4080-BA0D-248CDFF790E3_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-by2nam01on0137.outbound.protection.outlook.com ([104.47.34.137]:12260
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751670AbdHANIJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 1 Aug 2017 09:08:09 -0400
In-Reply-To: <00BCCF64-C319-44F0-992B-7F78D4676B5E@cs.rutgers.edu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 3156 and 4880).

--=_MailMate_C446D28F-1B7F-4080-BA0D-248CDFF790E3_=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

I found two possible fixes.

1. This uses C++ zero initializer, GCC is OK with it.
I tested with GCC 4.9.3 (has the initialization bug) and GCC 6.4.0.

--- a/include/linux/swapops.h~a
+++ a/include/linux/swapops.h
@@ -217,7 +217,7 @@ static inline swp_entry_t pmd_to_swp_ent

 static inline pmd_t swp_entry_to_pmd(swp_entry_t entry)
 {
-	return (pmd_t){ 0 };
+	return (pmd_t){};
 }

 static inline int is_pmd_migration_entry(pmd_t pmd)


2. This is ugly but working.
It works with GCC 4.9.3 and GCC 6.4.0.


--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -219,7 +219,10 @@ static inline swp_entry_t pmd_to_swp_entry(pmd_t pmd=
)

 static inline pmd_t swp_entry_to_pmd(swp_entry_t entry)
 {
-       return (pmd_t){ 0 };
+       pmd_t e;
+       memset(&e, 0, sizeof(pmd_t));
+       return e;
 }

 static inline int is_pmd_migration_entry(pmd_t pmd)


=E2=80=94
Best Regards,
Yan Zi

On 1 Aug 2017, at 7:30, Zi Yan wrote:

> Hi Stephen,
>
> The warning after removing __pmd() is caused by a gcc bug: https://gcc.=
gnu.org/bugzilla/show_bug.cgi?id=3D53119
> so (pmd_t) {0} causes warning in some GCC versions.
>
> __pmd() is defined in alpha, arm, arm64, frv, ia64, m32r, m68k, microbl=
aze, mips, parisc,
> powerpc, s390, sh, sparc, tile, um, x86, and asm-generic, according to
> http://elixir.free-electrons.com/linux/latest/ident/__pmd
>
> I am not sure about whether arc, blackfin, c6x, cris, h8300, hexagon, m=
etag, mn10300, nios2, score,
> xtensa use __pmd() in asm-generic or not.
>
> I am looking for other workarounds for this warning now.
>
>
> =E2=80=94
> Best Regards,
> Yan Zi
>
> On 1 Aug 2017, at 6:50, Stephen Rothwell wrote:
>
>> Hi all,
>>
>> On Tue, 1 Aug 2017 16:39:04 +1000 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>>>
>>> After merging the akpm tree, today's linux-next build (sparc defconfi=
g)
>>> failed like this:
>>>
>>> In file included from mm/vmscan.c:55:0:
>>> include/linux/swapops.h: In function 'swp_entry_to_pmd':
>>> include/linux/swapops.h:226:9: error: implicit declaration of functio=
n '__pmd' [-Werror=3Dimplicit-function-declaration]
>>>   return __pmd(0);
>>>          ^
>>> include/linux/swapops.h:226:9: error: incompatible types when returni=
ng type 'int' but 'pmd_t {aka struct <anonymous>}' was expected
>>>
>>> Caused by commit
>>>
>>>   9bb18490758c ("mm-thp-enable-thp-migration-in-generic-path-fix")
>>>
>>> It looks like sparc 32 bit has no __pmd() ...
>>>
>>> I have reverted that commit for today.
>>
>> OK, that is a pain as it causes many build warnings some of which are
>> treated as errors :-(  (see e.g.
>> https://na01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fkiss=
kb.ellerman.id.au%2Fkisskb%2Fbuildresult%2F13112192%2F&data=3D02%7C01%7Cz=
i.yan%40cs.rutgers.edu%7Cbf7a7ad57ad04505172f08d4d8cb31c5%7Cb92d2b234d354=
47093ff69aca6632ffe%7C1%7C0%7C636371814609835949&sdata=3DdiTid245prNY3Jy1=
pPEaL5q8dSBifFVzliKRq54fXhk%3D&reserved=3D0).  So maybe
>> we need to fix sthe sparc32 build instead?  Are there any other
>> architectures/platforms that do not define __pmd() ?
>>
>> -- =

>> Cheers,
>> Stephen Rothwell

--=_MailMate_C446D28F-1B7F-4080-BA0D-248CDFF790E3_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename=signature.asc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQEcBAEBCgAGBQJZgH0yAAoJEEGLLxGcTqbMhSAH/3/csVdCC7i3mQpuMgyQw9b5
jGyjOWI/cq5z1Dxb2aroIYMcmA+3TFw2qLEa34RmkEEJnyF8RRKCLomb7TYXK34k
fUG1uTbAEzQodI3kSwVfL06gRD46bcGH/1jGzk3T9lz9Gjx1uIeqIhBisG1IkQMT
n1Om/FPG5d2nUvJopo8zTtTo8RUNUjXru8lxNx/UHa7lN6pJQSqlQrGli3kkerNJ
gHUaqMmIVRcXAnwL/1bCitrCmAWP7kb2hQz0Vk/ExPkLN8ClpXLqidK1azmI/Iwq
IMphVCPWaKABOrSSawNW+3WcKtw8UgA1VSBhTnt4jfeoBa27GEudIVdJAZeDQVA=
=OmPE
-----END PGP SIGNATURE-----

--=_MailMate_C446D28F-1B7F-4080-BA0D-248CDFF790E3_=--
