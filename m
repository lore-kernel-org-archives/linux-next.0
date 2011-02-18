From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: build failure after merge of the workqueues tree
Date: Fri, 18 Feb 2011 10:07:25 +0100
Message-ID: <20110218090725.GA21209@htj.dyndns.org>
References: <20110218145747.f4b26b91.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110218145747.f4b26b91.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>
List-Id: linux-next.vger.kernel.org

Hello,

On Fri, Feb 18, 2011 at 02:57:47PM +1100, Stephen Rothwell wrote:
> drivers/input/input-polldev.c: In function 'input_polldev_init':
> drivers/input/input-polldev.c:259: error: 'WQ_FREEZEABLE' undeclared (first use in this function)
> 
> Caused by commit 58a69cb47ec6991bf006a3e5d202e8571b0327a4 ("workqueue,
> freezer: unify spelling of 'freeze' + 'able' to 'freezable'") interacting
> with commit 8fb3f6f6bf6e17e97712d216f230ba05f2e88ed8 ("Input:
> input-polldev - create workqueue upfront") from the input tree.
> 
> I applied the following fix up patch (and can carry it as necessary):

Yeah, looks good to me.  I already sent pull request for the rename to
Linus so once it gets pulled, Dmitry should be able to pull in the
mainline and resolve the conflict there.

Thank you.

-- 
tejun
