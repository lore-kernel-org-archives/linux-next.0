From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the v4l-dvb tree
Date: Wed, 12 Aug 2015 13:24:27 +1000
Message-ID: <20150812132427.300e4bca@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60594 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932684AbbHLDY3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 11 Aug 2015 23:24:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>

Hi Mauro,

After merging the v4l-dvb tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

ERROR (phandle_references): Reference to non-existent node or label "ssc2"

ERROR: Input tree has errors, aborting (use -f to force output)
scripts/Makefile.lib:293: recipe for target 'arch/arm/boot/dts/stih410-b2120.dtb' failed
ERROR (phandle_references): Reference to non-existent node or label "ssc2"

ERROR: Input tree has errors, aborting (use -f to force output)
scripts/Makefile.lib:293: recipe for target 'arch/arm/boot/dts/stih407-b2120.dtb' failed

Caused by commit

  5d8877b6ae0d ("[media] ARM: DT: STi: STiH407: Add c8sectpfe LinuxDVB DT node")

I have used the v4l-dvb tree from next-20150810 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
