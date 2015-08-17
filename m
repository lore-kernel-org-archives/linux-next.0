From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rebase of the drm-exynos tree
Date: Tue, 18 Aug 2015 08:50:50 +1000
Message-ID: <20150818085050.7a38f4ef@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Airlie <airlied@linux.ie>
List-Id: linux-next.vger.kernel.org

Hi Inki,

I noticed today that your tree
(git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git#exynos-drm/for-next)
has been merged by Dave into his drm tree.  Unfortunately, your tree
has also been rebased onto Linus's v4.2-rc7.  So now the commits
0cb600d9be30-f8f66412fa6c in your tree are duplicated of commits
d36b3004ca2c-2a8cb4894540 in Dave's.  Please tidy this up (i.e. your
exynos-drm/for-next branch should be commit 2a8cb4894540 or something
later in Dave's tree) and you should continue your work from there.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
