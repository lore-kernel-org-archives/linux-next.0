From: Harvey Harrison <harvey.harrison@gmail.com>
Subject: net: new warnings in linux-next
Date: Thu, 17 Jul 2008 14:13:20 -0700
Message-ID: <1216329200.6029.20.camel@brick>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rn-out-0910.google.com ([64.233.170.184]:28209 "EHLO
	rn-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759993AbYGQVNY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Jul 2008 17:13:24 -0400
Received: by rn-out-0910.google.com with SMTP id k40so88742rnd.17
        for <linux-next@vger.kernel.org>; Thu, 17 Jul 2008 14:13:23 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-netdev <netdev@vger.kernel.org>
Cc: linux-next <linux-next@vger.kernel.org>

Appears in next-20080717

> net/sysctl_net.c:64:12: warning: incorrect type in initializer (different base types)
> net/sysctl_net.c:64:12:    expected struct ctl_table_set *( *lookup )( ... )
> net/sysctl_net.c:64:12:    got struct list_head *( static [toplevel] *<noident> )( ... )
> net/sysctl_net.c:64: warning: initialization from incompatible pointer type

Cheers,

Harvey
