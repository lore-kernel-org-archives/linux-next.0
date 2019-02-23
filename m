From: Darren Hart <dvhart@infradead.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the drivers-x86
 tree
Date: Sat, 23 Feb 2019 09:10:58 -0800
Message-ID: <20190223171058.GA4722@wrath>
References: <20190224011925.6db87446@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190224011925.6db87446@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Sun, Feb 24, 2019 at 01:19:25AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   9bfe33ba29d0 ("x86/CPU: Add Icelake model number")
> 
> is missing a Signed-off-by from its committer.

Thanks for the catch. Andy, please check your commit scripts as should
definitely be automated in our workflow.

I have corrected it.
-- 
Darren Hart
VMware Open Source Technology Center
