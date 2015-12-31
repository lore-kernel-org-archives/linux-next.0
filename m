From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm tree
Date: Thu, 31 Dec 2015 23:22:10 +1100
Message-ID: <20151231232210.7ab890f1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60777 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750991AbbLaMWN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Dec 2015 07:22:13 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Andrew,

After merging the akpm tree, today's linux-next build (powerpc
allyesconfig) failed like this:

sound/core/compress_offload.c: In function 'snd_compr_ioctl':
/home/sfr/next/next/sound/core/compress_offload.c:804:2: error: case label does not reduce to an integer constant
  case _IOC_NR(SNDRV_COMPRESS_GET_CODEC_CAPS):
  ^

I have no idea what caused that and have just left it broken for now.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
