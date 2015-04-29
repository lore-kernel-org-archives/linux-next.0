From: Gobinda Maji <gobinda.cemk07@gmail.com>
Subject: Re: [PATCH 9/9] sysfs: disallow world-writable files.
Date: Wed, 29 Apr 2015 17:40:33 +0530
Message-ID: <CAB_aHcxDvUnqNaEJDhQ7e1Jd4U3-qvV1=99uyiBfD1384jku5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:34331 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1422762AbbD2MKd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Apr 2015 08:10:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: rusty@rustcorp.com.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Rusty,

I have a small doubt about the permission restriction (User perms >=
group perms >= other perms) in VERIFY_OCTAL_PERMISSIONS(). Please Note
that permission field of User, Group or Other consists of three bits.
LSB is EXECUTE permission, MSB is READ permission and the middle bit
is WRITE permission. Say for example, permission value is "0431". Here
User has only READ permission whereas Group has both WRITE and EXECUTE
permission and Other has EXECUTE permission. I guess, it is not good
to give Group the WRITE permission whereas User itself has no WRITE
permission.
May be, it's better to check those three permissions bit wise rather than
as a whole.
I already had posted my query at:

http://thread.gmane.org/gmane.linux.kernel/1667095/focus=1737833

But could get any reply.

Please rethink about my point and let me know your opinion.

Thanks,
Gobinda
