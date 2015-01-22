From: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: kvms390 tree for Linux next
Date: Thu, 22 Jan 2015 14:36:16 +0100
Message-ID: <54C0FCD0.7080108@de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp17.uk.ibm.com ([195.75.94.113]:45764 "EHLO
	e06smtp17.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751396AbbAVNgV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 22 Jan 2015 08:36:21 -0500
Received: from /spool/local
	by e06smtp17.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <borntraeger@de.ibm.com>;
	Thu, 22 Jan 2015 13:36:19 -0000
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paolo Bonzini <pbonzini@redhat.com>, linux-next <linux-next@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Cornelia Huck <cornelia.huck@de.ibm.com>

Stephen,

can you add the kvms390 tree at

git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git next

to linux-next?

This tree will almost always be merged via the kvm tree, but it helps us anyway detecting broken things before I ask Paolo to pull.

Thanks a lot for your work on linux-next.

Christian
