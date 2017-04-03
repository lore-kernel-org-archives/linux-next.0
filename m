From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Mon, 3 Apr 2017 16:38:25 +0200
Message-ID: <20170403143825.GA1124@gmail.com>
References: <20170329143528.50c0f325@canb.auug.org.au>
 <906e3014-881c-b1c7-4943-e0ed9845aab2@suse.com>
 <20170329085945.GA11382@gmail.com>
 <26fb88f9-dd20-c56b-e87d-6d454b4f7c71@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:35362 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751716AbdDCOia (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 3 Apr 2017 10:38:30 -0400
Content-Disposition: inline
In-Reply-To: <26fb88f9-dd20-c56b-e87d-6d454b4f7c71@suse.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vitaly Kuznetsov <vkuznets@redhat.com>, Andy Lutomirski <luto@kernel.org>, Mathias Krause <minipli@googlemail.com>, Thomas Garnier <thgarnie@google.com>


* Juergen Gross <jgross@suse.com> wrote:

> > So my suggestion would be: could you delay 75cd32d6093e for a week, and then 
> > merge it on top of a pulled in tip:x86/mm? I'll send that tree to Linus on the 
> > first day of the merge window so there shouldn't be any ordering problems.
> 
> Okay, that's rather easy to do.
> 
> Boris, I renamed the current Xen for-linus-4.12 branch for easy development of 
> other Xen patches to for-linus-4.12-pre.
> 
> I'll create another branch for-linus-4.12 based on the tip tree next week which 
> will be subject to the pull request for Linus. As soon as for-linus-4.12 is 
> ready the for-linus-4.12-pre branch shouldn't be used any longer.

I've created a tip:x86-mm-for-xen branch with the following head:

  7f75540ff2ca ("Merge tag 'v4.11-rc5' into x86/mm, to refresh the branch")

... which should be a reasonable base that includes a working version of the 
5-level pagetable changes.

Thanks,

	Ingo
