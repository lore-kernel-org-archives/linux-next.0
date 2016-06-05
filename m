From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the amlogic tree
Date: Mon, 6 Jun 2016 09:55:59 +1000
Message-ID: <20160606095559.67cf4f00@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52843 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751798AbcFEX4D (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 5 Jun 2016 19:56:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kevin Hilman <khilman@baylibre.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>

Hi Kevin,

After merging the amlogic tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from arch/arm/boot/dts/meson8b-mxq.dts:48:0:
arch/arm/boot/dts/meson8b.dtsi:49:53: fatal error: dt-bindings/reset/amlogic,meson8b-reset.h: No such file or directory
In file included from arch/arm/boot/dts/meson8b-odroidc1.dts:48:0:
arch/arm/boot/dts/meson8b.dtsi:49:53: fatal error: dt-bindings/reset/amlogic,meson8b-reset.h: No such file or directory

Caused by commit

  bf205ad75a17 ("ARM: dts: amlogic: Enable Reset Controller on Meson8b platforms")

I guess a file was forgotten.

I have dorpped the amlogic tree for today.

-- 
Cheers,
Stephen Rothwell
