From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: linux-next: Fixes tag needs some work in the cpufreq-arm tree
Date: Fri, 18 Jan 2019 11:08:02 +0530
Message-ID: <20190118053802.rm7fc5z7wk3agc2f@vireshk-i7>
References: <20190118163307.03bd6710@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190118163307.03bd6710@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
List-Id: linux-next.vger.kernel.org

On 18-01-19, 16:33, Stephen Rothwell wrote:
> Hi Viresh,
> 
> In commit
> 
>   3ca12c96ef5e ("MAINTAINERS: use common indentation")
> 
> Fixes tag
> 
>   Fixes: 46e2856b8e188949757c9123fd7f9ce36edd1a52
> 
> Fixes tags should be in this format:
> 
>   Fixes: 46e2856b8e18 ("cpufreq: Add Kryo CPU scaling driver")

Fixed and pushed again.

I missed looking into that. You must be running some sort of sanity
checks on the branch itself, can I know what exactly are you doing so
that I can try the same.

-- 
viresh
