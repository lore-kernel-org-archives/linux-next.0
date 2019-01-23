From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the opp tree
Date: Wed, 23 Jan 2019 20:21:26 +0530
Message-ID: <20190123145126.6nttyqr5obe7ljwl@vireshk-i7>
References: <20190124014410.5f932c52@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190124014410.5f932c52@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-next.vger.kernel.org

On 24-01-19, 01:44, Stephen Rothwell wrote:
> Hi Viresh,
> 
> Commit
> 
>   9389d5c08571 ("opp: no need to check return value of debugfs_create functions")
> 
> is missing a Signed-off-by from its committer.

Fixed, thanks. My regular script wasn't working while applying the
patch and had to apply by hand and forgot my sign-off :(

-- 
viresh
