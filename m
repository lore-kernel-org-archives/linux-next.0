From: Jin Park <jinyoungp@nvidia.com>
Subject: Re: linux-next: build failure in drivers/mfd/aat2870-core.c
Date: Fri, 30 Sep 2011 20:47:41 +0900
Message-ID: <CAMfhKb9dTY_OemQAgJokHn=DzaHn2hpi8UHRGvtFOv7a0SEjkg@mail.gmail.com>
References: <4E839B53.3010201@windriver.com> <D9A2FA38A1E15B4E832469E5FE40C7ABFA07D3E667@HKMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:43474 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932100Ab1I3LsV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 30 Sep 2011 07:48:21 -0400
Received: by vws1 with SMTP id 1so1211304vws.19
        for <linux-next@vger.kernel.org>; Fri, 30 Sep 2011 04:48:21 -0700 (PDT)
In-Reply-To: <D9A2FA38A1E15B4E832469E5FE40C7ABFA07D3E667@HKMAIL01.nvidia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>, Samuel Ortiz <sameo@linux.intel.com>
Cc: linux-next@vger.kernel.org

Hi, Paul

I have checked aat2870-core.c build problem when x86_64 and got the
same error with you.

This error occurred since merged below change.
----------------------------------------------------------------------------------
commit da417bacc9143b934f1a480a25d0fb2bb648a820
Author: Stephen Boyd <sboyd@codeaurora.org>
Date:   Wed Sep 28 10:50:29 2011 +1000

    x86: implement strict user copy checks for x86_64
----------------------------------------------------------------------------------
The above change is check object size and copy size for
copy_from_user() to prevent overflow.

The root cause is not matched type of size parameter for
copy_from_user() in aat2870-core.c for x86_64.
Because I just passed int type for size parameter to copy_from_user().
It has no problem for i386, but has problem for x86_64.


This is the patch for this build problem. Please review it.

mfd: aat2870: Fix build failure for x86_64

Signed-off-by: Jin Park <jinyoungp@nvidia.com>
---
 drivers/mfd/aat2870-core.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mfd/aat2870-core.c b/drivers/mfd/aat2870-core.c
index 345dc65..02c4201 100644
--- a/drivers/mfd/aat2870-core.c
+++ b/drivers/mfd/aat2870-core.c
@@ -295,7 +295,7 @@ static ssize_t aat2870_reg_write_file(struct file *file,
 {
 	struct aat2870_data *aat2870 = file->private_data;
 	char buf[32];
-	int buf_size;
+	ssize_t buf_size;
 	char *start = buf;
 	unsigned long addr, val;
 	int ret;
-- 
1.7.1

Thanks,
Jin Park
