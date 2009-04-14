From: Sachin Sant <sachinp@in.ibm.com>
Subject: Next 14: s390x defconfig build failure
Date: Tue, 14 Apr 2009 14:10:53 +0530
Message-ID: <49E44C15.4050208@in.ibm.com>
References: <20090414160809.e92d9d3e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp02.in.ibm.com ([59.145.155.2]:39505 "EHLO
	e28smtp02.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750746AbZDNIk6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Apr 2009 04:40:58 -0400
In-Reply-To: <20090414160809.e92d9d3e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, fweisbec@gmail.com, linux-s390@vger.kernel.org

Today's next tree build (defconfig s390x ) failed with following
error.

In file included from kernel/panic.c:11:
include/linux/debug_locks.h: In function __debug_locks_off:
include/linux/debug_locks.h:15: error: implicit declaration of function xchg

Probably because of commit 9eeba6138cefc0435695463ddadb0d95e0a6bcd2.

Thanks
-Sachin


-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
