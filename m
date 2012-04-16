From: Cyrill Gorcunov <gorcunov@openvz.org>
Subject: Re: linux-next: manual merge of the akpm with the security tree
Date: Mon, 16 Apr 2012 10:08:12 +0400
Message-ID: <20120416060812.GA4115@moon>
References: <20120416150258.273e076e2d6e3b847d3dd9ca@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:40159 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751305Ab2DPGIS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Apr 2012 02:08:18 -0400
Content-Disposition: inline
In-Reply-To: <20120416150258.273e076e2d6e3b847d3dd9ca@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, James Morris <jmorris@namei.org>

On Mon, Apr 16, 2012 at 03:02:58PM +1000, Stephen Rothwell wrote:
> Hi Andrew,
> 
> Today's linux-next merge of the akpm tree got conflicts in kernel/sys.c
> and include/linux/prctl.h between commit 259e5e6c75a9 ("Add PR_{GET,SET}
> _NO_NEW_PRIVS to prevent execve from granting privs") from the security
> tree and patch "c/r: prctl: add ability to get clear_tid_address" from
> the akpm tree.
> 
> I fixed them up (see below) and can carry the fix as necessary.

Thanks, Stephen.

	Cyrill
