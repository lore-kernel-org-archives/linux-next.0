From: Luciano Coelho <coelho@ti.com>
Subject: Re: linux-next: manual merge of the wireless tree with Linus' tree
Date: Mon, 19 Sep 2011 08:28:42 +0300
Message-ID: <1316410122.2157.22.camel@cumari>
References: <20110919151434.e710fc8eb95675a2c6a278cd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110919151434.e710fc8eb95675a2c6a278cd@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Stephen

On Mon, 2011-09-19 at 15:14 +1000, Stephen Rothwell wrote: 
> Today's linux-next merge of the wireless tree got a conflict in
> drivers/net/wireless/wl12xx/main.c between commit 7a5e4877c14d ("wl12xx:
> add max_sched_scan_ssids value to the hw description") from Linus' tree
> and commit f952079a19c6 ("wl12xx: add support for multiple SSIDs in
> sched_scan") from the wireless tree.
> 
> I used the version from the wireless tree.

This is correct, the version from the wireless tree should be use (ie.,
setting the value to 8).  I guess wireless-next doesn't include the
change that went into Linus' tree yet.

-- 
Cheers,
Luca.
