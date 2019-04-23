From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: mmotm 2019-04-19-14-53 uploaded (objtool)
Date: Tue, 23 Apr 2019 19:35:37 +0200
Message-ID: <20190423173537.GI12232@hirez.programming.kicks-ass.net>
References: <20190419215358.WMVFXV3bT%akpm@linux-foundation.org>
 <af3819b4-008f-171e-e721-a9a20f85d8d1@infradead.org>
 <20190423082448.GY11158@hirez.programming.kicks-ass.net>
 <CAHk-=wg_yKXPmkTcHWPsf61BXNLzz9bEUDWboN4QfeHKZsCoXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHk-=wg_yKXPmkTcHWPsf61BXNLzz9bEUDWboN4QfeHKZsCoXA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Mark Brown <broonie@kernel.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, linux-next@vger.kernel.org, mhocko@suse.cz, mm-commits@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Josh Poimboeuf <jpoimboe@redhat.com>, Andy Lutomirski <luto@kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 23, 2019 at 09:19:50AM -0700, Linus Torvalds wrote:

> Ack on that patch. Except I think the uaccess.h part should be a
> separate commit: 

Of course, I'll go write proper patches.
