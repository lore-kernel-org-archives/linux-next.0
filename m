From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 10/17] wireless: update gfp/slab.h includes
Date: Wed, 19 May 2010 17:46:17 +0200
Message-ID: <4BF407C9.2020202@kernel.org>
References: <1269885165-18617-1-git-send-email-tj@kernel.org>	<1269885165-18617-11-git-send-email-tj@kernel.org>	<20100519190230.52385a65.sfr@canb.auug.org.au>	<20100519144505.GD2412@tuxdriver.com> <20100520012829.709931dc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100520012829.709931dc.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
List-Id: linux-next.vger.kernel.org

Hello, John, Stephen.

On 05/19/2010 05:28 PM, Stephen Rothwell wrote:
>> Looks like this was part of a series...who merged the rest of it?
>> I guess I presumed they would take care of the series.

Most of the series have been applied circa 2.6.34-rc4.  Stephen has
been carrying patches for branches which weren't yet in mainline.
IOW, these patches are necessary for a branch to be merged into
mainline.

> It was a series of patches that were only relevant to the trees in
> linux-next (for a change that happened in Linus' tree).  My hope (and I
> assume Tejun's) was that each maintainer would take the patch relevant to
> their tree (some did - I just checked I still have 10 of them being
> applied to linux-next :-().

Yeap, I hoped that more of them would sort themselves out during devel
cycle, but I guess rc1 window isn't too bad.

Thank you.

-- 
tejun
