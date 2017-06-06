From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: bad base for the dmi quilt series
Date: Wed, 7 Jun 2017 09:29:08 +1000
Message-ID: <20170607092908.57059982@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60741 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751440AbdFFX3K (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 6 Jun 2017 19:29:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Jean,

The current version of the dmi quilt series
(http://jdelvare.nerim.net/devel/linux/jdelvare-dmi/) has a base of
4.11.3 ... it must be base on somewhere in Linus' tree.   I have used
v4.11 as a base for today (the patches applied cleanly).

-- 
Cheers,
Stephen Rothwell
