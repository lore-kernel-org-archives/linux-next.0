From: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: next-20160208 perf build =?utf-8?Q?err?=
 =?utf-8?Q?or_=22tests=2Fbp=5Fsignal=2Ec=3A106=3A47=3A_error=3A_declaratio?=
 =?utf-8?Q?n_of_=E2=80=98signal?= =?utf-8?B?4oCZ?= shadows a global
 declaration [-Werror=shadow]"
Date: Fri, 12 Feb 2016 18:40:36 -0300
Message-ID: <20160212214036.GE16005@kernel.org>
References: <CACKvgLFaZagkvRk1R2Xy0=UbWcfELgLxPbfjhRNZj-Rg4jSz4w@mail.gmail.com>
 <20160211222121.GK32168@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:35128 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750816AbcBLVkk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 12 Feb 2016 16:40:40 -0500
Content-Disposition: inline
In-Reply-To: <20160211222121.GK32168@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vinson Lee <vlee@freedesktop.org>
Cc: linux-next@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Wang Nan <wangnan0@huawei.com>, Jiri Olsa <jolsa@kernel.org>

Em Thu, Feb 11, 2016 at 07:21:21PM -0300, Arnaldo Carvalho de Melo escreveu:
> Em Mon, Feb 08, 2016 at 10:28:53AM -0800, Vinson Lee escreveu:
> > I hit this perf build error with next-20160208 with GCC 4.6.
 
> I try to test on a rhel6 vm from time to time, need to do it using
> docker or something, thanks for the report, but can you please send a
> proper patch, with a:
> 
> Fixes: 6a7d550e8b2e ("perf test: Check environment before start real BPF test")
> 
> Line, signed-off, etc?

Do it next time please, I did this time, when testing other changes on
my rhel6.7 vm, its in my perf/core branch,

Thanks,

- arnaldo
