From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: manual merge of the kvm tree with Linus' and the
 tip trees
Date: Tue, 16 Jan 2018 16:08:20 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1801161606510.1823@nanos>
References: <20180115133459.27b8f7f1@canb.auug.org.au> <alpine.DEB.2.20.1801151125040.1810@nanos> <alpine.DEB.2.20.1801151933470.2143@nanos> <b4a6531c-3c5a-5ef4-ce57-48dfcec62f21@redhat.com> <20180116005508.bl4p7sdncqiihq6h@gmail.com>
 <1b2f251b-70ae-11fd-dab7-8d1180de483b@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1b2f251b-70ae-11fd-dab7-8d1180de483b@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ingo Molnar <mingo@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, =?ISO-8859-2?Q?Radim_Kr=E8m=E1=F8?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw@amazon.co.uk>, Tom Lendacky <thomas.lendacky@amd.com>, Brijesh Singh <brijesh.singh@amd.com>, Borislav Petkov <bp@alien8.de>
List-Id: linux-next.vger.kernel.org

On Tue, 16 Jan 2018, Paolo Bonzini wrote:

> On 16/01/2018 01:55, Ingo Molnar wrote:
> > 
> > * Paolo Bonzini <pbonzini@redhat.com> wrote:
> > 
> >> On 15/01/2018 19:36, Thomas Gleixner wrote:
> >>>> Can KVM folks please stop doing random changes to the cpufeatures code
> >>>> without talking to x86 maintainers and Borislav?
> >>>>
> >>>> This wants to go through TIP or at least reviewed and acked.
> >>> In fact it needs to go through TIP. We spent a lot of effort to make the
> >>> backporting of all this mess simple and this is just shooting a hole in it.
> >>
> >> I do understand why you want this to go through TIP, but I'm not sure
> >> why a change to Processor Tracing is related to PTI or retpolines.  I'm
> >> also not sure why it is a problem for backportability, since we always
> >> try to send pull requests after TIP.  Is it because 7*32+15 will be free
> >> in 4.16 but not earlier?
> > 
> > It is because certain central x86 changes (such as changes to processor flags)
> > are kept on a v4.14 base to keep the PTI backporting efforts manageable.
> > 
> > Please revert (or rebase) this change from the KVM tree, and submit it separately, 
> > as it should have been done to begin with. Please also follow this process in the 
> > future: all x86 changes outside arch/x86/kvm/ need an explicit ack from an x86 
> > maintainer.
> 
> I've always done it like that until
> https://marc.info/?l=kvm&m=149335647027790 got no response for three
> months, then I thought you didn't care.

Well, I certainly cared, but was kaisered enough to not look.

> We will drop Intel PT support and delay it to 4.17.  Luwei, since your
> patches have issues with incorrect use of the MSR bitmap, this is
> probably a good thing anyway (better bisectability).  Please repost your
> patches at the end of the merge window, then we will wait for an ack
> from Thomas/Ingo/Peter.

Can we get all cpu feature bit specific patches now please so we can move
them through TIP?

Thanks,

	tglx
