From: Sachin Sant <sachinp@in.ibm.com>
Subject: [Patch next] powerpc: pseries/dtl.c should include asm/firmware.h
Date: Wed, 01 Apr 2009 15:57:42 +0530
Message-ID: <49D3419E.7000005@in.ibm.com>
References: <20090401164450.f8192631.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050404090408000502010008"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp01.au.ibm.com ([202.81.31.143]:49609 "EHLO
	e23smtp01.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751499AbZDAK1s (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 1 Apr 2009 06:27:48 -0400
Received: from d23relay02.au.ibm.com (d23relay02.au.ibm.com [202.81.31.244])
	by e23smtp01.au.ibm.com (8.13.1/8.13.1) with ESMTP id n31ARGhY019916
	for <linux-next@vger.kernel.org>; Wed, 1 Apr 2009 21:27:16 +1100
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
	by d23relay02.au.ibm.com (8.13.8/8.13.8/NCO v9.2) with ESMTP id n31ARjXX1020054
	for <linux-next@vger.kernel.org>; Wed, 1 Apr 2009 21:27:45 +1100
Received: from d23av01.au.ibm.com (loopback [127.0.0.1])
	by d23av01.au.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id n31ARiS3005388
	for <linux-next@vger.kernel.org>; Wed, 1 Apr 2009 21:27:45 +1100
In-Reply-To: <20090401164450.f8192631.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linuxppc-dev@ozlabs.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, jk@ozlabs.org

This is a multi-part message in MIME format.
--------------050404090408000502010008
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

randconfig build on powerpc failed with :


arch/powerpc/platforms/pseries/dtl.c: In function ‘dtl_init’:
arch/powerpc/platforms/pseries/dtl.c:238: error: implicit declaration of function ‘firmware_has_feature’
arch/powerpc/platforms/pseries/dtl.c:238: error: ‘FW_FEATURE_SPLPAR’ undeclared (first use in this function)
arch/powerpc/platforms/pseries/dtl.c:238: error: (Each undeclared identifier is reported only once
arch/powerpc/platforms/pseries/dtl.c:238: error: for each function it appears in.)

Signed-off-by : Sachin Sant <sachinp@in.ibm.com>
---



--------------050404090408000502010008
Content-Type: text/x-patch;
 name="fix-dtl-build-break.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline;
 filename="fix-dtl-build-break.patch"

* Fixes the following build error
*
* arch/powerpc/platforms/pseries/dtl.c: In function â€˜dtl_initâ€™:
* arch/powerpc/platforms/pseries/dtl.c:238:
*       error: implicit declaration of function â€˜firmware_has_featureâ€™
* arch/powerpc/platforms/pseries/dtl.c:238:
*       error: â€˜FW_FEATURE_SPLPARâ€™ undeclared (first use in this function)
* arch/powerpc/platforms/pseries/dtl.c:238:
*        error: (Each undeclared identifier is reported only once
* arch/powerpc/platforms/pseries/dtl.c:238: 
*        error: for each function it appears in.)

Signed-off-by : Sachin Sant <sachinp@in.ibm.com>
---

diff -Naurp a/arch/powerpc/platforms/pseries/dtl.c b/arch/powerpc/platforms/pseries/dtl.c
--- a/arch/powerpc/platforms/pseries/dtl.c	2009-04-01 15:46:59.000000000 +0530
+++ b/arch/powerpc/platforms/pseries/dtl.c	2009-04-01 15:47:58.000000000 +0530
@@ -25,6 +25,7 @@
 #include <asm/smp.h>
 #include <asm/system.h>
 #include <asm/uaccess.h>
+#include <asm/firmware.h>
 
 #include "plpar_wrappers.h"
 

--------------050404090408000502010008--
