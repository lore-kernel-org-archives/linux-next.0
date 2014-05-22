From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] sound branch of STMPE cleanups
Date: Fri, 23 May 2014 00:23:54 +0200
Message-ID: <CACRpkdZTez-OJgjNV8jKxgFEXhyXdsnv5bwSdLH_dRfok1u24g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oa0-f48.google.com ([209.85.219.48]:63330 "EHLO
	mail-oa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752084AbaEVWXz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 22 May 2014 18:23:55 -0400
Received: by mail-oa0-f48.google.com with SMTP id i4so4730645oah.35
        for <linux-next@vger.kernel.org>; Thu, 22 May 2014 15:23:55 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>

Hi Lee,

as seen in linux-next something is screwed up on the immutable
branch for STMPE cleanups, can you pull this instead, it is
the known tested good version with no compilation regressions.

I have no hurry to get this into the GPIO tree anymore, I will push
additionall changes to the next merge window, simply.

Yours,
Linus Walleij


The following changes since commit 89ca3b881987f5a4be4c5dbaa7f0df12bbdde2fd:

  Linux 3.15-rc4 (2014-05-04 18:14:42 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-stericsson.git
stmpe-for-lee

for you to fetch changes up to decc1ca8b2e5ae947fd9679f8adbd056d3b47d30:

  mfd: stmpe: mask off unused blocks properly (2014-05-23 00:19:12 +0200)

----------------------------------------------------------------
Linus Walleij (4):
      mfd: stmpe: root out static GPIO and IRQ assignments
      mfd: stmpe: add optional regulators
      mfd: stmpe: probe properly from the device tree
      mfd: stmpe: mask off unused blocks properly

 drivers/gpio/gpio-stmpe.c | 18 +++++-------------
 drivers/mfd/Kconfig       |  1 +
 drivers/mfd/stmpe-i2c.c   | 30 +++++++++++++++++++++++++++++-
 drivers/mfd/stmpe.c       | 30 ++++++++++++++++++++++++++++--
 drivers/mfd/stmpe.h       |  2 +-
 include/linux/mfd/stmpe.h | 19 +++++--------------
 6 files changed, 69 insertions(+), 31 deletions(-)
