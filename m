From: Timur Tabi <B04825@freescale.com>
Subject: Re: linux-next: manual merge of the kvm-ppc tree with the powerpc-merge
 tree
Date: Thu, 11 Oct 2012 12:24:59 -0500
Message-ID: <507700EB.5090307@freescale.com>
References: <20121011121841.1b946f996cba995d9a5a2be7@canb.auug.org.au> <6AE080B68D46FC4BA2D2769E68D765B7080FA8F8@039-SN2MPN1-023.039d.mgd.msft.net> <20121011134754.2e2cbb24842fa991e61cf97c@canb.auug.org.au> <6AE080B68D46FC4BA2D2769E68D765B7080FA9F8@039-SN2MPN1-023.039d.mgd.msft.net> <6201AAAD-F575-4D2C-9A97-3EB41DA3491C@suse.de> <5076EBFE.5060208@freescale.com> <1349973438.6903.4@snotra>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]:14682
	"EHLO ch1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932758Ab2JKRZE (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Oct 2012 13:25:04 -0400
In-Reply-To: <1349973438.6903.4@snotra>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Scott Wood <scottwood@freescale.com>
Cc: Alexander Graf <agraf@suse.de>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>

Scott Wood wrote:
>> > My concern is that when I think of a user-space header file, I think  
>> > of a
>> > user-space application that calls ioctls.  I know that KVM guest  
>> > kernels
>> > run as user-space processes, but that does not seem like a reason to
>> > combine all of the header files that the KVM guest kernel needs with
>> > "real" user-space header files.

> So where should guest headers go?

I admit that I don't have any answers, especially since this whole thing
is new to me.  Like I said, I don't know much about KVM internals, so I
just don't understand why KVM guests need to have access to these kernel
header files as if they're user header files.  The guests are still Linux
kernels (or other OSes that think they're running as privileged code).

-- 
Timur Tabi
Linux kernel developer at Freescale
