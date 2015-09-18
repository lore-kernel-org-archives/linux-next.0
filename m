From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Date: Fri, 18 Sep 2015 11:12:53 +1000
Message-ID: <20150918111253.2ae9ffb6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51145 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750792AbbIRBMz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Sep 2015 21:12:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wang Nan <wangnan0@huawei.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, Kan Liang <kan.liang@intel.com>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  tools/perf/ui/browsers/hists.c

between commit:

  bd315aab8a3a ("perf top: Fix segfault pressing -> with no hist entries")

from Linus' tree and commit:

  84734b06b630 ("perf hists browser: Zoom in/out for processor socket")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc tools/perf/ui/browsers/hists.c
index c04c60d4863c,380e9080991e..000000000000
--- a/tools/perf/ui/browsers/hists.c
+++ b/tools/perf/ui/browsers/hists.c
@@@ -1968,9 -2017,10 +2017,11 @@@ skip_annotation
  					  &options[nr_options], dso);
  		nr_options += add_map_opt(browser, &actions[nr_options],
  					  &options[nr_options],
 -					  browser->selection->map);
 +					  browser->selection ?
 +						browser->selection->map : NULL);
- 
+ 		nr_options += add_socket_opt(browser, &actions[nr_options],
+ 					     &options[nr_options],
+ 					     socked_id);
  		/* perf script support */
  		if (browser->he_selection) {
  			nr_options += add_script_opt(browser,
