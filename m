From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH] compiler.h: don't use temporary variable in __compiletime_assert()
Date: Mon, 12 May 2014 15:56:57 +0100
Message-ID: <5370E139.50806@imgtec.com>
References: <1399530685-7749-1-git-send-email-johannes@sipsolutions.net>	 <5370CFAC.40705@imgtec.com> <1399905481.4337.16.camel@jlt4.sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailapp01.imgtec.com ([195.59.15.196]:1936 "EHLO
	mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751310AbaELO5B (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 12 May 2014 10:57:01 -0400
In-Reply-To: <1399905481.4337.16.camel@jlt4.sipsolutions.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Daniel Santos <daniel.santos@pobox.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, linux-next <linux-next@vger.kernel.org>, linux-metag <linux-metag@vger.kernel.org>

Hi Johannes,

On 12/05/14 15:38, Johannes Berg wrote:
>> Unfortunately this breaks the build of today's linux-next for the Me=
ta
>> architecture (arch/metag), which happens to use a fairly old compile=
r
>> (based on gcc 4.2.4) which I presume is the reason why.
>=20
> That's very odd.
>=20
> Unfortunately, I don't have most of arch/metag, it seems, where could=
 I
> get it? In particular no gup.c exists for metag in Linus's current tr=
ee.

Hmm, mm/gup.c appears to be a new addition in linux-next from commit
3284cee59933 (mm: move get_user_pages()-related code to separate file)
so probably wasn't the best example.

My build output was from commit 0bed496ac091 (compiler.h: don't use
temporary variable in __compiletime_assert()) which is the first bad
commit according to a bisection of linux-next/stable..linux-next/master=
=2E

>> A bunch of compile time asserts fail, even in code which should be
>> optimised out. E.g. here's one which I analysed:
>>
>> mm/gup.c: In function =E2=80=98follow_page_mask=E2=80=99:
>> mm/gup.c:208: error: size of array =E2=80=98type name=E2=80=99 is ne=
gative
>>
>> Line 208 uses HPAGE_PMD_NR which expands to a HPAGE_PMD_SHIFT, which
>> expands to a BUILD_BUG(). However that line is inside an if block
>> conditioned on pmd_trans_huge(*pmd) which include/asm-generic/pgtabl=
e.h
>> defines inline to return 0, so the whole block should already be bei=
ng
>> optimised out.
>>
>> I don't understand why your patch should break things, I suspect it'=
s
>> related to the sparse behaviour you're trying to work around, but ca=
n we
>> please drop this patch until a more portable workaround can be found=
?
>> I'm happy to test further patches with metag if it helps.
>=20
> I don't really understand that either - if the compiler could prove t=
hat
> the assignment to __cond was a constant, and remember that __cond is =
now
> constant, I don't really see why it can't follow that through and
> consider "!(condition)" a const??
>=20
> I suppose the other option for the original problem is to ignore
> _compiletime_assert() for sparse, like we do for BUG_ON(), but it'd
> probably be good to analyse more why this particular code is broken n=
ow.

The first one I analysed was strange too (the fixmap.h one). It appears
that this particular assert was questionable anyway for metag which is
why I didn't mention it, the case above is much more clear cut.

Given an unsigned int idx argument the inline function fix_to_virt
basically did:
BUILD_BUG_ON(idx >=3D __end_of_fixed_addresses)

where __end_of_fixed_addresses is an enum value which is 0 when
CONFIG_HIGHMEM=3Dn. In that case it took your patch for the compiler to
apparently realise that an unsigned int is always >=3D 0, therefore the
BUILD_BUG_ON will always fire, even though nothing actually called
fix_to_virt from that source file so the code wasn't being used. I
briefly attempted to reproduce this issue on other arches with newer
compilers without success.

Cheers
James
