From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Request inclusion of HYP mode cpu_resume fix into linux-next
Date: Thu, 6 Mar 2014 18:43:03 +0000
Message-ID: <20140306184303.GA31279@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:48424 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750829AbaCFSnM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 6 Mar 2014 13:43:12 -0500
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Christoffer Dall <christoffer.dall@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Russell King <linux@arm.linux.org.uk>

Hi Stephen,

can I ask you please to include the following branch into linux-next:

git://linux-arm.org/linux-2.6-lp.git arm-kvm-cpuresume

It contains a patch touching ARM PM core code that requires wider testing
coverage before I request a pull. It has been already publicly posted,
reviewed and tested.

Thank you very much,
Lorenzo
