From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: manual merge of the kvm tree with Linus' tree
Date: Wed, 17 Jan 2018 13:53:26 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1801171353100.1777@nanos>
References: <20180117144817.1cba736f@canb.auug.org.au> <alpine.DEB.2.20.1801171243230.1777@nanos> <b54c26df-cee2-a930-7e34-47701e852f9e@redhat.com> <alpine.DEB.2.20.1801171321580.1777@nanos> <20180117234326.24a2c0c3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180117234326.24a2c0c3@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?ISO-8859-2?Q?Radim_Kr=E8m=E1=F8?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw@amazon.co.uk>, Ingo Molnar <mingo@kernel.org>, Brijesh Singh <brijesh.singh@amd.com>
List-Id: linux-next.vger.kernel.org

On Wed, 17 Jan 2018, Stephen Rothwell wrote:
> On Wed, 17 Jan 2018 13:23:17 +0100 (CET) Thomas Gleixner <tglx@linutronix.de> wrote:
> > No. Keep it and lets next time coordinate the relevant bits and pieces
> > better. I reserve that bit 20 and let Linus sort out the trivial conflict
> > when merging the stuff.
> 
> I just picked that bit 20 when resolving the conflict.  The original patch used
> bit 11, so the resolution could use any other sensible bit.

20 is fine :)
