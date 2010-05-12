From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] ibft: Use IBFT_SIGN instead of open-coding the search
 string.
Date: Wed, 12 May 2010 12:33:23 -0700
Message-ID: <20100512123323.2badc5a7.akpm@linux-foundation.org>
References: <4BEAB683.8040600@redhat.com>
	<1273674308-9366-1-git-send-email-pjones@redhat.com>
	<201005121035.33199.konrad@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:38099 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757129Ab0ELTdo (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 12 May 2010 15:33:44 -0400
In-Reply-To: <201005121035.33199.konrad@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Konrad Rzeszutek Wilk <konrad@kernel.org>
Cc: Peter Jones <pjones@redhat.com>, Len Brown <lenb@kernel.org>, linux-kernel@vger.kernel.org, gpxe-devel@etherboot.org, linux-next@vger.kernel.org

On Wed, 12 May 2010 10:35:32 -0400
Konrad Rzeszutek Wilk <konrad@kernel.org> wrote:

> Please also consider this patch with the others I've sent.
> I've put this (and the other ones) on:
> 
>  git://git.kernel.org/pub/scm/linux/kernel/git/konrad/ibft-2.6.git dev.ibft

Well, you're the maintainer and you have a git tree and I cannot tell
the difference between an IBFT and a bar of soap.  So I suggest that
you ask Stephen to permanently include your git tree in linux-next and
send Linus a pull request in the 2.6.35-rc1 merge window like so many
other people do?
