From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the drm tree
Date: Thu, 4 May 2017 11:42:30 +1000
Message-ID: <20170504114230.02793761@canb.auug.org.au>
References: <20170504083336.35ed36ee@canb.auug.org.au>
        <tencent_62AF37B85899E2EA593CCE3B@qq.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35249 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752642AbdEDBmd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 May 2017 21:42:33 -0400
In-Reply-To: <tencent_62AF37B85899E2EA593CCE3B@qq.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jeffy <jeffy.chen@rock-chips.com>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradea" <linux-arm-kernel@lists.infradead.org>, ": Dave Airlie" <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>, Linux-NextMailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Jeffy,

On Thu, 4 May 2017 09:18:12 +0800 "Jeffy" <jeffy.chen@rock-chips.com> wrote:
>
> it should be fixed by "Arnd Bergmann"<arnd@arndb.de>(thanks a lot by the way) in:
> 
> 4a85aae multi_v7_defconfig: make Rockchip DRM drivers built-in

Thanks for the heads up, I will await the arm-soc merges.

-- 
Cheers,
Stephen Rothwell
