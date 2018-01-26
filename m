From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: mmotm 2018-01-25-16-20 uploaded
Date: Fri, 26 Jan 2018 13:18:37 +1100
Message-ID: <20180126131837.232ddd26@canb.auug.org.au>
References: <5a6a748d.knotXn2H0hp7I43s%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5a6a748d.knotXn2H0hp7I43s%akpm@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org
Cc: mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, mhocko@suse.cz, broonie@kernel.org
List-Id: linux-next.vger.kernel.org

Hi Andrew,

On Thu, 25 Jan 2018 16:21:33 -0800 akpm@linux-foundation.org wrote:
>
> * include-linux-mtd-rawnandh-fix-build-with-gcc-444.patch

This one clashed with a similar (but not identical) commit in another
tree, so I dropped it.

> * net-sched-sch_prioc-work-around-gcc-444-union-initializer-issues.patch

This patch turned up in another tree, so I dropped it as well.

-- 
Cheers,
Stephen Rothwell
