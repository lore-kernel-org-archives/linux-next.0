From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the sound-asoc tree
Date: Tue, 6 Dec 2016 11:11:23 +1100
Message-ID: <20161206111123.24a332c1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54211 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751802AbcLFALZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 5 Dec 2016 19:11:25 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mengdong Lin <mengdong.lin@linux.intel.com>

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

sound/soc/soc-topology.c: In function 'soc_tplg_dapm_widget_create':
sound/soc/soc-topology.c:1566:36: warning: 'kcontrol_type' may be used uninitialized in this function [-Wmaybe-uninitialized]
  widget->dobj.widget.kcontrol_type = kcontrol_type;
                                    ^

Introduced by commit

  eea3dd4f1247 ("ASoC: topology: Only free TLV for volume mixers of a widget")

-- 
Cheers,
Stephen Rothwell
