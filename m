From: Christoph Lameter <cl@linux.com>
Subject: Re: linux-next: build failure after merge of the final tree (slab
 tree related)
Date: Tue, 24 Aug 2010 12:59:48 -0500 (CDT)
Message-ID: <alpine.DEB.2.00.1008241256280.4763@router.home>
References: <20100824120714.8918f8de.sfr@canb.auug.org.au> <4C740450.3030000@cs.helsinki.fi>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4C740450.3030000@cs.helsinki.fi>
Sender: linux-kernel-owner@vger.kernel.org
To: Pekka Enberg <penberg@cs.helsinki.fi>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, 24 Aug 2010, Pekka Enberg wrote:

> Thanks for the report. The problem should be fixed by this commit:

Its not that easy. __alloc_percpu falls back to kzalloc() on UP and this
can result in unique bootstrap problems with UP since the bootstrap array
is no longer there. Does the UP kernel boot?

Why did this ever build on my UP configuration tests? Hmmm... I only
tested x86_64 UP. This was 32 bit UP I guess.
