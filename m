From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the chrome-platform tree
Date: Thu, 8 Oct 2015 13:34:43 +1100
Message-ID: <20151008133443.1fde8318@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38221 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751336AbbJHCeq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 7 Oct 2015 22:34:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Emilio =?UTF-8?B?TMOzcGV6?= <emilio.lopez@collabora.co.uk>, Javier Martinez Canillas <javier@osg.samsung.com>

Hi Olof,

After merging the chrome-platform tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/platform/chrome/cros_ec_vbc.c:136:2: error: unknown field 'is_bin_visible' specified in initializer
  .is_bin_visible = cros_ec_vbc_is_visible,
  ^

Caused by commit

  01e7e432df74 ("platform/chrome: Support reading/writing the vboot context")

I have used the chrome-platform tree from next-20151007 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
