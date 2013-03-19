From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: manual merge of the workqueues tree with Linus' tree
Date: Tue, 19 Mar 2013 15:13:08 -0700
Message-ID: <20130319221308.GS3042@htj.dyndns.org>
References: <20130319131938.73dd0f1233c8aba41742aded@canb.auug.org.au>
 <20130319211233.GN3042@htj.dyndns.org>
 <20130320090540.81c687d28ffe3a6abe905816@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130320090540.81c687d28ffe3a6abe905816@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Wed, Mar 20, 2013 at 09:05:40AM +1100, Stephen Rothwell wrote:
> > Anyways, I pulled master into wq/for-next and resolved it there, so it
> > shouldn't cause you any more trouble.
> 
> Ah, OK, thanks.   One small point, when you do a back merge like that,
> you should always put an explanation in the commit message for the merge.

Oh, I do that for any permanent branches.  for-next branches are
ephemeral (at least in my trees) so I usually don't bother.  I do
compare against for-next when and after sending pull requests with
proper conflict descriptions, so things are not likely to slip through
there.  Hmmm.... if it's gonna be helpful to you, I'd be happy to
describe merge conflicts and resolutions in for-next merges.  Would
that be helpful?

Thanks.

-- 
tejun
