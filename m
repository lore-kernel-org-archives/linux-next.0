From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Fri, 28 Aug 2015 11:50:41 +1000
Message-ID: <20150828115041.037554b4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40314 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751030AbbH1Bun (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 27 Aug 2015 21:50:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ricard Wanderlof <ricard.wanderlof@axis.com>

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from sound/soc/codecs/ics43432.c:12:0:
sound/soc/codecs/ics43432.c:60:25: error: 'ics43432_dt_ids' undeclared here (not in a function)
 MODULE_DEVICE_TABLE(of, ics43432_dt_ids);
                         ^
include/linux/module.h:223:21: note: in definition of macro 'MODULE_DEVICE_TABLE'
 extern const typeof(name) __mod_##type##__##name##_device_table  \
                     ^
include/linux/module.h:223:27: error: '__mod_of__ics43432_dt_ids_device_table' aliased to undefined symbol 'ics43432_dt_ids'
 extern const typeof(name) __mod_##type##__##name##_device_table  \
                           ^ 
sound/soc/codecs/ics43432.c:60:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
 MODULE_DEVICE_TABLE(of, ics43432_dt_ids);
 ^

Caused by commit

  3b7ce99748f0 ("ASoC: ics43432: Add codec driver for InvenSense ICS-43432")

Not really build tested with CONFIG_OF set, right? :-(

I have reverted that commit for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
