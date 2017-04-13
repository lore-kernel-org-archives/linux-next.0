From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH 4/4] mm/hmm: exclude 64 bit arch that explicitly fail to
 work.
Date: Thu, 13 Apr 2017 13:27:01 +1000
Message-ID: <20170413132701.633a22a9@canb.auug.org.au>
References: <20170413003014.4052-1-paul.gortmaker@windriver.com>
        <20170413003014.4052-5-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39475 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755528AbdDMD1E (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 12 Apr 2017 23:27:04 -0400
In-Reply-To: <20170413003014.4052-5-paul.gortmaker@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, =?UTF-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, Evgeny Baskakov <ebaskakov@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Mark Hairgrove <mhairgrove@nvidia.com>, Sherry Cheung <SCheung@nvidia.com>, Subhash Gutti <sgutti@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>

Hi Paul,

On Wed, 12 Apr 2017 20:30:14 -0400 Paul Gortmaker <paul.gortmaker@windriver.com> wrote:
>
> Since ia64 and ppc64 don't set CONFIG_64BIT, they were already
> excluded by the original dependency.

My powerpc ppc64_defconfig builds have CONFIG_64BIT set ...

$ grep CONFIG_64BIT ~/next/powerpc_ppc64_defconfig/.config
CONFIG_64BIT=y

-- 
Cheers,
Stephen Rothwell
