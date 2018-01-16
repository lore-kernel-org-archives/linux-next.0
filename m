From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: manual merge of the kvm tree with Linus' and the tip
 trees
Date: Tue, 16 Jan 2018 01:55:08 +0100
Message-ID: <20180116005508.bl4p7sdncqiihq6h@gmail.com>
References: <20180115133459.27b8f7f1@canb.auug.org.au>
 <alpine.DEB.2.20.1801151125040.1810@nanos>
 <alpine.DEB.2.20.1801151933470.2143@nanos>
 <b4a6531c-3c5a-5ef4-ce57-48dfcec62f21@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kvm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b4a6531c-3c5a-5ef4-ce57-48dfcec62f21@redhat.com>
Sender: kvm-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Stephen Rothwell <sfr@canb.auug.org.au>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw@amazon.co.uk>, Tom Lendacky <thomas.lendacky@amd.com>, Brijesh Singh <brijesh.singh@amd.com>, Borislav Petkov <bp@alien8.de>
List-Id: linux-next.vger.kernel.org


* Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 15/01/2018 19:36, Thomas Gleixner wrote:
> >> Can KVM folks please stop doing random changes to the cpufeatures code
> >> without talking to x86 maintainers and Borislav?
> >>
> >> This wants to go through TIP or at least reviewed and acked.
> > In fact it needs to go through TIP. We spent a lot of effort to make the
> > backporting of all this mess simple and this is just shooting a hole in it.
> 
> I do understand why you want this to go through TIP, but I'm not sure
> why a change to Processor Tracing is related to PTI or retpolines.  I'm
> also not sure why it is a problem for backportability, since we always
> try to send pull requests after TIP.  Is it because 7*32+15 will be free
> in 4.16 but not earlier?

It is because certain central x86 changes (such as changes to processor flags)
are kept on a v4.14 base to keep the PTI backporting efforts manageable.

Please revert (or rebase) this change from the KVM tree, and submit it separately, 
as it should have been done to begin with. Please also follow this process in the 
future: all x86 changes outside arch/x86/kvm/ need an explicit ack from an x86 
maintainer.

Thanks,

	Ingo
