From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the drm-intel tree with the
 drm-intel-fixes tree
Date: Thu, 24 Sep 2015 21:52:22 +1000
Message-ID: <20150924215222.3f0ecc40@canb.auug.org.au>
References: <20150924112516.1dc9d5d3@canb.auug.org.au>
	<876130dwke.fsf@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59946 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752318AbbIXLwY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 24 Sep 2015 07:52:24 -0400
In-Reply-To: <876130dwke.fsf@intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Jani,

On Thu, 24 Sep 2015 11:57:05 +0300 Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> That was the right thing to do.
> 
> The former commit is headed for v4.3, and there will have to be another
> version of it for -next. This will cause you another conflict, and you
> should resolve it with the same approach.

OK, thanks.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
