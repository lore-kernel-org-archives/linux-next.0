From: "Sachin P. Sant" <sachinp@in.ibm.com>
Subject: next-20090202 build failure : arch/x86/kvm/kvm.ko
Date: Mon, 02 Feb 2009 22:26:58 +0530
Message-ID: <498725DA.7080803@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp02.au.ibm.com ([202.81.31.144]:35151 "EHLO
	e23smtp02.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753144AbZBBQ5E (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Feb 2009 11:57:04 -0500
Received: from d23relay01.au.ibm.com (d23relay01.au.ibm.com [202.81.31.243])
	by e23smtp02.au.ibm.com (8.13.1/8.13.1) with ESMTP id n12GtteU017909
	for <linux-next@vger.kernel.org>; Tue, 3 Feb 2009 03:55:55 +1100
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
	by d23relay01.au.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id n12GvJ3e319710
	for <linux-next@vger.kernel.org>; Tue, 3 Feb 2009 03:57:19 +1100
Received: from d23av02.au.ibm.com (loopback [127.0.0.1])
	by d23av02.au.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id n12Gv1PB020619
	for <linux-next@vger.kernel.org>; Tue, 3 Feb 2009 03:57:02 +1100
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: sfr@canb.auug.org.au, Mel Gorman <mel@csn.ul.ie>

Hi Stephen,

Allmodconfig build on a x86 box fails with 

ERROR: "__moddi3" [arch/x86/kvm/kvm.ko] undefined!
WARNING: modpost: Found 2 section mismatch(es).
To see full details build your kernel with:
make CONFIG_DEBUG_SECTION_MISMATCH=y
make[1]: *** [__modpost] Error 1
make: *** [modules] Error 2

Look like a patch for this has been already here :

http://kerneltrap.org/mailarchive/linux-kvm/2009/1/26/4811414

Thanks
-Sachin


-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
