From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: Tree for Feb 5
Date: Tue, 5 Feb 2013 10:18:17 +0100
Message-ID: <CA+icZUWzRaBAOgA4oQ11TJz+5oDTQW0VzhPVCNn1k9MK8RFmhQ@mail.gmail.com>
References: <20130205163454.83875fee3a8724fbec4d0987@canb.auug.org.au>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vb0-f43.google.com ([209.85.212.43]:39276 "EHLO
	mail-vb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754033Ab3BEJSS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Feb 2013 04:18:18 -0500
In-Reply-To: <20130205163454.83875fee3a8724fbec4d0987@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Tue, Feb 5, 2013 at 6:34 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Changes since 20130204:
>
> The powerpc tree still had a build failure.
>
> The nfsd tree lost its build.
>
> The sound-asoc tree gained a build failure so I used the version from
> next-20130204.
>

Several people ask for inclusion of [1] after having confirmed it
fixes their issue.
One guy pointed to the fact the fix [2] is pending in mmot*s* tree.
When will it go to Linux-Next?
Read the thread in [3] for more details.

Thanks.

- Sedat -

[1] http://marc.info/?l=linux-mm&m=135929599505624&w=2
[2] http://ozlabs.org/~akpm/mmots/broken-out/swap-make-each-swap-partition-have-one-address_space-fix-fix.patch
[3] http://marc.info/?t=135978145900001&r=1&w=2
