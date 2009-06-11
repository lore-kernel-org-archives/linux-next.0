From: Yinghai Lu <yhlu.kernel@gmail.com>
Subject: Re: [PATCH] x86: memtest: fix compile warning
Date: Thu, 11 Jun 2009 10:19:28 -0700
Message-ID: <86802c440906111019o5829933fnfffcea5cd0e3c862@mail.gmail.com>
References: <20090611112746.802a24cb.sfr@canb.auug.org.au>
	 <20090611102927.GE12431@alberich.amd.com>
	 <alpine.LFD.2.00.0906111512400.3372@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gx0-f214.google.com ([209.85.217.214]:51044 "EHLO
	mail-gx0-f214.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751042AbZFKRT1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 11 Jun 2009 13:19:27 -0400
In-Reply-To: <alpine.LFD.2.00.0906111512400.3372@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Andreas Herrmann <andreas.herrmann3@amd.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jun 11, 2009 at 7:21 AM, Thomas Gleixner<tglx@linutronix.de> wr=
ote:
> On Thu, 11 Jun 2009, Andreas Herrmann wrote:
>
>> Commit c9690998ef48ffefeccb91c70a7739eebdea57f9
>> (x86: memtest: remove 64-bit division) introduced following compile =
warning:
>>
>> =A0arch/x86/mm/memtest.c: In function 'memtest':
>> =A0arch/x86/mm/memtest.c:56: warning: comparison of distinct pointer=
 types lacks a cast
>> =A0arch/x86/mm/memtest.c:58: warning: comparison of distinct pointer=
 types lacks a cast
>>
>> Signed-off-by: Andreas Herrmann <andreas.herrmann3@amd.com>
>> ---
>> =A0arch/x86/mm/memtest.c | =A0 =A04 ++--
>> =A01 files changed, 2 insertions(+), 2 deletions(-)
>>
>> Sorry.
>> Please apply.
>
> I applied it already, but zapped it right away, as it is bad style to
> do the type casting in the loops. The proper fix is below.
>
> But aside of that this code is confusing.
>
> =A0 =A0 =A0 =A0start_phys_aligned =3D ALIGN(start_phys, incr);
>
> Why do we have to fiddle with the alignment. Are you really seing e82=
0
> entries which are not 8 byte aligned ?
>
> =A0 =A0 =A0 =A0for (p =3D start; p < end; p++, start_phys_aligned +=3D=
 incr) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (*p =3D=3D pattern)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0continue;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (start_phys_aligned =3D=3D last_bad=
 + incr) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0last_bad +=3D incr;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0continue;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (start_bad)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reserve_bad_mem(patter=
n, start_bad, last_bad + incr);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0start_bad =3D last_bad =3D start_phys_=
aligned;
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0if (start_bad)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reserve_bad_mem(pattern, start_bad, la=
st_bad + incr);
>
> I really had to look more than once to understand what the heck
> start_phys_aligned and last_bad + incr are doing. Really non
> intuitive.
>
> But the reserve_bad_mem() semantics are even more scary:
>
> - if you hit flaky memory, which gives you bad and good results here
> =A0and there, you call reserve_bad_mem() totally unbound which is
> =A0likely to overflow the early reservation space and panics the
> =A0machine. You need to keep track of those events somehow (e.g. in a
> =A0bitmap) so you can detect such problems and mark the whole affecte=
d
> =A0region bad in one go.
if one pass found bad, it is reserved.
second pass will use find_e820_area_size() to get new range, so bad
one will not be used.
>
> - you call reserve_early() which calls __reserve_early(....,
> =A0overrun_ok =3D 0) so if you do the default multi pattern scan and =
each
> =A0run sees the same region of broken memory you will trigger the
> =A0"Overlapping early reservations" panic in __reserve_early() when y=
ou
> =A0reserve that region the second time. Why do you run the test twice
> =A0when the first one failed already ? Also there is no need to do th=
e
> =A0wipeout run in that case, which will trigger it as well!

current problem in that: we could run out of res_reserve array.
solution will be make res_reserve array dynamically.
  when can not find slot, need use find_e820_area to get double sized,
and copy the old to new one.
  then free the old one.

YH
