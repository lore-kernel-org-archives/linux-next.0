From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: manual merge of the pm tree with the i2c tree
Date: Fri, 12 Jan 2018 13:44:21 +0100
Message-ID: <1560882.YLD57UpMaU@aspire.rjw.lan>
References: <20180112102729.1868451c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180112102729.1868451c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Wolfram Sang <wsa@the-dreams.de>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Phil Reid <preid@electromag.com.au>
List-Id: linux-next.vger.kernel.org

On Friday, January 12, 2018 12:27:29 AM CET Stephen Rothwell wrote:
> Hi Rafael,
> 
> Today's linux-next merge of the pm tree got a conflict in:
> 
>   drivers/i2c/busses/i2c-designware-platdrv.c
> 
> between commit:
> 
>   0326f9f801b2 ("i2c: designware: rename i2c_dw_plat_prepare_clk to i2c_dw_prepare_clk")
> 
> from the i2c tree and commit:
> 
>   02e45646d53b ("PM: i2c-designware-platdrv: Optimize power management")
> 
> from the pm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

The fix looks good to me.

Thanks!
