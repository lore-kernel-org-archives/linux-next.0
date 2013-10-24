From: Thierry Reding <thierry.reding@gmail.com>
Subject: linux-next: Tree for Oct 24
Date: Thu, 24 Oct 2013 18:31:29 +0200
Message-ID: <1382632289-18523-1-git-send-email-treding@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi all,

I've uploaded today's linux-next tree to the master branch of the
repository below:

        git://gitorious.org/thierryreding/linux-next.git

A next-20131024 tag is also provided for convenience.

Quite a few new conflicts. Some of them non-trivial. I've fixed another
set of build failures, so 32-bit and 64-bit allmodconfigs build fine on
x86. ARM and x86 default configurations also build fine. PowerPC is in
pretty bad shape, mostly due to some OF header rework going on.

I'm somewhat short on time today, so I probably won't manage to send out
detailed conflict reports out today. I'll try to do that tomorrow,
though.

Thierry
