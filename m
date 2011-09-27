From: Vaibhav Nagarnaik <vnagarnaik@google.com>
Subject: Re: linux-next: manual merge of the akpm tree with the tree
Date: Tue, 27 Sep 2011 09:52:27 -0700
Message-ID: <CAL26m8JbvOi05irJdhtsas2=PWdy4V+hkTYHp029RAvDGnUZgA@mail.gmail.com>
References: <20110927165920.14b00e8595d10135d2a4397a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp-out.google.com ([216.239.44.51]:3540 "EHLO
	smtp-out.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751518Ab1I0QxB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Sep 2011 12:53:01 -0400
Received: from wpaz29.hot.corp.google.com (wpaz29.hot.corp.google.com [172.24.198.93])
	by smtp-out.google.com with ESMTP id p8RGqxU7025976
	for <linux-next@vger.kernel.org>; Tue, 27 Sep 2011 09:52:59 -0700
Received: from eyb7 (eyb7.prod.google.com [10.208.2.7])
	by wpaz29.hot.corp.google.com with ESMTP id p8RGqviV018223
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Tue, 27 Sep 2011 09:52:58 -0700
Received: by eyb7 with SMTP id 7so6586678eyb.35
        for <linux-next@vger.kernel.org>; Tue, 27 Sep 2011 09:52:57 -0700 (PDT)
In-Reply-To: <20110927165920.14b00e8595d10135d2a4397a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Frederic Weisbecker <fweisbec@gmail.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>

On Mon, Sep 26, 2011 at 11:59 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Andrew,
>
> Today's linux-next merge of the scsi-post-merge tree got conflicts in
> arch/x86/kernel/apic/apic.c, arch/x86/kernel/cpu/mcheck/therm_throt.c,
> arch/x86/kernel/cpu/mcheck/threshold.c and arch/x86/kernel/irq.c between
> commit ef14aea88fee ("x86: Call idle notifier after irq_enter()") from
> the rcu tree and commit 6a541324a31f ("The current interrupt traces from
> irq_handler_entry and irq_handler_exit") from the akpm tree.
>
> Just context changes. I fixed them up (see below) and can carry the fixes
> as necessary.


Looks good to me. Do I need to provide Acked-by?

Vaibhav Nagarnaik
