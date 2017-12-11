From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the device-mapper tree
Date: Mon, 11 Dec 2017 16:43:03 +1100
Message-ID: <20171211164303.7571efa6@canb.auug.org.au>
References: <20171211130534.6ab6e415@canb.auug.org.au>
        <20171211052436.GA18104@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44107 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751260AbdLKFnG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 11 Dec 2017 00:43:06 -0500
In-Reply-To: <20171211052436.GA18104@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Snitzer <snitzer@redhat.com>
Cc: Alasdair G Kergon <agk@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Mike,

On Mon, 11 Dec 2017 00:24:36 -0500 Mike Snitzer <snitzer@redhat.com> wrote:
>
> I worked all weekend on DM code and compiled dm.c probably 30 times,
> pretty bizarre that the RHEL7 gcc compiler isn't spewing anything about
> this.

That is weird.

> Anyway, I just fixed it via rebase (new commit is
> 6fb0326f0a19dd855bfd748481fd32035770376e).

Excellent, thanks.

-- 
Cheers,
Stephen Rothwell
