From: Guenter Roeck <linux@roeck-us.net>
Subject: Commit f26150004 (metag: use common of_flat_dt_match_machine) causes
 metag build failures in linux-next
Date: Sun, 06 Oct 2013 11:26:26 -0700
Message-ID: <5251AB52.3000506@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.active-venture.com ([67.228.131.205]:61129 "EHLO
	mail.active-venture.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754074Ab3JFS0b (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 6 Oct 2013 14:26:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Herring <rob.herring@calxeda.com>
Cc: James Hogan <james.hogan@imgtec.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, linux-metag@vger.kernel.org

arch/metag/kernel/devtree.c: In function 'setup_machine_fdt':
arch/metag/kernel/devtree.c:52: error: 'arch_get_next_mach' undeclared (first use in this function)
arch/metag/kernel/devtree.c:52: error: (Each undeclared identifier is reported only once
arch/metag/kernel/devtree.c:52: error: for each function it appears in.)
arch/metag/kernel/devtree.c:52: warning: assignment discards qualifiers from pointer target type
make[1]: *** [arch/metag/kernel/devtree.o] Error 1

Not surprising, since arch_get_next_mach() is not defined for metag.

Guenter
