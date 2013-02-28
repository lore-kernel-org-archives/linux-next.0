From: Mark Salter <msalter@redhat.com>
Subject: no-MMU build failure
Date: Thu, 28 Feb 2013 15:08:24 -0500
Message-ID: <1362082104.7319.13.camel@t520.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:54354 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752585Ab3B1UIZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 28 Feb 2013 15:08:25 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: linux-next <linux-next@vger.kernel.org>

I'm seeing a build failure in linux-next for c6x (no-MMU):

  /linux-next/mm/shmem.c: In function 'shmem_file_setup':
  /linux-next/mm/shmem.c:2936:2: error: 'error' undeclared (first use in this function)

Looks like it is due to this commit:

  commit 6b4d0b2793337cc8943cd2948388218e2777400c
  Author: Al Viro <viro@zeniv.linux.org.uk>
  Date:   Thu Feb 14 21:37:26 2013 -0500

      clean shmem_file_setup() a bit
    
--Mark
