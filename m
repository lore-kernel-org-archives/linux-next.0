From: Scott Wood <scottwood@freescale.com>
Subject: Re: linux-next: manual merge of the kvm-ppc tree with the
 powerpc-merge tree
Date: Thu, 11 Oct 2012 10:50:03 -0500
Message-ID: <1349970603.6903.2@snotra>
References: <6201AAAD-F575-4D2C-9A97-3EB41DA3491C@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; delsp=Yes; format=Flowed
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from db3ehsobe001.messaging.microsoft.com ([213.199.154.139]:47285
	"EHLO db3outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758761Ab2JKPuN convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Oct 2012 11:50:13 -0400
In-Reply-To: <6201AAAD-F575-4D2C-9A97-3EB41DA3491C@suse.de> (from
	agraf@suse.de on Thu Oct 11 08:04:58 2012)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Graf <agraf@suse.de>
Cc: Tabi Timur-B04825 <B04825@freescale.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>

On 10/11/2012 08:04:58 AM, Alexander Graf wrote:
> 
> On 11.10.2012, at 05:32, Tabi Timur-B04825 wrote:
> 
> > On Wed, Oct 10, 2012 at 9:47 PM, Stephen Rothwell  
> <sfr@canb.auug.org.au> wrote:
> >
> >> Commit 549d62d889b4 ("KVM: PPC: use definitions in epapr header
> >> for hcalls") from the kvm-ppc tree added an include of  
> asm/epapr_hcall.h
> >> to the user visible part of asm/kvm_para.h so asm/epapr_hcall.h  
> became a
> >> user visible header file.
> >
> > Any real user-space code that tries to call any of the functions in
> > epapr_hcall.h will cause an exception.

Actually it'll cause a linker error, as of the "Don't use hardcoded  
opcode for ePAPR hcall invocation" patch.

> > Claiming that kernel header files that KVM needs are suddenly
> > user-space header files doesn't make much sense to me, but I guess
> > it's not my decision.
> 
> This is about kvm_host.h, which is the part that is exported to user  
> space. It usually contains constants and structs that are required  
> for the API.

s/kvm_host/kvm_para/

I'm not sure anything in kvm_para.h or epapr_hcalls.h would be of use  
to userspace, but it would be of use to the guest OS, so it's still not  
kernel-internal.

The variable externs should be #ifdef __KERNEL__ as David points out.   
The asm stuff could still be useful in a guest OS if the guest provides  
epapr_hypercall_start.

-Scott
