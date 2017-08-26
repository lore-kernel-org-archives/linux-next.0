From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: manual merge of the kvm tree with the tip tree
Date: Sat, 26 Aug 2017 09:24:04 +0200
Message-ID: <20170826072404.ocjypnhp2b5rnh4l@gmail.com>
References: <20170825143930.494744fe@canb.auug.org.au>
 <2984689e-ab4e-0c22-7151-adfeeffce4ed@redhat.com>
 <dd8be323-8ffb-bab5-0431-f77e48fd5df1@amd.com>
 <a71c9dbd-ec32-8bb6-9d36-c138d9b4f001@amd.com>
 <2b021bf3-9ace-8678-0793-c0048500469c@redhat.com>
 <df4641f2-93ca-4923-bb6b-5a43f709859c@amd.com>
 <575d1d5a-5cfb-49b4-0ce7-b78372739cb6@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35723 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750818AbdHZHYI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 26 Aug 2017 03:24:08 -0400
Content-Disposition: inline
In-Reply-To: <575d1d5a-5cfb-49b4-0ce7-b78372739cb6@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Brijesh Singh <brijesh.singh@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, paolo.bonzini@gmail.com


* Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 25/08/2017 22:41, Brijesh Singh wrote:
> >>>>
> > 
> >> Neither my version nor yours is correct. :)  The right one has [0][i]
> >> and [1][i] (I inverted the indices by mistake).
> >>
> >> With that change, you can include my
> >>
> >> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> >>
> > 
> > Ingo,
> > 
> > I assuming that this patch should be sent through the tip since SME support
> > came from tip. I will be submitting the patch very soon.
> 
> Yes, that is correct.  I cannot apply it directly to the KVM tree.

I've merged it to tip:x86/mm where the SME bits live and will propagate it to 
linux-next ASAP, once it's gone through my local testing.

Thanks,

	Ingo
