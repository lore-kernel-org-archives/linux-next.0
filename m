From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the input tree
Date: Fri, 16 Oct 2015 13:19:48 +1100
Message-ID: <20151016131948.0a87d480@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48260 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751642AbbJPCTv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 15 Oct 2015 22:19:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

Hi Dmitry,

After merging the input tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from samples/hidraw/hid-example.c:14:0:
./usr/include/linux/input.h:17:31: fatal error: input-event-codes.h: No such file or directory

Caused by commit

  d794709c3916 ("Input: Add input-event-codes header file")

I have used the input tree from next-20151015 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
