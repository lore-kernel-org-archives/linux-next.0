From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 21 Sep 2015 14:18:10 +1000
Message-ID: <20150921141810.298d07b2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36761 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750891AbbIUESM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 21 Sep 2015 00:18:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/input/joystick/walkera0701.c:153:4: error: implicit declaration of function 'abs64' [-Werror=implicit-function-declaration]
    if (abs64(pulse_time - SYNC_PULSE) < RESERVE) /* new frame sync */
    ^

Caused by commit

  ea91f9c72512 ("Remove abs64()")

interacting with commit

  46b018fa9500 ("Input: walkera0701 - fix abs() calculations on 64 bit values")

from the input-current tree.

I just reverted 46b018fa9500 as ti will no longer be needed.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
