From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Nov 28 (arch/x86/mm/kaiser.c)
Date: Tue, 28 Nov 2017 08:47:54 -0800
Message-ID: <7e969f86-1208-e5ea-3ee3-b9f9c73c3285@infradead.org>
References: <20171128145247.21f5e888@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:55902 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753592AbdK1Qr7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Nov 2017 11:47:59 -0500
In-Reply-To: <20171128145247.21f5e888@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Dave Hansen <dave.hansen@intel.com>

On 11/27/2017 07:52 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20171127:
> 
> New trees:	ntb, kvm-master, at24
> 


on x86_64:

../arch/x86/mm/kaiser.c: In function 'kaiser_shadow_pagetable_walk':
../arch/x86/mm/kaiser.c:173:28: error: '__GFP_NOTRACK' undeclared (first use in this function)
  gfp_t gfp = (GFP_KERNEL | __GFP_NOTRACK | __GFP_ZERO);


-- 
~Randy
