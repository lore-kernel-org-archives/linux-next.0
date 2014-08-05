From: James Hogan <james.hogan@imgtec.com>
Subject: Re: linux-next: manual merge of the kvm-ppc tree with the kvm tree
Date: Tue, 5 Aug 2014 11:00:36 +0100
Message-ID: <53E0AB44.90804@imgtec.com>
References: <20140804180403.3cfdbadf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailapp01.imgtec.com ([195.59.15.196]:58819 "EHLO
	mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933078AbaHEKAj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Aug 2014 06:00:39 -0400
In-Reply-To: <20140804180403.3cfdbadf@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Alexander Graf <agraf@suse.de>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>

Hi Stephen,

On 04/08/14 09:04, Stephen Rothwell wrote:
>  +  PPC   | KVM_REG_PPC_LPCR              | 64

I think due to a0840240c0c6 this one should be s/64/32/.

> ++  PPC   | KVM_REG_PPC_LPCR_64		| 64

And I suppose it'd be nice to replace tabs with spaces for consistency
(since that's one of the things bf5590f37919 did).

How about this fixup patch?

Cheers
James

diff --git a/Documentation/virtual/kvm/api.txt b/Documentation/virtual/kvm/api.txt
index dc226e1867e1..2863f02b0efb 100644
--- a/Documentation/virtual/kvm/api.txt
+++ b/Documentation/virtual/kvm/api.txt
@@ -1895,8 +1895,8 @@ registers, find a list below:
   PPC   | KVM_REG_PPC_PID               | 64
   PPC   | KVM_REG_PPC_ACOP              | 64
   PPC   | KVM_REG_PPC_VRSAVE            | 32
-  PPC   | KVM_REG_PPC_LPCR              | 64
-  PPC   | KVM_REG_PPC_LPCR_64		| 64
+  PPC   | KVM_REG_PPC_LPCR              | 32
+  PPC   | KVM_REG_PPC_LPCR_64           | 64
   PPC   | KVM_REG_PPC_PPR               | 64
   PPC   | KVM_REG_PPC_ARCH_COMPAT       | 32
   PPC   | KVM_REG_PPC_DABRX             | 32
