From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for January 23 (kvm)
Date: Fri, 23 Jan 2009 12:34:24 -0800
Message-ID: <497A29D0.2010307@oracle.com>
References: <20090123184826.f2c91472.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756702AbZAWUfU@vger.kernel.org>
In-Reply-To: <20090123184826.f2c91472.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, avi@redhat.com
List-Id: linux-next.vger.kernel.org

Stephen Rothwell wrote:
> Hi all,
> 
> News:  I will be on leave next week, so there will probably be no
> linux-next release until Feb 2.
> 
> Changes since 20090122:


kvm changes cause this build error on i386:

when kvm is built as module:
ERROR: "__moddi3" [arch/x86/kvm/kvm.ko] undefined!

or when kvm is built into the kernel image:
lapic.c:(.text+0x19276): undefined reference to `__moddi3'


I guess it's this line:
	ns = ktime_to_ns(remaining) % apic->timer.period;

-- 
~Randy
