From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the net-next tree
Date: Fri, 22 Sep 2017 11:03:55 +1000
Message-ID: <20170922110355.6a631fc5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33753 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751779AbdIVBD5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 Sep 2017 21:03:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paolo Abeni <pabeni@redhat.com>

Hi all,

After merging the net-next tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

net/ipv4/fib_frontend.c: In function 'fib_validate_source':
net/ipv4/fib_frontend.c:411:16: error: 'struct netns_ipv4' has no member named 'fib_has_custom_local_routes'
   if (net->ipv4.fib_has_custom_local_routes)
                ^
net/ipv4/fib_frontend.c: In function 'inet_rtm_newroute':
net/ipv4/fib_frontend.c:773:12: error: 'struct netns_ipv4' has no member named 'fib_has_custom_local_routes'
   net->ipv4.fib_has_custom_local_routes = true;
            ^

Caused by commit

  6e617de84e87 ("net: avoid a full fib lookup when rp_filter is disabled.")

This build has CONFIG_IP_MULTIPLE_TABLES unset.

I have reverted that commit for today.

-- 
Cheers,
Stephen Rothwell
