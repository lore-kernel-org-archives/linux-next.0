From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] mm: add config NUMA stub to all architectures
Date: Fri, 17 Feb 2012 12:30:37 -0800
Message-ID: <20120217123037.ecfc5dd9.akpm@linux-foundation.org>
References: <4F3E42E0.4030108@openvz.org>
	<20120217120815.25909.15632.stgit@zurg>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:48883 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752125Ab2BQUaj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 17 Feb 2012 15:30:39 -0500
In-Reply-To: <20120217120815.25909.15632.stgit@zurg>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Konstantin Khlebnikov <khlebnikov@openvz.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>

On Fri, 17 Feb 2012 16:08:15 +0400
Konstantin Khlebnikov <khlebnikov@openvz.org> wrote:

> Config NUMA must be defined for all architectures,
> otherwise IS_ENABLED(CONFIG_NUMA) does not work.
> Some arch-specific Kconfig already has this stub.
> This patch adds it to all remaining.

It would be better to teach IS_ENABLED() to handle this situation.  I
don't think there's a way of doing this with cpp :(

This limitation makes IS_ENABLED pretty dangerous, doesn't it?  It
makes it very easy to introduce build breakage with unexpected Kconfig
combinations.
