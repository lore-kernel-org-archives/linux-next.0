From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: build failure after merge of the pm tree
Date: Mon, 26 Nov 2012 11:10:09 +0100
Message-ID: <1809962.ISd4pqTkPA@vostro.rjw.lan>
References: <20121126170919.f7009838d3126e547205a705@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121126170919.f7009838d3126e547205a705@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nishanth Menon <nm@ti.com>, MyungJoo Ham <myungjoo.ham@samsung.com>
List-Id: linux-next.vger.kernel.org

On Monday, November 26, 2012 05:09:19 PM Stephen Rothwell wrote:
> Hi Rafael,
> 
> After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/devfreq/governor_simpleondemand.c: In function 'devfreq_simple_ondemand_func':
> drivers/devfreq/governor_simpleondemand.c:36:11: error: dereferencing pointer to incomplete type
> drivers/devfreq/governor_simpleondemand.c:37:27: error: dereferencing pointer to incomplete type
> drivers/devfreq/governor_simpleondemand.c:38:11: error: dereferencing pointer to incomplete type
> drivers/devfreq/governor_simpleondemand.c:39:32: error: dereferencing pointer to incomplete type
> 
> Caused by commit eff607fdb1f7 ("PM / devfreq: governors: add GPL module
> license and allow module build").  The definition of struct
> devfreq_simple_ondemand_data depends on
> CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND, but this is a modular build, so
> CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND_MODULE is defined instead.
> 
> I have used the pm tree fomr next-20121115 for today.

Sorry for the breakage, I've dropped the most recent devfreq patches from
my linux-next branch for now.

Thanks,
Rafael


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
