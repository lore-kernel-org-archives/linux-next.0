From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Request inclusion of ARM v7 cache optimization patch into linux-next
Date: Mon, 25 Nov 2013 11:23:18 +0000
Message-ID: <20131125112318.GA4179@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:39385 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752900Ab3KYLX1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Nov 2013 06:23:27 -0500
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux@arm.linux.org.uk

Hi Stephen,

can I ask you please to include the following branch into linux-next:

git://linux-arm.org/linux-2.6-lp.git v7-cache-opt

It contains a patch implementing cache optimizations for ARM 32-bit v7
architectures, it was reviewed and tested but -next would give it wider
test coverage before it gets merged in the coming cycle, so please
include it as soon as you deem fit.

Thank you very much,
Lorenzo
