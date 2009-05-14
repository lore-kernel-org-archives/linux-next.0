From: Sachin Sant <sachinp@in.ibm.com>
Subject: Re: Next May 13:[drivers/base/firmware*] Bug while booting on x86
Date: Thu, 14 May 2009 11:01:54 +0530
Message-ID: <4A0BACCA.5050103@in.ibm.com>
References: <20090513164832.c8a0de7d.sfr@canb.auug.org.au> <4A0AC5E6.2010402@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp04.in.ibm.com ([59.145.155.4]:40638 "EHLO
	e28smtp04.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751058AbZENFb6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 14 May 2009 01:31:58 -0400
In-Reply-To: <4A0AC5E6.2010402@in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, David.Woodhouse@intel.com

Sachin Sant wrote:
> Call Trace:
> [<c02f417c>] ? firmware_data_write+0x1cb/0x211
> [<c02f3fb1>] ? firmware_data_write+0x0/0x211
> [<c01e618a>] ? write+0x113/0x14a
Could be because of the following patch which last changed the
code in question.

firmware: speed up request_firmware()
http://patchwork.kernel.org/patch/17531/

I will try reverting this patch and check if that helps.

thanks
-Sachin

-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
