From: Avi Kivity <avi@redhat.com>
Subject: Re: linux next: Native Linux KVM tool inclusion request
Date: Wed, 24 Aug 2011 12:33:14 +0300
Message-ID: <4E54C55A.7010109@redhat.com>
References: <1314044960.3668.9.camel@lappy> <20110823003925.GA30253@infradead.org> <CAOJsxLEgm_-N6297kHqSjFLCtX-Vd204S=+4Q=+GW9HYiWj1eg@mail.gmail.com> <4E54B6E2.2030203@redhat.com> <4E54C210.1030204@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:33469 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753358Ab1HXJdf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 24 Aug 2011 05:33:35 -0400
In-Reply-To: <4E54C210.1030204@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>, Sasha Levin <levinsasha928@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, linux-next@vger.kernel.org

On 08/24/2011 12:19 PM, Pekka Enberg wrote:
> On 8/24/11 11:31 AM, Avi Kivity wrote:
>> On 08/23/2011 08:08 AM, Pekka Enberg wrote:
>>> As for changes, we've implemented rootfs over 9p with "kvm run"
>>> booting to host filesystem "/bin/sh" by default.
>>
>> Isn't this dangerous?  Users expect virtualization to land them in 
>> sandbox, but here an rm -rf / in the guest will happily junk the host 
>> filesystem.
>
> Not really because I never run the tool as root. However, you're right 
> that
> we should not default to /bin/sh if you're root.

Well, just trashing /home/penberg would be bad too, no? (my recent 
experience indicates it's not that catastrophic - anything important 
sits on a server somewhere and the local data is just a cache).

>>
>> Still dangerous (but just to the guest), since it's not a true 
>> snapshot.  If the host filesystem changes underneath the guest, it 
>> will see partial and incoherent updates.  Copy-on-write only works if 
>> the host filesystem doesn't change.
>
> That's a generic problem with overlayfs based solutions, isn't it? 
> We're planning
> to use copy-on-write only on files that aren't supposed to change that 
> often -
> like /usr and /lib.

So the guest won't see bad data that often?

Overlay works fine if the host tree is readonly.  So if you have a 
separate tree for guests, you can share it with any number of them.  
Just don't share the host root.

Note this probably isn't a problem booting to /bin/bash, just booting a 
full-featured guest with package management and other database-like apps 
that expect exclusive control over their data.

> I suppose we should force shared files to be read-only in
> the guest.
>

Yes, that's safer.


-- 
I have a truly marvellous patch that fixes the bug which this
signature is too narrow to contain.
