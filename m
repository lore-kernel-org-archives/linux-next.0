From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH akpm/next 0/4] Fix various issues in new hmm driver
Date: Wed, 12 Apr 2017 20:30:10 -0400
Message-ID: <20170413003014.4052-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-next@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>, Evgeny Baskakov <ebaskakov@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Mark Hairgrove <mhairgrove@nvidia.com>, Sherry Cheung <SCheung@nvidia.com>, Subhash Gutti <sgutti@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

My build coverage for non-modules adding dead modular code
tripped on this recently new addition.  After removing that and
rebuilding, I saw the driver still had warnings that were independent
of the "demodular" change, which the 2nd commit fixes.

Then there was "select" usage that was bound to cause troubles because
it was selecting an option with explicit dependencies.  We decouple by
adding an ARCH_HAS so the selects are valid while keeping the depends
listed in a single place.  We do this so we can update the parent depends
properly (and only once) in 4/4.

Build tested for x86-64, arm64 and s390.  Other 64 bit arch don't build
and hence appear to be not applicable, as per details in patch 4/4.

Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Evgeny Baskakov <ebaskakov@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Mark Hairgrove <mhairgrove@nvidia.com>
Cc: Sherry Cheung <SCheung@nvidia.com>
Cc: Subhash Gutti <sgutti@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>

---

Paul Gortmaker (4):
  mm/hmm: make it explicitly non-modular
  mm/hmm: fix warnings and SECTION_SIZE definition overlap
  mm/hmm: fix Kconfig to have valid usage of "select"
  mm/hmm: exclude 64 bit arch that explicitly fail to work.

 mm/Kconfig | 23 +++++++++--------------
 mm/hmm.c   | 37 +++++++++++++++----------------------
 2 files changed, 24 insertions(+), 36 deletions(-)

-- 
2.11.0
