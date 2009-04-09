From: Sachin Sant <sachinp@in.ibm.com>
Subject: Next April 9 : x86 allmodconfig media/video/cx88 build break
Date: Thu, 09 Apr 2009 15:38:59 +0530
Message-ID: <49DDC93B.8020106@in.ibm.com>
References: <20090409163305.8c7a0371.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp02.in.ibm.com ([59.145.155.2]:59413 "EHLO
	e28smtp02.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1765953AbZDIKJD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 9 Apr 2009 06:09:03 -0400
In-Reply-To: <20090409163305.8c7a0371.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-media@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Today's Next tree allmodconfig build on x86 failed with

ERROR: __divdi3 [drivers/media/video/cx88/cx88xx.ko] undefined!

Thanks
-Sachin

-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
