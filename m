From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Thu, 8 Dec 2016 07:32:03 +1100
Message-ID: <20161208073203.45b5085a@canb.auug.org.au>
References: <20161207123711.795d97bb@canb.auug.org.au>
        <20161207074514.GA10616@gmail.com>
        <20161207081215.GA13808@krava>
        <20161207144935.GH8257@kernel.org>
        <20161207185632.GA24040@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54091 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753265AbcLGUlu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Dec 2016 15:41:50 -0500
In-Reply-To: <20161207185632.GA24040@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@redhat.com>, Arnaldo Carvalho de Melo <acme@infradead.org>, Peter Foley <pefoley2@pefoley.com>, Wang Nan <wangnan0@huawei.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi all,

On Wed, 7 Dec 2016 19:56:32 +0100 Ingo Molnar <mingo@kernel.org> wrote:
>
> * Arnaldo Carvalho de Melo <acme@kernel.org> wrote:
> 
> > I'll push it today, will stop processing other stuff now and prepare a
> > pull request,  
> 
> Thanks - I pushed the fixes towards linux-next, so tomorrow's (today's) linux-next 
> build should not trigger this build race.

Thanks for the quick response.

-- 
Cheers,
Stephen Rothwell
