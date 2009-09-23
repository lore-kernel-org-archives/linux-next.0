From: Jean Delvare <khali@linux-fr.org>
Subject: Re: linux-next: manual merge of the jdelvare-hwmon tree with Linus'
  tree
Date: Wed, 23 Sep 2009 10:51:15 +0200
Message-ID: <20090923105115.506dc61c@hyperion.delvare>
References: <20090923114257.e6e101cf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bamako.nerim.net ([62.4.17.28]:60534 "EHLO bamako.nerim.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754527AbZIWIvO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 23 Sep 2009 04:51:14 -0400
In-Reply-To: <20090923114257.e6e101cf.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rudolf Marek <r.marek@assembler.cz>, Michael Riepe <michael.riepe@googlemail.com>, Andrew Morton <akpm@linux-foundation.org>

Hi Stephen,

On Wed, 23 Sep 2009 11:42:57 +1000, Stephen Rothwell wrote:
> Today's linux-next merge of the jdelvare-hwmon tree got a conflict in
> drivers/hwmon/coretemp.c between commit
> 0bf41d9f414a5cf558aff234a0ff486257537574 ("drivers/hwmon/coretemp.c:
> enable the Intel Atom") from Linus' tree and commit
> af663ff4d88e09c4e45661251e3c1eeff147ffc1 ("hwmon: (coretemp) Add support
> for Atom CPUs") from the jdelvare-hwmon tree.
> 
> I used the version from the jdelvare-hwmon for today.

Thanks for the heads up. Apparently someone managed to sneak in broken
Atom support into coretemp, while I have a working version in my hwmon
tree, which I intend to push to Linus today. I'll rebase my patch on
upstream so that it applies again, and I'll send it quickly.

-- 
Jean Delvare
