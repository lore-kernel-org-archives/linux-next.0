From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure in the powerpc allyesconfig build
Date: Mon, 5 Dec 2016 17:16:33 +1100
Message-ID: <20161205171633.4e0cc235@canb.auug.org.au>
References: <20161205162204.02c2c236@canb.auug.org.au>
        <20161205162431.71013317@canb.auug.org.au>
        <20161205164153.43c84010@roar.ozlabs.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59753 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750928AbcLEGQg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 5 Dec 2016 01:16:36 -0500
In-Reply-To: <20161205164153.43c84010@roar.ozlabs.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Nick,

On Mon, 5 Dec 2016 16:41:53 +1100 Nicholas Piggin <npiggin@gmail.com> wrote:
>
> In scripts/kallsyms.c, is there a table[i].sym string you can print?

=46rom a quick try, it printed nothing useful i.e. just some garbled
random characters.

--=20
Cheers,
Stephen Rothwell
