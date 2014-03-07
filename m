From: Christoph Lameter <cl@linux.com>
Subject: Re: [PATCH -next] slub: Replace __this_cpu_inc usage w/ SLUB_STATS
Date: Fri, 7 Mar 2014 11:09:34 -0600 (CST)
Message-ID: <alpine.DEB.2.10.1403071108310.21846@nuc>
References: <20140306194821.3715d0b6212cc10415374a68@canb.auug.org.au> <20140306155316.GG18529@joshc.qualcomm.com> <20140306182941.GH18529@joshc.qualcomm.com>
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20140306182941.GH18529@joshc.qualcomm.com>
Sender: owner-linux-mm@kvack.org
To: Josh Cartwright <joshc@codeaurora.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pekka Enberg <penberg@kernel.org>, Matt Mackall <mpm@selenic.com>, linux-mm@kvack.org
List-Id: linux-next.vger.kernel.org

On Thu, 6 Mar 2014, Josh Cartwright wrote:

> Although, I'm wondering how exact these statistics need to be.  Is
> making them preemption safe even a concern?

Not sure about that. You solution makes it preempt safe. If is can be
tolerated that its racy then raw_cpu_inc() could be used.

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
