From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 4 Sep 2017 18:56:45 +1000
Message-ID: <20170904185645.70d8c14b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, Evgeny Baskakov <ebaskakov@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Mark Hairgrove <mhairgrove@nvidia.com>, Sherry Cheung <SCheung@nvidia.com>, Subhash Gutti <sgutti@nvidia.com>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/home/sfr/next/next/mm/hmm.c:202:2: error: unknown field 'invalidate_page' specified in initializer
  .invalidate_page = hmm_invalidate_page,
  ^
/home/sfr/next/next/mm/hmm.c:202:21: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
  .invalidate_page = hmm_invalidate_page,
                     ^

Caused by commit

  b49705c24406 ("mm/hmm/mirror: mirror process address space on device with HMM helpers")

interacting with commit

  5f32b265400d ("mm/mmu_notifier: kill invalidate_page")

from Linus' tree.

I have disabled CONFIG_HMM_MIRROR for today.

-- 
Cheers,
Stephen Rothwell
