From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the net tree
Date: Thu, 8 Feb 2018 14:27:13 +1100
Message-ID: <20180208142713.406cbecd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50203 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750806AbeBHD1Q (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Feb 2018 22:27:16 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Md. Islam" <mislam4@kent.edu>

Hi all,

Commit

  043e337f555e ("sch_netem: Bug fixing in calculating Netem interval")

is missing a Signed-off-by from its author.

-- 
Cheers,
Stephen Rothwell
