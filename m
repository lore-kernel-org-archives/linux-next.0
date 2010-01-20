From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for January 20 (kvm warnings)
Date: Wed, 20 Jan 2010 09:12:41 -0800
Message-ID: <20100120091241.3f10428d.randy.dunlap@oracle.com>
References: <20100120181016.6ba3e504.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <kvm-owner@vger.kernel.org>
In-Reply-To: <20100120181016.6ba3e504.sfr@canb.auug.org.au>
Sender: kvm-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Avi Kivity <avi@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, 20 Jan 2010 18:10:16 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20100119:
> 
> The kvm tree lost its build failure.


on i386/X86_32:

arch/x86/kvm/x86.c:3810: warning: left shift count >= width of type
arch/x86/kvm/x86.c:3812: warning: left shift count >= width of type
arch/x86/kvm/x86.c:3814: warning: left shift count >= width of type

---
~Randy
