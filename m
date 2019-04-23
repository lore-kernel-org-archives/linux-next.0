From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: mmotm 2019-04-19-14-53 uploaded (objtool)
Date: Tue, 23 Apr 2019 09:19:50 -0700
Message-ID: <CAHk-=wg_yKXPmkTcHWPsf61BXNLzz9bEUDWboN4QfeHKZsCoXA@mail.gmail.com>
References: <20190419215358.WMVFXV3bT%akpm@linux-foundation.org>
 <af3819b4-008f-171e-e721-a9a20f85d8d1@infradead.org> <20190423082448.GY11158@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190423082448.GY11158@hirez.programming.kicks-ass.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Mark Brown <broonie@kernel.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, linux-next@vger.kernel.org, mhocko@suse.cz, mm-commits@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Josh Poimboeuf <jpoimboe@redhat.com>, Andy Lutomirski <luto@kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 23, 2019 at 1:25 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> Now, we could of course allow this symbol, but I found only the below
> was required to make allyesconfig build without issue.
>
> Andy, Linus?

Ack on that patch. Except I think the uaccess.h part should be a
separate commit: I think it goes along with 2a418cf3f5f1
("x86/uaccess: Don't leak the AC flag into __put_user() value
evaluation") we did earlier. I think the logic is the same - it's not
just the _value_ that can have complex calculations, the address can
too (although admittedly that's really not supposed to be common, but
you clearly found one case where a complier misfeature made it happen,
so...).

I also wonder if we should just make "count" be "unsigned long" in
do_{strncpy_from,strnlen}_user() too, since we've already done

        if (unlikely(count <= 0))
                return 0;

in the caller, so it *is* unsigned by then, and we'd not be mixing
signedness when comparing "max/count/res".

                   Linus
