From: Cyrill Gorcunov <gorcunov@gmail.com>
Subject: [RFC 0/4] netfilter conntrack sysctls pernet support
Date: Mon, 09 Mar 2009 21:16:28 +0300
Message-ID: <20090309181628.109019157@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ti-out-0910.google.com ([209.85.142.191]:1993 "EHLO
	ti-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752623AbZCIS1Y (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 9 Mar 2009 14:27:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: davem@davemloft.net, kaber@trash.net
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, xemul@openvz.org, adobriyan@gmail.com

Hi here are a few patches to bring in per-net functionality
for several conntrack protocols: DCCP, SCTP, UDPlite.

Since these protos could be built as modules I've put
per-net operations to module init/exit routines. The change
I would like you point the attention is that module static
variables being marked as __read_mostly become now as dynamically
allocated -- is it acceptable trade off?

For protocols being built in (like TCP, UDP, ICMP) for which I made
patches too but they are in a bit 'rought' state: in original
code there some kind of reference counter to sysctl tables being
registered (and they don't have any kind of mb, didn't check if it
could be a problem for SMP since they are mostly __init functions)
so I need some kind of same functionality to count per-net calls.
Will send RFC for these protocols soon.

So eventually I would like to hear some kind of feedback on this.
Ideas and any kind of comments are highly appreciated.

The patches are on top of -net-next-2.6

Cyrill
