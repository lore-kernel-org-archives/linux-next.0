From: "Zi Yan" <zi.yan@cs.rutgers.edu>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 07 Sep 2017 06:59:09 -0400
Message-ID: <592A524A-150C-4209-BAA8-9CCDA25A2FA2@cs.rutgers.edu>
References: <20170801163904.7d49881a@canb.auug.org.au>
 <20170801205054.17c8579f@canb.auug.org.au>
 <00BCCF64-C319-44F0-992B-7F78D4676B5E@cs.rutgers.edu>
 <FB1FCBDA-1F7A-40C4-9415-3E6495B0B809@cs.rutgers.edu>
 <20170802154554.2fe6515b@canb.auug.org.au>
 <20170802163137.064ba4bf@canb.auug.org.au>
 <20170907152355.16f4490a@canb.auug.org.au>
 <20170907004612.4ac130b0e89daaa0e51b2f40@linux-foundation.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary="=_MailMate_B074109F-09B9-433B-9F11-EDEBAD2F64A8_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170907004612.4ac130b0e89daaa0e51b2f40@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 3156 and 4880).

--=_MailMate_B074109F-09B9-433B-9F11-EDEBAD2F64A8_=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7 Sep 2017, at 3:46, Andrew Morton wrote:

> On Thu, 7 Sep 2017 15:23:55 +1000 Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote:
>
>> Hi all,
>>
>> On Wed, 2 Aug 2017 16:31:45 +1000 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>>>
>>> On Wed, 2 Aug 2017 15:45:54 +1000 Stephen Rothwell <sfr@canb.auug.org=
=2Eau> wrote:
>>>>
>>>> On Tue, 01 Aug 2017 09:08:01 -0400 "Zi Yan" <zi.yan@cs.rutgers.edu> =
wrote:
>>>>>
>>>>> I found two possible fixes.
>>>>>
>>>>> 1. This uses C++ zero initializer, GCC is OK with it.
>>>>> I tested with GCC 4.9.3 (has the initialization bug) and GCC 6.4.0.=

>>>>>
>>>>> --- a/include/linux/swapops.h~a
>>>>> +++ a/include/linux/swapops.h
>>>>> @@ -217,7 +217,7 @@ static inline swp_entry_t pmd_to_swp_ent
>>>>>
>>>>>  static inline pmd_t swp_entry_to_pmd(swp_entry_t entry)
>>>>>  {
>>>>> -	return (pmd_t){ 0 };
>>>>> +	return (pmd_t){};
>>>>>  }
>>>>
>>>> I have done that for today ... please decide which is best (or find
>>>> something better - maybe every platform really needs to have a __pmd=
()
>>>> definition) and submit a real fix patch to Andrew.
>>>
>>> OK, that failed for my compiler (gcc 5.2.0) like this:
>>>
>>> In file included from mm/vmscan.c:55:0:
>>> include/linux/swapops.h: In function 'swp_entry_to_pmd':
>>> include/linux/swapops.h:226:16: error: empty scalar initializer
>>>   return (pmd_t){};
>>>                 ^
>>> include/linux/swapops.h:226:16: note: (near initialization for '(anon=
ymous)')
>>
>> This has reappeared today :-( (for the arm multi_v7_defconfig build at=

>> least)
>>
>>> So I used the other idea (on top of Andrew's current tree):
>>
>> The fix patch now looks like this:
>>
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date: Wed, 2 Aug 2017 15:55:02 +1000
>> Subject: [PATCH] mm-thp-enable-thp-migration-in-generic-path-fix-fix
>>
>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> ---
>>  include/linux/swapops.h | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/linux/swapops.h b/include/linux/swapops.h
>> index 45b092aa6419..61cffa148a79 100644
>> --- a/include/linux/swapops.h
>> +++ b/include/linux/swapops.h
>> @@ -223,7 +223,9 @@ static inline swp_entry_t pmd_to_swp_entry(pmd_t p=
md)
>>
>>  static inline pmd_t swp_entry_to_pmd(swp_entry_t entry)
>>  {
>> -	return (pmd_t){};
>> +	pmd_t e;
>> +	memset(&e, 0, sizeof(pmd_t));
>> +	return e;
>>  }
>
> err, yeah.  I didn't want to add that one :(
>
> At the very least we should add a good comment explaining why we had to=

> resort to this.

Hi Andrew,

I think __pmd(0) can be used now. I fixed __pmd() in sparc32 at commit
9157259d16a8ee8116a98d32f29b797689327e8d, which is in 4.13 now.
I should have told you this earlier, sorry about that.

Just wonder if any other reason prevents us using __pmd().

Thanks.

=E2=80=94
Best Regards,
Yan Zi

--=_MailMate_B074109F-09B9-433B-9F11-EDEBAD2F64A8_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename=signature.asc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQEcBAEBCgAGBQJZsSZ9AAoJEEGLLxGcTqbMDA0IAIWYMLCrnTEWd+DcpdCi++wx
kxbRSAQ4pJbsCHqHa9nSO6J58XtHXPE9cgMQMoWrOafTZnOCHR6k3pcpNRKrE6S7
Wq/FsiHvHsBlCy51V77U1l5gldwOkKEExxFSzjnOBNW9JPQYON5yDYsfMLSDL0+j
v4VqCZUAKTv9saaXq1n/K3ibD6Pf3t4865b2YyoHLHL2Oi92G5ZLKA1K75D/tKKZ
mmyn9wlaYsI14X43KIijIjP3XueLTNSUQ1FprilZWq7NGm9+4XAQr9pgz+ZZYpst
pUTzlApXywFch1i6hYwm0fTMuSV1mmLOkn9EytCSO9EXCDDBcxqxsjYcycNrQEw=
=4JXz
-----END PGP SIGNATURE-----

--=_MailMate_B074109F-09B9-433B-9F11-EDEBAD2F64A8_=--
