From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: mmotm 2017-08-31-16-13 uploaded
Date: Fri, 1 Sep 2017 11:43:41 +1000
Message-ID: <20170901114341.1da24b37@canb.auug.org.au>
References: <59a8982c.FwLJY62HB+esikOu%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39911 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751238AbdIABno (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 31 Aug 2017 21:43:44 -0400
In-Reply-To: <59a8982c.FwLJY62HB+esikOu%akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, mhocko@suse.cz, broonie@kernel.org, =?UTF-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>

Hi Andrew,

On Thu, 31 Aug 2017 16:13:48 -0700 akpm@linux-foundation.org wrote:
>
> * mm-hmm-struct-hmm-is-only-use-by-hmm-mirror-functionality-v2-fix.patch

You should have dropped the above patch from me before applying the
below patch from J=C3=A9r=C3=B4me.

> * mm-hmm-fix-build-when-hmm-is-disabled.patch

I will do that in linux-next today.
--=20
Cheers,
Stephen Rothwell
