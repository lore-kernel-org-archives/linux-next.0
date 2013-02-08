From: Wim Van Sebroeck <wim@iguana.be>
Subject: Re: linux-next: manual merge of the watchdog tree with the mfd tree
Date: Fri, 8 Feb 2013 12:36:26 +0100
Message-ID: <20130208113626.GV7867@spo001.leaseweb.com>
References: <20130208125220.37a34d89ea4cc7e43b27cf4e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130208125220.37a34d89ea4cc7e43b27cf4e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio Baltieri <fabio.baltieri@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Aaro Koskinen <aaro.koskinen@iki.fi>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

> Today's linux-next merge of the watchdog tree got conflicts in
> drivers/watchdog/Kconfig and drivers/watchdog/Makefile between commit
> 699ff59052e7 ("watchdog: Add support for ux500_wdt watchdog") from the
> mfd tree and commit 77b709cb6c9d ("watchdog: introduce retu_wdt driver")
> from the watchdog tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks!

Kind regards,
Wim.
