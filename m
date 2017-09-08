From: "Zi Yan" <zi.yan@cs.rutgers.edu>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Fri, 08 Sep 2017 13:54:03 -0400
Message-ID: <1923C218-018F-4969-AD49-460480ABD8A6@cs.rutgers.edu>
References: <20170801163904.7d49881a@canb.auug.org.au>
 <20170801205054.17c8579f@canb.auug.org.au>
 <00BCCF64-C319-44F0-992B-7F78D4676B5E@cs.rutgers.edu>
 <FB1FCBDA-1F7A-40C4-9415-3E6495B0B809@cs.rutgers.edu>
 <20170802154554.2fe6515b@canb.auug.org.au>
 <20170802163137.064ba4bf@canb.auug.org.au>
 <20170907152355.16f4490a@canb.auug.org.au>
 <20170907004612.4ac130b0e89daaa0e51b2f40@linux-foundation.org>
 <592A524A-150C-4209-BAA8-9CCDA25A2FA2@cs.rutgers.edu>
 <20170908124940.032ada7e@canb.auug.org.au>
 <20170908134336.369cfb0a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary="=_MailMate_5CAD6E7D-4FE4-4DB8-A2E0-0448822C2AE6_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170908134336.369cfb0a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 3156 and 4880).

--=_MailMate_5CAD6E7D-4FE4-4DB8-A2E0-0448822C2AE6_=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I checked. __pmd() works.

BTW, my sparc32 fix was added in linux-next on August 11th
and __pmd() is there, too. This means __pmd() + my fix has survived
for almost a month in linux-next. It should be good.

--
Best Regards
Yan Zi

On 7 Sep 2017, at 23:43, Stephen Rothwell wrote:

> Hi all,
>
> On Fri, 8 Sep 2017 12:49:59 +1000 Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote:
>>
>> OK, so today I have applied this instead (which is the same as droppin=
g
>> mm-thp-enable-thp-migration-in-generic-path-fix-fix-fix):
>>
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date: Fri, 8 Sep 2017 12:40:39 +1000
>> Subject: [PATCH] mm-thp-enable-thp-migration-in-generic-path-fix-fix
>>
>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> ---
>>  include/linux/swapops.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/linux/swapops.h b/include/linux/swapops.h
>> index b88441d284e2..291c4b534658 100644
>> --- a/include/linux/swapops.h
>> +++ b/include/linux/swapops.h
>> @@ -291,7 +291,7 @@ static inline swp_entry_t pmd_to_swp_entry(pmd_t p=
md)
>>
>>  static inline pmd_t swp_entry_to_pmd(swp_entry_t entry)
>>  {
>> -	return (pmd_t){};
>> +	return __pmd(0);
>>  }
>>
>>  static inline int is_pmd_migration_entry(pmd_t pmd)
>
> That survived my "during the day" builds (including sparc32).  Some one=

> should just check the overnight build results:
> https://na01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fkissk=
b.ellerman.id.au%2Flinux-next&data=3D02%7C01%7Czi.yan%40cs.rutgers.edu%7C=
2fd0d9ae031f4c49a49208d4f66bcc34%7Cb92d2b234d35447093ff69aca6632ffe%7C1%7=
C0%7C636404390233531971&sdata=3D%2F2RdKh9%2Fl5P8F1sIticPEnTLJaWyt0xR%2BV6=
YXFBhsRs%3D&reserved=3D0
> -- =

> Cheers,
> Stephen Rothwell

--=_MailMate_5CAD6E7D-4FE4-4DB8-A2E0-0448822C2AE6_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename=signature.asc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQEcBAEBCgAGBQJZstk7AAoJEEGLLxGcTqbMxNsH/jqMP5e/C/bZcoNPmOikMq13
yK50JqgLE4v/5sEvjT78DZqkl82IEl6akxcaTzc1eeuWGGm4CUlrTvmWkcIc/rTW
QtNy3W2xItF05s1XsPaWJp9JPuZ4z8NDXv8SmfxV9HpEcudYyJf9+PngNRBCxlgp
tkqnIjqW0KcuXNiQmci4H/CH7595aoiHI60OwSRa9I5t+jz0Hwbu7u7gdZbPj9t/
+FrwQ71BTsYsGcFSuAXAaOp705qvRQRgn1JKGrweWhXm/XquXMeYltNcPuChIk7Z
YYmr9Rz0HIHuMRwTQg69FmqCrJUvFxK7t9zO7NLxT10hR9j6ul/hKk6ChKnqTnE=
=hJ+F
-----END PGP SIGNATURE-----

--=_MailMate_5CAD6E7D-4FE4-4DB8-A2E0-0448822C2AE6_=--
