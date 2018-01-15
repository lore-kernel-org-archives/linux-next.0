From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: linux-next: manual merge of the kvm tree with Linus' and the tip
 trees
Date: Mon, 15 Jan 2018 23:45:50 +0100
Message-ID: <b4a6531c-3c5a-5ef4-ce57-48dfcec62f21@redhat.com>
References: <20180115133459.27b8f7f1@canb.auug.org.au>
 <alpine.DEB.2.20.1801151125040.1810@nanos>
 <alpine.DEB.2.20.1801151933470.2143@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.20.1801151933470.2143@nanos>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw@amazon.co.uk>, Tom Lendacky <thomas.lendacky@amd.com>, Brijesh Singh <brijesh.singh@amd.com>, Borislav Petkov <bp@alien8.de>
List-Id: linux-next.vger.kernel.org

On 15/01/2018 19:36, Thomas Gleixner wrote:
>> Can KVM folks please stop doing random changes to the cpufeatures code
>> without talking to x86 maintainers and Borislav?
>>
>> This wants to go through TIP or at least reviewed and acked.
> In fact it needs to go through TIP. We spent a lot of effort to make the
> backporting of all this mess simple and this is just shooting a hole in it.

I do understand why you want this to go through TIP, but I'm not sure
why a change to Processor Tracing is related to PTI or retpolines.  I'm
also not sure why it is a problem for backportability, since we always
try to send pull requests after TIP.  Is it because 7*32+15 will be free
in 4.16 but not earlier?

FWIW, no changes for IBRS or RSB stuffing are going through the KVM tree
before the bare metal parts are there.  I posted those mostly for people
(mostly the cloud providers that had been left in the dark) who wanted
something to apply quickly and didn't care about bare metal protection
because they could assume that any attack path passed through a vmexit.

Paolo

> Please drop that change and we sort something out how it can be done proper.
> 
> Dammit, we have a well established process for stuff like that.
