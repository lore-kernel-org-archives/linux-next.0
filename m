From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm64-fixes
 tree
Date: Tue, 19 Mar 2019 14:51:11 +0000
Message-ID: <20190319145111.GH59586@arrakis.emea.arm.com>
References: <20190320014312.562c8f6d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190320014312.562c8f6d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Will Deacon <will.deacon@arm.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Okamoto, Takayuki" <tokamoto@jp.fujitsu.com>, Zhang Lei <zhang.lei@jp.fujitsu.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Wed, Mar 20, 2019 at 01:43:12AM +1100, Stephen Rothwell wrote:
> Commit
> 
>   a4d17a19c493 ("arm64: apply workaround on A64FX v1r0")
> 
> is missing a Signed-off-by from its author.

Thanks for this. The patch is indeed confusing, sent by Takayuki with a
signed-off-by from Zhang and re-written by Mark while keeping the
original text.

I'm going to make Mark the author while keeping Takayuki as reported-by.

-- 
Catalin
