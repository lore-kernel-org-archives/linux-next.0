From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: memblock compile warnings
Date: Fri, 25 Feb 2011 14:22:04 +0100
Message-ID: <20110225132204.GA7469@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate2.uk.ibm.com ([194.196.100.162]:43517 "EHLO
	mtagate2.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755636Ab1BYNWH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 25 Feb 2011 08:22:07 -0500
Received: from d06nrmr1707.portsmouth.uk.ibm.com (d06nrmr1707.portsmouth.uk.ibm.com [9.149.39.225])
	by mtagate2.uk.ibm.com (8.13.1/8.13.1) with ESMTP id p1PDM5du002035
	for <linux-next@vger.kernel.org>; Fri, 25 Feb 2011 13:22:05 GMT
Received: from d06av07.portsmouth.uk.ibm.com (d06av07.portsmouth.uk.ibm.com [9.149.37.248])
	by d06nrmr1707.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id p1PDMFa51802348
	for <linux-next@vger.kernel.org>; Fri, 25 Feb 2011 13:22:15 GMT
Received: from d06av07.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id p1PDM5pL027374
	for <linux-next@vger.kernel.org>; Fri, 25 Feb 2011 06:22:05 -0700
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Yinghai Lu <yinghai@kernel.org>, "H. Peter Anvin" <hpa@linux.intel.com>
Cc: linux-next@vger.kernel.org

Hi Yinghai,

your memblock code triggers generated these warnings on s390:

mm/page_alloc.c:3623:22: warning: 'last_active_region_index_in_nid' defined but not used
mm/page_alloc.c:3638:22: warning: 'previous_active_region_index_in_nid' defined but not used

please fix. Thanks.
