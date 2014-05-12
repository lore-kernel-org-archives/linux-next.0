From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: [PATCH] compiler.h: don't use temporary variable in
 __compiletime_assert()
Date: Mon, 12 May 2014 16:38:01 +0200
Message-ID: <1399905481.4337.16.camel@jlt4.sipsolutions.net>
References: <1399530685-7749-1-git-send-email-johannes@sipsolutions.net>
	 <5370CFAC.40705@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5370CFAC.40705@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: James Hogan <james.hogan@imgtec.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Daniel Santos <daniel.santos@pobox.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, linux-next <linux-next@vger.kernel.org>, linux-metag <linux-metag@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi,

> Unfortunately this breaks the build of today's linux-next for the Met=
a
> architecture (arch/metag), which happens to use a fairly old compiler
> (based on gcc 4.2.4) which I presume is the reason why.

That's very odd.

Unfortunately, I don't have most of arch/metag, it seems, where could I
get it? In particular no gup.c exists for metag in Linus's current tree=
=2E

> A bunch of compile time asserts fail, even in code which should be
> optimised out. E.g. here's one which I analysed:
>=20
> mm/gup.c: In function =E2=80=98follow_page_mask=E2=80=99:
> mm/gup.c:208: error: size of array =E2=80=98type name=E2=80=99 is neg=
ative
>=20
> Line 208 uses HPAGE_PMD_NR which expands to a HPAGE_PMD_SHIFT, which
> expands to a BUILD_BUG(). However that line is inside an if block
> conditioned on pmd_trans_huge(*pmd) which include/asm-generic/pgtable=
=2Eh
> defines inline to return 0, so the whole block should already be bein=
g
> optimised out.
>=20
> I don't understand why your patch should break things, I suspect it's
> related to the sparse behaviour you're trying to work around, but can=
 we
> please drop this patch until a more portable workaround can be found?
> I'm happy to test further patches with metag if it helps.

I don't really understand that either - if the compiler could prove tha=
t
the assignment to __cond was a constant, and remember that __cond is no=
w
constant, I don't really see why it can't follow that through and
consider "!(condition)" a const??

I suppose the other option for the original problem is to ignore
_compiletime_assert() for sparse, like we do for BUG_ON(), but it'd
probably be good to analyse more why this particular code is broken now=
=2E

johannes
