From: Chris Mason <clm@fb.com>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Date: Mon, 19 Jan 2015 10:50:11 -0500
Message-ID: <1421682611.25503.0@mail.thefacebook.com>
References: <20150119184559.0157fa2e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:9519 "EHLO
	mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751430AbbASPuX (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 19 Jan 2015 10:50:23 -0500
In-Reply-To: <20150119184559.0157fa2e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org



On Mon, Jan 19, 2015 at 2:45 AM, Stephen Rothwell 
<sfr@canb.auug.org.au> wrote:
> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> fs/eventfd.c: In function 'eventfd_poll':
> fs/eventfd.c:121:16: warning: unused variable 'flags' 
> [-Wunused-variable]
>   unsigned long flags;
>                 ^
> 
> Introduced by commit a90de8a54127 ("eventfd: don't take the spinlock 
> in
> eventfd_poll").


Whoops, I'll send a v2.

-chris
