From: Gleb Natapov <gleb@redhat.com>
Subject: Re: linux-next: kvm tree build warning
Date: Mon, 6 Jul 2009 08:28:55 +0300
Message-ID: <20090706052855.GL881@redhat.com>
References: <20090706113752.8dec663a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755381AbZGFF3O@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090706113752.8dec663a.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Avi Kivity <avi@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Jul 06, 2009 at 11:37:52AM +1000, Stephen Rothwell wrote:
> Hi Avi,
> 
> Today's linux-next build (x86_64_allmodconfig) produced this warning:
> 
> arch/x86/kvm/lapic.c: In function 'apic_mmio_write':
> arch/x86/kvm/lapic.c:834: warning: 'return' with no value, in function returning non-void
> 
> Introduced by commit 55b23c7377c9f9f0b4a4b90950f0e18b26ac45e8 ("KVM:
> x2apic interface to lapic").
> 
Yes sorry. I see that Sheng Yang already posted the fix.

--
			Gleb.
