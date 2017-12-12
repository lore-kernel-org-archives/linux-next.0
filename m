From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the usb.current
 tree
Date: Wed, 13 Dec 2017 07:50:57 +1100
Message-ID: <20171213075057.41f68b05@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37079 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751813AbdLLUvA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 Dec 2017 15:51:00 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrey Konovalov <andreyknvl@google.com>

Hi Greg,

Commit

  32fd87b3bbf5 ("USB: core: only clean up what we allocated")

is missing a Signed-off-by from its author.

-- 
Cheers,
Stephen Rothwell
