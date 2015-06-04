From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: ARM allnoconfig and arm_lowmem_init
Date: Thu, 4 Jun 2015 09:45:27 -0400
Message-ID: <55705677.6060808@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:44259 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932075AbbFDNrw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Jun 2015 09:47:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Laura Abbott <labbott@redhat.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Russell King <rmk+kernel@arm.linux.org.uk>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

Hi Laura,

The following linux-next build fails:

http://kisskb.ellerman.id.au/kisskb/buildresult/12436251/

I assumed it was fallout from my init changes, but a bisect led to:

make[1]: Leaving directory '/home/paul/git/no'
618ba914137d7452a103d6131034c11366961594 is the first bad commit
commit 618ba914137d7452a103d6131034c11366961594
Author: labbott <labbott@redhat.com>
Date:   Thu May 14 19:31:58 2015 +0100

    ARM: 8358/1: Don't use memblock limit for the lowmem bound

Just a heads-up; I have not investigated any further than that.

Thanks,
Paul.
