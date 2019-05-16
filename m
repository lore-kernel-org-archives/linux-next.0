From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: manual merge of the ftrace tree with Linus' tree
Date: Wed, 15 May 2019 21:53:05 -0400
Message-ID: <20190515215305.78e8ef4c@oasis.local.home>
References: <20190516110548.0d22d048@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190516110548.0d22d048@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Thu, 16 May 2019 11:05:48 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the ftrace tree got a conflict in:
> 
>   include/linux/compiler.h
> 
> between commit:
> 
>   37686b1353cf ("tracing: Improve "if" macro code generation")
> 
> from Linus' tree and commit:
> 
>   a15fd609ad53 ("tracing: Simplify "if" macro code")
> 
> from the ftrace tree.
> 
> I fixed it up (I just used the latter version) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
> 

Hi Stephen,

I mentioned this conflict and the entry_64.S one to Linus when
submitting my pull request. I fixed it up too in my ftrace/conflicts
branch.

Thanks!

-- Steve
