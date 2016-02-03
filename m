From: Michal Hocko <mhocko@kernel.org>
Subject: Re: mmotm 2016-02-02-17-08 uploaded
Date: Wed, 3 Feb 2016 13:16:46 +0100
Message-ID: <20160203121646.GE6757@dhcp22.suse.cz>
References: <56b1532f.mwdov6KmWTCFuZoC%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:34436 "EHLO
	mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753090AbcBCMQt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Feb 2016 07:16:49 -0500
Content-Disposition: inline
In-Reply-To: <56b1532f.mwdov6KmWTCFuZoC%akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, broonie@kernel.org


On Tue 02-02-16 17:09:03, Andrew Morton wrote:
> A git tree which contains the memory management portion of this tree is
> maintained at git://git.kernel.org/pub/scm/linux/kernel/git/mhocko/mm.git
> by Michal Hocko.  It contains the patches which are between the
> "#NEXT_PATCHES_START mm" and "#NEXT_PATCHES_END" markers, from the series
> file, http://www.ozlabs.org/~akpm/mmotm/series.

JFYI DAX changes are really hard to track properly because there are
some changes coming from different trees, the code changes permanently
and it is really hard to see what is the current base so I have skipped
those fixes which depend on the code which is outside of mmotm patches +
linus tree.

If you want to develop for DAX or something that might clash there
please use linux-next instead.
-- 
Michal Hocko
SUSE Labs
