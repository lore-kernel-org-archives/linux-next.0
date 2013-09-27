From: Chris Ball <cjb@laptop.org>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Fri, 27 Sep 2013 15:40:10 +0100
Message-ID: <86a9iycoqd.fsf@void.printf.net>
References: <20130927183246.13094a90de1676232e17d30e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130927183246.13094a90de1676232e17d30e@canb.auug.org.au>
	(Stephen Rothwell's message of "Fri, 27 Sep 2013 18:32:46 +1000")
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dong Aisheng <b29396@freescale.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Fri, Sep 27 2013, Stephen Rothwell wrote:
> drivers/mmc/host/sdhci-of-esdhc.c: In function 'esdhc_of_set_clock':
> drivers/mmc/host/sdhci-of-esdhc.c:230:10: error: 'host_clock' undeclared (first use in this function)
>    clock, host_clock / pre_div / div);

Sorry about that.  I've pushed the proper fix out to mmc-next now,
so you can drop your temporary fix.

Thanks,

- Chris.
-- 
Chris Ball   <cjb@laptop.org>   <http://printf.net/>
