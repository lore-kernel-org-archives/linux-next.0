From: Thierry Reding <thierry.reding@gmail.com>
Subject: linux-next: Tree for Oct 15
Date: Tue, 15 Oct 2013 16:02:41 +0200
Message-ID: <1381845763-10487-1-git-send-email-treding@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi all,

I've uploaded today's linux-next tree to the master branch of the
repository below:

        git://gitorious.org/thierryreding/linux-next.git

A next-20131015 tag is also provided for convenience.

Gained a new conflict, but nothing too exciting. x86 and ARM default
configurations build fine. I've also used an x86 allmodconfig build to
check for build errors. Mark fixed most of those in the trees that he
created last Thursday and Friday, so I've cherry-picked them on top of
the final merge. There was one new build failure in the staging tree
that was trivial to fix so I added a patch to the tree as well.

Thierry
