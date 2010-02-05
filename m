From: Ingo Molnar <mingo@elte.hu>
Subject: Re: upcoming percpu changes
Date: Fri, 5 Feb 2010 08:29:31 +0100
Message-ID: <20100205072931.GD9320@elte.hu>
References: <20100205161648.086375b9.sfr@canb.auug.org.au>
 <4B6BB13C.2090108@kernel.org>
 <20100205070903.GA9320@elte.hu>
 <4B6BC948.5030401@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4B6BC948.5030401@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, Fr??d??ric Weisbecker <fweisbec@gmail.com>
List-Id: linux-next.vger.kernel.org


* Tejun Heo <tj@kernel.org> wrote:

> Hello, Ingo.
> 
> On 02/05/2010 04:09 PM, Ingo Molnar wrote:
> > Has the review feedback from Frederic and hpa been addressed? (and have they 
> > acked the solution?) That was the only controversial bit i remember.
> 
> Al Viro said that, until sparse is improved, the only solution would be to 
> work around in the rather ugly way as posted in the original patches.  As 
> Frederic and hpa preferred not having the workaround and there were only 
> three instances in the kernel tree, I just left them alone so sparse 
> warning will trigger spuriously on those three locations.
> 
> Thanks.

Ok, good!

	Ingo
