From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the thermal tree
Date: Fri, 1 Sep 2017 10:52:03 +1000
Message-ID: <20170901105203.2948dba8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49923 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750868AbdIAAwG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 31 Aug 2017 20:52:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Zhang Rui <rui.zhang@intel.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Zhang,

After merging the thermal tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/thermal/int340x_thermal/int3406_thermal.c: In function 'int3406_thermal_get_limit':
drivers/thermal/int340x_thermal/int3406_thermal.c:116:6: warning: unused variable 'index' [-Wunused-variable]
  int index;
      ^

Introduced by commit

  c658894562ba ("Thermal: int3406_thermal: fix thermal sysfs I/F")

-- 
Cheers,
Stephen Rothwell
