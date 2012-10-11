From: Timur Tabi <B04825@freescale.com>
Subject: Re: linux-next: manual merge of the kvm-ppc tree with the powerpc-merge
 tree
Date: Thu, 11 Oct 2012 10:55:42 -0500
Message-ID: <5076EBFE.5060208@freescale.com>
References: <20121011121841.1b946f996cba995d9a5a2be7@canb.auug.org.au> <6AE080B68D46FC4BA2D2769E68D765B7080FA8F8@039-SN2MPN1-023.039d.mgd.msft.net> <20121011134754.2e2cbb24842fa991e61cf97c@canb.auug.org.au> <6AE080B68D46FC4BA2D2769E68D765B7080FA9F8@039-SN2MPN1-023.039d.mgd.msft.net> <6201AAAD-F575-4D2C-9A97-3EB41DA3491C@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]:2885 "EHLO
	tx2outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751160Ab2JKPzr (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Oct 2012 11:55:47 -0400
In-Reply-To: <6201AAAD-F575-4D2C-9A97-3EB41DA3491C@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Graf <agraf@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yoder Stuart-B08248 <B08248@freescale.com>, David Howells <dhowells@redhat.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>

Alexander Graf wrote:


> This is about kvm_host.h, which is the part that is exported to user
> space. It usually contains constants and structs that are required for
> the API.

Which API?  I'm not familiar with KVM internals.

My concern is that when I think of a user-space header file, I think of a
user-space application that calls ioctls.  I know that KVM guest kernels
run as user-space processes, but that does not seem like a reason to
combine all of the header files that the KVM guest kernel needs with
"real" user-space header files.

-- 
Timur Tabi
Linux kernel developer at Freescale
