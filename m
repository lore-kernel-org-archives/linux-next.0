From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: the cgroup tree has an unnecessary merge
Date: Tue, 17 Jun 2014 18:51:59 -0400
Message-ID: <20140617225159.GA8838@mtj.dyndns.org>
References: <20140618084921.07c3b391@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140618084921.07c3b391@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hello, Stephen.

On Wed, Jun 18, 2014 at 08:49:21AM +1000, Stephen Rothwell wrote:
> The cgroup tree has a merge of 963649d735c8 and c731ae1d0f02 both of
> which are already merged into v3.16-rc1.  Why did you just not use
> v3.16-rc1 itself (or the point where Linus merged your tree) (and then
> add the other commit on top?  That would have removed any chance that
> you resolved the merged differently to how it was resolved in Linus'
> tree (I don't know if there is a difference, but I have had conflicts
> from different merge resolutions in the past).

Oops, my mistake.  Reset to for-3.16-fixes.

Thanks.

-- 
tejun
