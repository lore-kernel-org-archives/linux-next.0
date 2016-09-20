From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: linux-next: manual merge of the amlogic tree with the arm-soc tree
Date: Tue, 20 Sep 2016 14:02:25 -0700
Message-ID: <7hk2e6i8ta.fsf@baylibre.com>
References: <20160920101938.5d46a0ab@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:34640 "EHLO
        mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752931AbcITVCa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Sep 2016 17:02:30 -0400
Received: by mail-pa0-f48.google.com with SMTP id wk8so10600907pab.1
        for <linux-next@vger.kernel.org>; Tue, 20 Sep 2016 14:02:30 -0700 (PDT)
In-Reply-To: <20160920101938.5d46a0ab@canb.auug.org.au> (Stephen Rothwell's
        message of "Tue, 20 Sep 2016 10:19:38 +1000")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Carlo Caione <carlo@caione.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> Today's linux-next merge of the amlogic tree got a conflict in:
>
>   arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
>
> between commit:
>
>   8735053d7968 ("ARM64: dts: meson-gxbb-p20x: Enable USB Nodes")
>
> from the arm-soc tree and commit:
>
>   d82801a385a1 ("ARM64: dts: meson-gxbb-p20x: Enable USB Nodes")
>
> from the amlogic tree.
>
> This patch was modified before being merged into the arm-soc tree.
> Please clean up the amlogic tree.

Cleaned up.

I forgot to push the updated amlogic/for-next after sending pull
requests to arm-soc.

Kevin
