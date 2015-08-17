From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the security tree
Date: Mon, 17 Aug 2015 16:04:58 +1000
Message-ID: <20150817160458.0c2bb25a@canb.auug.org.au>
References: <20150817152953.355a9d4f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47286 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750770AbbHQGFA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 17 Aug 2015 02:05:00 -0400
In-Reply-To: <20150817152953.355a9d4f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>, David Woodhouse <David.Woodhouse@intel.com>

Hi all,

On Mon, 17 Aug 2015 15:29:53 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After a bit of digging, I installed libssl-dev on my Debian build
> machines.

Is this worth a mention in Documentation/Changes along with all the
other prerequisites?

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
