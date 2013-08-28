From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: status of the memblock tree
Date: Wed, 28 Aug 2013 08:28:09 -0400
Message-ID: <20130828122809.GC18348@mtj.dyndns.org>
References: <20130828163459.3eb7fc0d7ae531494f605831@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130828163459.3eb7fc0d7ae531494f605831@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hey, Stephen.

On Wed, Aug 28, 2013 at 04:34:59PM +1000, Stephen Rothwell wrote:
> I was wondering if the memblock tree needs to exist any more.  The last
> commit to it was in December 2011 and was merged into Linus' tree during
> the v3.3 merge window.

After the rewrite was complete, the tree was never used.  I think it
can be put to rest now.  Ingo is routing all memblock changes now.

Thanks.

-- 
tejun
