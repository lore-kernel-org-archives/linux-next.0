From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: manual merge of the pm tree with the arm-soc tree
Date: Thu, 20 Apr 2017 02:38:10 +0200
Message-ID: <4444301.nE19g0hn7H@aspire.rjw.lan>
References: <20170420103427.62fbf195@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cloudserver094114.home.net.pl ([79.96.170.134]:43834 "EHLO
        cloudserver094114.home.net.pl" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S937806AbdDTAoR (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 19 Apr 2017 20:44:17 -0400
In-Reply-To: <20170420103427.62fbf195@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Quentin Schulz <quentin.schulz@free-electrons.com>

On Thursday, April 20, 2017 10:34:27 AM Stephen Rothwell wrote:
> Hi Rafael,
> 
> Today's linux-next merge of the pm tree got a conflict in:
> 
>   arch/arm/boot/dts/sun8i-a33.dtsi
> 
> between commits:
> 
>   66c373228dc4 ("ARM: sun8i: a33: Add the Mali OPPs")
>   e6bd37627e92 ("ARM: sun8i: a33: add all operating points")
> 
> from the arm-soc tree and commit:
> 
>   d87bd1942058 ("PM / OPP: Use - instead of @ for DT entries")
> 
> from the pm tree.

Thanks for the report!

I'm going to drop the conflicting commit tomorrow.

Thanks,
Rafael
