From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the input tree
Date: Fri, 24 Jul 2015 11:49:36 +1000
Message-ID: <20150724114936.3381b80c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33199 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753084AbbGXBth (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Jul 2015 21:49:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Dmitry,

After merging the input tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/input/keyboard/samsung-keypad.c: In function 'samsung_keypad_parse_dt':
drivers/input/keyboard/samsung-keypad.c:302:40: error: 'pp' undeclared (first use in this function)
  pdata->wakeup = of_property_read_bool(pp, "wakeup-source") ||
                                        ^

Caused by commit

  7e324dd6cc21 ("Input: samsung-keypad - change name of wakeup property")

Please at least build test these changes :-(

I have used the input tree from next-20150723 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
