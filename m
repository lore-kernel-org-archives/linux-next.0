From: Gleb Natapov <gleb@redhat.com>
Subject: Re: linux-next: build warning after merge of the kvm tree
Date: Thu, 10 Jan 2013 08:56:46 +0200
Message-ID: <20130110065646.GH700@redhat.com>
References: <20130110133436.0feaf348b74cb89fdfb0bc78@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:38966 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752302Ab3AJG4u (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 10 Jan 2013 01:56:50 -0500
Content-Disposition: inline
In-Reply-To: <20130110133436.0feaf348b74cb89fdfb0bc78@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Marcelo Tosatti <mtosatti@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jan 10, 2013 at 01:34:36PM +1100, Stephen Rothwell wrote:
> Hi Marcelo,
> 
> After merging the kvm tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> In file included from arch/x86/kvm/mmu.c:3482:0:
> arch/x86/kvm/paging_tmpl.h: In function 'paging64_walk_addr_generic':
> arch/x86/kvm/paging_tmpl.h:154:57: warning: unused variable 'shift' [-Wunused-variable]
> In file included from arch/x86/kvm/mmu.c:3486:0:
> arch/x86/kvm/paging_tmpl.h: In function 'paging32_walk_addr_generic':
> arch/x86/kvm/paging_tmpl.h:154:57: warning: unused variable 'shift' [-Wunused-variable]
> 
> Introduced by commit 908e7d7999bc ("KVM: MMU: simplify folding of dirty
> bit into accessed_dirty").
> 
Was fixed yesterday. Thanks.

--
			Gleb.
