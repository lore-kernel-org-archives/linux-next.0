From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: linux-next: slab tree build failure
Date: Mon, 7 Sep 2009 12:22:47 +0300
Message-ID: <84144f020909070222u51fba710q6121f41a946998c6@mail.gmail.com>
References: <20090907153723.0c984c83.sfr@canb.auug.org.au>
	 <84144f020909062310u37ecdddfw31c6cc9a22ccabd9@mail.gmail.com>
	 <20090907173108.3c0148d7.sfr@canb.auug.org.au>
	 <1252309426.4964.3.camel@penberg-laptop>
	 <20090907090441.GB4717@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f219.google.com ([209.85.218.219]:36973 "EHLO
	mail-bw0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751233AbZIGJWq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Sep 2009 05:22:46 -0400
In-Reply-To: <20090907090441.GB4717@osiris.boeblingen.de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Luis R. Rodriguez" <lrodriguez@atheros.com>, "John W. Linville" <linville@tuxdriver.com>, Catalin Marinas <catalin.marinas@arm.com>, npiggin@suse.de, "Sachin P. Sant" <sachinp@in.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>

Hi Heiko,

On Mon, Sep 07, 2009 at 10:43:46AM +0300, Pekka Enberg wrote:
>> Aah, let me guess, CONFIG_SLQB? I guess I'll just rebase the damn tree
>> and make it non-default. We need that anyway if we want to merge it to
>> 2.6.32. I'll take a stab at it later this evening (my time zone).

On Mon, Sep 7, 2009 at 12:04 PM, Heiko
Carstens<heiko.carstens@de.ibm.com> wrote:
> Will SLQB be merged during the next merge window? Just realized that s390
> doesn't boot with CONFIG_SLQB (crashes before the console is active).
>
> I tend to ignore bugs which seem to be related to SLQB in linux-next,
> but if it gets merged I might need to look deeper into this.

Yes, that's the plan. That said, there's a long-standing PPC boot-time
bug in SLQB that's still unfixed which could affect other archs as
well AFAICT. Help in tracking that down would be appreciated as Nick
seems to be busy atm.

I am not completely happy with sending something that's known to be
broken to Linus. However, the problem is not getting fixed in slab.git
and everyone seems to be in favor of merging the allocator and mark it
as "experimental" so I'll probably just send it Linus' way for 2.6.32
and let him decide whether to take it or not.

                        Pekka
