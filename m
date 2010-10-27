From: Pekka Enberg <penberg@kernel.org>
Subject: Re: linux-next: build failure after merge of the slab tree
Date: Wed, 27 Oct 2010 10:29:22 +0300
Message-ID: <AANLkTinVmdWkG5zDgbPN0V=2Z2rQM=oksdxevcS_xdmz@mail.gmail.com>
References: <20101027113341.e77169cc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:42316 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752117Ab0J0H3Y convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 27 Oct 2010 03:29:24 -0400
In-Reply-To: <20101027113341.e77169cc.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Oct 27, 2010 at 3:33 AM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi all,
>
> After merging the slab tree, today's linux-next build (x86_64 allmodc=
onfig)
> failed like this:
>
> gcc: /scratch/sfr/next/Documentation/vm/slabinfo.c: No such file or d=
irectory
> gcc: no input files
>
> Caused by commit f5ac4916e9840292edd33c7a52b10364526547f3 ("slub: mov=
e
> slabinfo.c to tools/slub/slabinfo.c"). =A0Missing update to
> Documentation/vm/Makefile?

Oh, we have one of those. Sorry about the breakage, I'll fix it up late=
r today.
