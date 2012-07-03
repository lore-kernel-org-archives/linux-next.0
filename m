From: Marcelo Tosatti <mtosatti@redhat.com>
Subject: Re: [PATCH] apic: fix kvm build on UP without IOAPIC
Date: Tue, 3 Jul 2012 15:55:11 -0300
Message-ID: <20120703185511.GA24415@amt.cnet>
References: <20120701150506.GA31304@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120701150506.GA31304@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Avi Kivity <avi@redhat.com>, Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, x86@kernel.org, kvm@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
List-Id: linux-next.vger.kernel.org

On Sun, Jul 01, 2012 at 06:05:06PM +0300, Michael S. Tsirkin wrote:
> On UP i386, when APIC is disabled
> # CONFIG_X86_UP_APIC is not set
> # CONFIG_PCI_IOAPIC is not set
> 
> code looking at apicdrivers never has any effect but it
> still gets compiled in. In particular, this causes
> build failures with kvm, but it generally bloats the kernel
> unnecessarily.
> 
> Fix by defining both __apicdrivers and __apicdrivers_end
> to be NULL when CONFIG_X86_LOCAL_APIC is unset: I verified
> that as the result any loop scanning __apicdrivers gets optimized out by
> the compiler.
> 
> Warning: a .config with apic disabled doesn't seem to boot
> for me (even without this patch). Still verifying why,
> meanwhile this patch is compile-tested only.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
> 
> Note: if this patch makes sense, can x86 maintainers
> please ACK applying it through the kvm tree, since that is
> where we see the issue that it addresses?
> Avi, Marcelo, maybe you can carry this in kvm/linux-next as a temporary
> measure so that linux-next builds?

Applied, thanks.
