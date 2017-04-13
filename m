From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 4/4] mm/hmm: exclude 64 bit arch that explicitly fail to work.
Date: Thu, 13 Apr 2017 15:12:12 +1000
Message-ID: <87poggao2b.fsf@concordia.ellerman.id.au>
References: <20170413003014.4052-1-paul.gortmaker@windriver.com> <20170413003014.4052-5-paul.gortmaker@windriver.com> <20170413132701.633a22a9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35039 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751312AbdDMFMU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 13 Apr 2017 01:12:20 -0400
In-Reply-To: <20170413132701.633a22a9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, Evgeny Baskakov <ebaskakov@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Mark Hairgrove <mhairgrove@nvidia.com>, Sherry Cheung <SCheung@nvidia.com>, Subhash Gutti <sgutti@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Paul,
>
> On Wed, 12 Apr 2017 20:30:14 -0400 Paul Gortmaker <paul.gortmaker@windriver.com> wrote:
>>
>> Since ia64 and ppc64 don't set CONFIG_64BIT, they were already
>> excluded by the original dependency.
>
> My powerpc ppc64_defconfig builds have CONFIG_64BIT set ...
>
> $ grep CONFIG_64BIT ~/next/powerpc_ppc64_defconfig/.config
> CONFIG_64BIT=y

Yeah, arch/powerpc/Kconfig:

config 64BIT
	bool
	default y if PPC64

cheers
