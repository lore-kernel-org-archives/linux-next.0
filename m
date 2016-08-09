From: Leon Romanovsky <leon@kernel.org>
Subject: Re: linux-next: build failure after merge of Linus' tree
Date: Tue, 9 Aug 2016 11:54:12 +0300
Message-ID: <CALq1K=JszAx8T1oUqhOoEFbHhh0pqWAi2oN-tMdgws2iXdsZeQ@mail.gmail.com>
References: <20160808115827.6dd7fa6f@canb.auug.org.au> <6a554a80-c3ed-1902-14d1-f1e03adbed49@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:42008 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932231AbcHIIyf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Aug 2016 04:54:35 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id 3F6F720306
	for <linux-next@vger.kernel.org>; Tue,  9 Aug 2016 08:54:34 +0000 (UTC)
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com [209.85.161.169])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 43E50202E5
	for <linux-next@vger.kernel.org>; Tue,  9 Aug 2016 08:54:33 +0000 (UTC)
Received: by mail-yw0-f169.google.com with SMTP id u134so3361534ywg.3
        for <linux-next@vger.kernel.org>; Tue, 09 Aug 2016 01:54:33 -0700 (PDT)
In-Reply-To: <6a554a80-c3ed-1902-14d1-f1e03adbed49@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Ledford <dledford@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Moni Shoua <monis@mellanox.com>, Kamal Heib <kamalh@mellanox.com>, Amir Vadai <amirv@mellanox.com>, Haggai Eran <haggaie@mellanox.com>, Leon Romanovsky <leon@kernel.org>

On Mon, Aug 8, 2016 at 6:37 PM, Doug Ledford <dledford@redhat.com> wrote:
> On 8/7/2016 9:58 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> With Linus' tree, today's linux-next build (powerpc allyesconfig) failed
>> like this:
>>
>> drivers/infiniband/sw/built-in.o:(.opd+0x1698): multiple definition of `copy_data'
>> drivers/infiniband/hw/built-in.o:(.opd+0xe5f8): first defined here
>> drivers/infiniband/sw/built-in.o:(.opd+0x1320): multiple definition of `rxe_av_from_attr'
>> drivers/infiniband/hw/built-in.o:(.opd+0xe280): first defined here
>
> This looks very suspicious.  I think you are picking up two copies of
> the rxe code.  One from Linus tree and one from probably Leon's tree.
> The thing is, the rxe driver is an entirely software RoCE driver.  So,
> after I picked it up, I moved it from drivers/infiniband/hw to
> drivers/infiniband/sw where it more correctly belongs.  Leon's tree
> doesn't have that move, and since you pull Leon's tree into your -next
> process, with the allyesconfig you are trying to build two copies of it
> and put them both statically into the kernel, hence all of the double
> definitions.  Leon needs to drop his copy of the rxe driver and let the
> one in Linus' tree be the only one in existence.

Doug,
Just to be clear on this point and on my flow.
I'm resetting my ->next branches on the same day of your email
announcement of acceptance.

Thanks
