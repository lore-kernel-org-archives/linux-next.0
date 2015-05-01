From: Gobinda Maji <gobinda.cemk07@gmail.com>
Subject: Re: [PATCH 9/9] sysfs: disallow world-writable files.
Date: Fri, 1 May 2015 17:29:35 +0530
Message-ID: <CAB_aHcxTeq7R6ON+73KLKeec-q9Ad0ddOcmYgObP77Ygtho4bQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:36332 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751270AbbEAL7g (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 May 2015 07:59:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 30 April 2015 at 07:32, Rusty Russell <rusty@rustcorp.com.au> wrote:

> You're absolutely right, well spotted!  The checks can be tightened.  We
> don't really care about execute, but logically write is "more
> privileged" than read.
>
> Best to separate the tests; OTHER_WRITABLE <= GROUP_WRITABLE <= OWNER_WRITABLE
> and OTHER_READABLE <= GROUP_READABLE <= OWNER_READABLE.
>
> A patch would be welcome!

Thanks for the suggestion. OTHER_WRITABLE is already not permitted.
So, added the checks for GROUP_WRITABLE <= OWNER_WRITABLE for write
and OTHER_READABLE <= GROUP_READABLE <= OWNER_READABLE for read.

I am just sending a separate patch for this. The subject line will be
"[PATCH] sysfs: tightened sysfs permission checks"

-- 
Thanks,
Gobinda
