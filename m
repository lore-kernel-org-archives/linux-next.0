From: Linus Walleij <linus.walleij@linaro.org>
Subject: Please drop ux500-core from linux-next
Date: Mon, 26 Sep 2011 00:48:28 +0200
Message-ID: <CACRpkdZfk=9jQZ=wDfGwDs9LmQnGZ-WQ9+XnNxwG=BNPi0gFWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:39451 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752119Ab1IYWs3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 25 Sep 2011 18:48:29 -0400
Received: by pzk1 with SMTP id 1so13089165pzk.1
        for <linux-next@vger.kernel.org>; Sun, 25 Sep 2011 15:48:28 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

Hi Stephen,

can you please remove the ux500-core tree from the stuff pulled into
-next so it doesn't get pulled in whenever kernel.org comes back up?

I am currently merging patches through the arm-soc tree instead, and
Arnd et al submits branches to -next for testing on my behalf.

Thanks,
Linus Walleij
