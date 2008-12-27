From: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Subject: Re: [PATCH] perf_counter: more barrier in blank weak function
Date: Sat, 27 Dec 2008 15:07:06 +0900 (JST)
Message-ID: <20081227150534.F472.KOSAKI.MOTOHIRO@jp.fujitsu.com>
References: <20081226102716.GA31450@uranus.ravnborg.org> <4955B782.3030407@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752842AbYL0GH2@vger.kernel.org>
In-Reply-To: <4955B782.3030407@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Yinghai Lu <yinghai@kernel.org>
Cc: kosaki.motohiro@jp.fujitsu.com, Sam Ravnborg <sam@ravnborg.org>, David Howells <dhowells@redhat.com>, mingo@elte.hu, Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, mel@csn.ul.ie
List-Id: linux-next.vger.kernel.org

> 
> Impact: fix panic possible panic etc
> 
> some compiler seems to inline the weak global function if no line in it
> 
> Signed-off-by: Yinghai Lu <yinghai@kernel.org>
> 
> diff --git a/kernel/perf_counter.c b/kernel/perf_counter.c
> index d7a79f3..37f7716 100644
> --- a/kernel/perf_counter.c
> +++ b/kernel/perf_counter.c
> @@ -45,8 +45,8 @@ hw_perf_counter_init(struct perf_counter *counter)
>  }
>  
>  u64 __weak hw_perf_save_disable(void)		{ return 0; }
> -void __weak hw_perf_restore(u64 ctrl)		{ }
> -void __weak hw_perf_counter_setup(void)		{ }
> +void __weak hw_perf_restore(u64 ctrl)		{ barrier(); }
> +void __weak hw_perf_counter_setup(void)		{ barrier(); }

We need comment into the function.
I expect anyone think "hm, this barrier() is meaningless. let's cleanup." in the future.
we should avoid it.
