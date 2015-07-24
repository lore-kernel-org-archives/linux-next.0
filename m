From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: build failure after merge of the input tree
Date: Thu, 23 Jul 2015 19:33:56 -0700
Message-ID: <2C7FE445-2730-40BF-9CB3-F193D4018C8A@gmail.com>
References: <20150724114936.3381b80c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:34740 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752207AbbGXCeG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Jul 2015 22:34:06 -0400
In-Reply-To: <20150724114936.3381b80c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Stephen,

On July 23, 2015 6:49:36 PM PDT, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>Hi Dmitry,
>
>After merging the input tree, today's linux-next build (arm
>multi_v7_defconfig) failed like this:
>
>drivers/input/keyboard/samsung-keypad.c: In function
>'samsung_keypad_parse_dt':
>drivers/input/keyboard/samsung-keypad.c:302:40: error: 'pp' undeclared
>(first use in this function)
>  pdata->wakeup = of_property_read_bool(pp, "wakeup-source") ||
>                                        ^
>
>Caused by commit
>
>7e324dd6cc21 ("Input: samsung-keypad - change name of wakeup property")

Sorry about this, you managed to grab the tree in the couple of hours while the bad commit was there, it should all be corrected now.

Thanks.

-- 
Dmitry
