From: Andrea Arcangeli <aarcange@redhat.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip
 tree
Date: Thu, 30 Jul 2015 17:38:55 +0200
Message-ID: <20150730153855.GB10863@redhat.com>
References: <20150728160015.142f588f@canb.auug.org.au>
 <20150729171256.GA10863@redhat.com>
 <CALCETrX=hriW8sEjA1fV4et6HDFX9rMD94TdJd9pe07TkbRaqg@mail.gmail.com>
 <alpine.DEB.2.11.1507292045510.3825@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:46151 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751070AbbG3Pi5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Jul 2015 11:38:57 -0400
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.11.1507292045510.3825@nanos>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Andy Lutomirski <luto@amacapital.net>, Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, Eric B Munson <emunson@akamai.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>

On Wed, Jul 29, 2015 at 08:46:10PM +0200, Thomas Gleixner wrote:
> On Wed, 29 Jul 2015, Andy Lutomirski wrote:
> > -tip people: want to assign Andrea a pair of syscall numbers?
> 
> Sure, just send a patch ....

Awesome, I just sent the patch to register the syscall against -tip
with the usual placeholder that will return -ENOSYS.

Thanks,
Andrea
