From: Hans-Peter Nilsson <hans-peter.nilsson@axis.com>
Subject: Re: crisv32 runtime failure in -next due to 'page-flags: define
 behavior SL*B-related flags on compound pages'
Date: Tue, 22 Sep 2015 14:50:19 +0200
Message-ID: <201509221250.t8MCoJLP014241@ignucius.se.axis.com>
References: <5023113A-80F3-4C3A-AF50-6B08134A070F@axis.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <5023113A-80F3-4C3A-AF50-6B08134A070F@axis.com> (message from
	Mikael Starvik on Tue, 22 Sep 2015 14:19:38 +0200)
Sender: linux-kernel-owner@vger.kernel.org
To: kirill@shutemov.name
Cc: starvik@axis.com, linux@roeck-us.net, paulmck@linux.vnet.ibm.comstarvik@axis.com, jespern@axis.com, hughd@google.com, kirill.shutemov@linux.intel.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, minchan@kernel.org, linux-cris-kernel@axis.com
List-Id: linux-next.vger.kernel.org

> From: Mikael Starvik <mikael.starvik@axis.com>
> Date: Tue, 22 Sep 2015 14:19:38 +0200

> For cris it is completely valid to do that.

Correct, just as it's completely valid for any system to specify
an ABI that says that structures are laid out "packed" by
default.

> It has been an
> issue before. If you for some reason really require dword
> alignment there should be an align in the struct.

Yep.

> CC:ing the compiler guy for further comments.

I have no new information.

> > 22 sep 2015 kl. 14:03 skrev Kirill A. Shutemov <kirill@shutemov.name>:

> > Kinda. It's false positive PageTail() due low bit set in
> > page->rcu_head.next.
> > 
> > It happens (at least) due broken alignment of 'rcu' field within
> > task_struct -- offsetof(struct task_struct, rcu): 773.
> > 
> > That's looks veery broken. I would guess compiler does something horribly
> > wrong. I hope it's not an ABI issue. :-/

It is an ABI issue, but I'm sure you can cope.  If you need to
imply something you have to provide something.  If not, I'd say
the term "horrible" would fit hackish assumptions of the failing
code (and related code that works by happenstance).

That element (the struct) needs *explicit* padding or alignment
to the required multiplicity of bytes for anyone to portably be
able to imply something other than "byte alignment" for the
layout of it, as elements of an array, across systems.  Use
dummy elements or a compiler construct like __attribute__
((__aligned__ (...))) per kernel policy or taste.  I'd recommend
specifying the alignment, so TRT will happen for it when it in
turn is an element of an otherwise unpadded struct.

(I assume all applicable allocators provide "natural" alignment
of, say, sizeof (long)) or that'll be a separate issue.)

brgds, H-P
