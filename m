From: Mimi Zohar <zohar@linux.vnet.ibm.com>
Subject: IMA kexec patches
Date: Tue, 15 Nov 2016 10:24:17 -0500
Message-ID: <1479223457.3316.88.camel@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:57920 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S932515AbcKOPY3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Nov 2016 10:24:29 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id uAFFO6Ng057664
        for <linux-next@vger.kernel.org>; Tue, 15 Nov 2016 10:24:28 -0500
Received: from e23smtp04.au.ibm.com (e23smtp04.au.ibm.com [202.81.31.146])
        by mx0a-001b2d01.pphosted.com with ESMTP id 26r438txqu-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Tue, 15 Nov 2016 10:24:28 -0500
Received: from localhost
        by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <zohar@linux.vnet.ibm.com>;
        Wed, 16 Nov 2016 01:24:25 +1000
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ima-devel <linux-ima-devel@lists.sourceforge.net>, Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>

Hi  Andrew,

Thank you for carrying the IMA kexec patches.  I have a couple of
patches that need to be included in linux-next.  (I've just pushed them
to my #next branch.)  On 11/10, I posted a more recent version of the
IMA kexec patches based on top these fixes, with some bug fixes and
cleanup, based on Dmitry Kasatkin's review.

The latest version of the IMA kexec patches are available in the
#next-kexec-restore  branch, which are on top of Thiago's patches.
Sorry for any inconvenience.

Mimi
