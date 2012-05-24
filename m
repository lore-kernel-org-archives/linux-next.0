From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: "blackfin: twi: move twi bit mask macro to twi head
 file"
Date: Wed, 23 May 2012 20:59:40 -0400
Message-ID: <20120524005940.GB24787@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:62328 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751409Ab2EXA76 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 23 May 2012 20:59:58 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sonic Zhang <sonic.zhang@analog.com>
Cc: Bob Liu <lliubbo@gmail.com>, linux-next@vger.kernel.org, uclinux-dist-devel@blackfin.uclinux.org

Hi all,

This commit:

------
commit c55c89e939f2a0a83d5c61462be554d5d2408178
Author: Sonic Zhang <sonic.zhang@analog.com>
Date:   Thu Nov 24 17:40:07 2011 +0800

    blackfin: twi: move twi bit mask macro to twi head file
    
    Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
    Signed-off-by: Bob Liu <lliubbo@gmail.com>
------

seems to break linux-next builds, such as this:

	http://kisskb.ellerman.id.au/kisskb/buildresult/6353497/

Please have a look, thanks.
Paul.
