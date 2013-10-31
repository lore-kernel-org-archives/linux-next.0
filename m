From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: [BUG -next] sysfs change breaks userspace
Date: Thu, 31 Oct 2013 12:43:58 +0100
Message-ID: <20131031114358.GA5551@osiris>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp12.uk.ibm.com ([195.75.94.108]:38474 "EHLO
	e06smtp12.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751381Ab3JaLoH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 31 Oct 2013 07:44:07 -0400
Received: from /spool/local
	by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
	Thu, 31 Oct 2013 11:44:04 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id 21CC717D8057
	for <linux-next@vger.kernel.org>; Thu, 31 Oct 2013 11:43:35 +0000 (GMT)
Received: from d06av01.portsmouth.uk.ibm.com (d06av01.portsmouth.uk.ibm.com [9.149.37.212])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id r9VBhmbX63176734
	for <linux-next@vger.kernel.org>; Thu, 31 Oct 2013 11:43:48 GMT
Received: from d06av01.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av01.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id r9VBhxZC028368
	for <linux-next@vger.kernel.org>; Thu, 31 Oct 2013 05:44:00 -0600
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kay Sievers <kay@vrfy.org>, linux-next@vger.kernel.org

Hi Tejun,

I just tried out linux-next and my network doesn't come up anymore.
Userspace fails like this:

network[2211]: Bringing up interface eth0:  sysfs read broadcast value: Invalid argument

I bisected that down to:

commit 13c589d5b0ac654d9da7e490a2dd548e6b86b4a5
Author: Tejun Heo <tj@kernel.org>
Date:   Tue Oct 1 17:42:02 2013 -0400

    sysfs: use seq_file when reading regular files
    
    sysfs read path implements its own buffering scheme between userland
    and kernel callbacks, which essentially is a degenerate duplicate of
    seq_file.  This patch replaces the custom read buffering
    implementation in sysfs with seq_file.
    
    While the amount of code reduction is small, this reduces low level
    hairiness and enables future development of a new versatile API based
    on seq_file so that sysfs features can be shared with other
    subsystems.
    
    As write path was already converted to not use sysfs_open_file->page,
    this patch makes ->page and ->count unused and removes them.
    
    Userland behavior remains the same except for some extreme corner
    cases - e.g. sysfs will now regenerate the content each time a file is
    read after a non-contiguous seek whereas the original code would keep
    using the same content.  While this is a userland visible behavior
    change, it is extremely unlikely to be noticeable and brings sysfs
    behavior closer to that of procfs.
    
    Signed-off-by: Tejun Heo <tj@kernel.org>
    Cc: Kay Sievers <kay@vrfy.org>
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
