From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: manual merge of the percpu tree with the net tree
Date: Wed, 03 Feb 2010 15:20:39 +0900
Message-ID: <4B6915B7.4080806@kernel.org>
References: <20100203163803.820597d1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20100203163803.820597d1.sfr@canb.auug.org.au>
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, David Miller <davem@davemloft.net>, netdev@vger.kernel.org, Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

Hello,

On 02/03/2010 02:38 PM, Stephen Rothwell wrote:
> Today's linux-next merge of the percpu tree got a conflict in
> net/ipv6/proc.c between commit 5833929cc2ad2b3064b4fac8c44e293972d240d8
> ("net: constify MIB name tables") from the net tree and commit
> d3f5fa4075414c7754126fbdc7c8fbd3906db7c8 ("percpu: add __percpu sparse
> annotations to net") from the percpu tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.
> 
> Maybe you guys could send Linus a simple one line patch for v2.6.33 that
> adds
> 
> #define __percpu
> 
> to include/linux/compiler.h (unconditionally) and then farm out the
> patches that add the __percpu annotations to other maintainers.

How about just adding dummy #define __percpu in each tree?  I don't
think git will have much problem merging them.

-- 
tejun
