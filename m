From: Thierry Reding <thierry.reding@gmail.com>
Subject: linux-next: Tree for Oct 14
Date: Mon, 14 Oct 2013 16:48:01 +0200
Message-ID: <1381762088-18880-1-git-send-email-treding@nvidia.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bk0-f53.google.com ([209.85.214.53]:45466 "EHLO
	mail-bk0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754841Ab3JNOuV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 14 Oct 2013 10:50:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>

Hi all,

I've uploaded today's linux-next tree to the master branch of the
repository below:

        git://gitorious.org/thierryreding/linux-next.git

A next-20131014 tag is also provided for convenience.

Gained a few conflicts, but nothing too exciting. x86 and ARM default
configurations build fine. There were some build failures unrelated to
the merge, most of which I fixed and added as patches on top of the
final merge.

Thierry
