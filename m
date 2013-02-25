From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] kbuild: Fix reading of .config in link-vmlinux.sh
Date: Mon, 25 Feb 2013 13:56:42 +0100
Message-ID: <512B5F8A.1060705@suse.cz>
References: <20130225215845.c0ec14a467aa6fe8e788e80e@canb.auug.org.au> <1361796898-19642-1-git-send-email-mmarek@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:46728 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757122Ab3BYM4o (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Feb 2013 07:56:44 -0500
In-Reply-To: <1361796898-19642-1-git-send-email-mmarek@suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, m.grzeschik@pengutronix.de

On 25.2.2013 13:54, Michal Marek wrote:
> The shell '.' command is not required to search the current directory as
> a fallback and in fact newer versions of bash in sh-mode do not do this.
> Force reading the file from the current directory if $KCONFIG_CONFIG
> contains no '/'.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Michal Marek <mmarek@suse.cz>
> ---
>  scripts/link-vmlinux.sh |    9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

I was able to reproduce the failure and this patch fixed it. So I am
going to push this in a couple of hours, so that tomorrow's linux-next
can include the latest kbuild changes.

Michal
