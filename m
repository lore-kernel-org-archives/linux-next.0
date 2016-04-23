From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [linux-next PATCH] sched: cgroup: enable interrupt before
 calling threadgroup_change_begin
Date: Sat, 23 Apr 2016 11:14:47 +0200
Message-ID: <20160423091447.GA3430@twins.programming.kicks-ass.net>
References: <1461383788-15102-1-git-send-email-yang.shi@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461383788-15102-1-git-send-email-yang.shi@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Yang Shi <yang.shi@linaro.org>
Cc: tj@kernel.org, mingo@redhat.com, lizefan@huawei.com, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, linaro-kernel@lists.linaro.org
List-Id: linux-next.vger.kernel.org

On Fri, Apr 22, 2016 at 08:56:28PM -0700, Yang Shi wrote:
> When kernel oops happens in some kernel thread, i.e. kcompactd in the test,
> the below bug might be triggered by the oops handler:

What are you trying to fix? You already oopsed the thing is wrecked.
